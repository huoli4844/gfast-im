package controller

import (
	"context"
	"errors"
	"expvar"
	"fmt"
	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gtime"
	"github.com/gogf/gf/v2/util/gconv"
	"github.com/tiger1103/gfast/v3/api/v1/chat"
	"github.com/tiger1103/gfast/v3/api/v1/system"
	"github.com/tiger1103/gfast/v3/internal/app/chat/dao"
	"github.com/tiger1103/gfast/v3/internal/app/chat/model"
	"github.com/tiger1103/gfast/v3/internal/app/chat/model/entity"
	"github.com/tiger1103/gfast/v3/internal/app/common/consts"
	"github.com/tiger1103/gfast/v3/internal/app/common/service"
	systemService "github.com/tiger1103/gfast/v3/internal/app/system/service"
	chartLogic "github.com/tiger1103/gfast/v3/plugins/chat/logic"
	chartServer "github.com/tiger1103/gfast/v3/plugins/chat/server"
	"math/rand"
	"strconv"
	"time"
)

var ChatRoom *chartServer.Chart

func init() {
	ctx := context.TODO()
	ChatRoom = chartServer.NewChart()
	ChatRoom.HandleConnect(func(user *chartLogic.User) {
		if user.UID == "" {
			g.Log().Info(ctx, "ID必须")
			user.Close()
			return
		}

		if ChatRoom.Hub.HasUser(user.UID) {
			m := fmt.Sprintf("ID:%s,用户已在线 ", user.UID)
			g.Log().Info(ctx, m)
			user.Close()
			return
		}
		g.Log().Info(ctx, fmt.Sprintf("ID:%s,%s", user.UID, "the webSocket connection is successful"))
	})

	ChatRoom.HandleError(func(user *chartLogic.User, err error) {
		m := fmt.Sprintf("ID:%s,%s", user.UID, "chat err:"+err.Error())
		g.Log().Info(ctx, m)
	})

	ChatRoom.HandleDisconnect(func(user *chartLogic.User) {
		g.Log().Info(ctx, fmt.Sprintf(" ID:%s,%s", user.UID, "the webSocket connection is closed"))
	})

	ChatRoom.HandleMessage(func(user *chartLogic.User, message chartLogic.Message) {
		if message.Type == 0 {
			messageListSuper := model.NewMessageListSuper()
			messageListSuper.From = message.User.UIDToUint64()
			messageListSuper.Mtype = message.Type
			messageListSuper.Ctype = message.CType
			messageListSuper.MsgTime = gtime.New(message.MsgTime)
			messageListSuper.RoomId = message.RoomId
			err := messageListSuper.Add(message.Content, message.AtsToUint64()...)
			if err != nil {
				g.Log().Error(context.TODO(), err)
			}
		}
	})

	//// test
	//ticker := time.Tick(5 * time.Second)
	//go func() {
	//	for now := range ticker {
	//		ChatRoom.Hub.Broadcast(logic.NewSysMessage("from server(chat): now time is " + now.String()))
	//	}
	//}()

	expvar.Publish("broadcaster.users", expvar.Func(calcBroadcasterUsers))
}

func calcBroadcasterUsers() interface{} {
	return ChatRoom.UserListHandleFunc()
}

// 房间标识前缀
const RootIdentifyPrefix = "roomIdentify_"

type chatController struct{}

var ChatController = new(chatController)

func (c *chatController) WebSocketHandle(ctx context.Context, req *chat.ChatWsReq) (res *chat.ChatWsRes, err error) {
	loginUserRes := systemService.Context().GetLoginUser(ctx).LoginUserRes
	sysUserSuper := model.SysUserSuper{}
	_ = sysUserSuper.Get(loginUserRes.Id)
	if sysUserSuper.IsEmpty() {
		err = errors.New("找不到登录用户")
		return
	}
	var userId string
	payload := make(map[string]interface{})
	userId = gconv.String(sysUserSuper.Id)
	payload["uid"] = userId
	payload["nickname"] = sysUserSuper.UserNickname
	err = ChatRoom.WebSocketHandleFunc(g.RequestFromCtx(ctx).Response.Writer, g.RequestFromCtx(ctx).Request, userId, payload)
	if err != nil {
		g.Log().Error(ctx, err)
		return
	}
	return
}

// 获取在线用户
func (c *chatController) OnlineUserList(ctx context.Context, req *chat.OnlineUserListReq) (res *chat.OnlineUserListRes, err error) {
	res = new(chat.OnlineUserListRes)
	res.UserList = ChatRoom.UserListHandleFunc()
	return
}

// 上传图片
func (c *chatController) SingleImg(ctx context.Context, req *system.UploadSingleImgReq) (res *system.UploadSingleRes, err error) {
	file := req.File
	v, _ := g.Cfg().Get(ctx, "upload.default")
	response, err := service.Upload().UploadFile(ctx, file, consts.CheckFileTypeImg, v.Int())
	if err != nil {
		return
	}
	res = &system.UploadSingleRes{
		UploadResponse: response,
	}
	// 上传第三方
	return
}

// 获取聊天记录
func (c *chatController) HistoryChat(ctx context.Context, req *chat.HistoryChatReq) (res *chat.HistoryChatRes, err error) {
	messageListSuperList := model.NewMessageListSuperList()
	err = messageListSuperList.HistoryMessage(req.MessageListReq)
	if err != nil {
		return
	}
	messageListSuperList.LoadMessageContentSuper().LoadFromSysUser()
	res = &chat.HistoryChatRes{
		MessageListSuperList: messageListSuperList,
	}
	return
}

// 获取用户列表
func (c *chatController) GetUserList(ctx context.Context, req *chat.UserListReq) (res *chat.UserListRes, err error) {
	sysUserSuperList := model.NewSysUserSuperList()
	err = sysUserSuperList.Find(func(m *gdb.Model) *gdb.Model {
		if req.NotSelf == 1 {
			loginUserRes := systemService.Context().GetLoginUser(ctx).LoginUserRes
			m = m.Where("id <> ?", loginUserRes.Id)
		}
		return m
	})
	if err != nil {
		return
	}
	res = &chat.UserListRes{
		UserList: sysUserSuperList,
	}
	return
}

// 获取房间列表
func (c *chatController) GetRoomList(ctx context.Context, req *chat.GetRoomListReq) (res *chat.GetRoomListRes, err error) {
	loginUserRes := systemService.Context().GetLoginUser(ctx).LoginUserRes
	messageRoomList := model.NewMessageRoomSuperList()
	err = messageRoomList.Find(func(m *gdb.Model) *gdb.Model {
		m = m.Order("created_at desc").Where("id in (?)", g.DB().Model("message_room_member").Where("user_id = ?", loginUserRes.Id).Fields("room_id"))
		return m
	})
	messageRoomList.LoadMessageRoomMemberSuperList().AllMessageRoomMemberSuperList().LoadSysUserSuper()
	res = &chat.GetRoomListRes{
		MessageRoomSuperList: messageRoomList,
	}
	return
}

// 创建房间
func (c *chatController) CreateRoom(ctx context.Context, req *chat.CreateRoomReq) (res *chat.CreateRoomRes, err error) {
	res = &chat.CreateRoomRes{}
	loginUserRes := systemService.Context().GetLoginUser(ctx).LoginUserRes
	err = g.DB().Transaction(ctx, func(ctx context.Context, tx gdb.TX) (err error) {
		r := rand.New(rand.NewSource(time.Now().UnixNano()))
		roomName := fmt.Sprintf("%s_%d", req.Name, r.Intn(999))
		var lastId int64
		lastId, err = dao.MessageRoom.Ctx(ctx).TX(tx).Data(g.Map{
			"name": roomName,
		}).InsertAndGetId()
		if err != nil {
			return
		}
		identify := fmt.Sprintf("%s%d", RootIdentifyPrefix, lastId)
		_, err = dao.MessageRoom.Ctx(ctx).TX(tx).Where("id =?", lastId).Data(g.Map{
			"identify": identify,
		}).Update()
		if err != nil {
			return
		}

		// 添加群成员,包含创建人
		sysUserSuperList := model.NewSysUserSuperList()
		err = sysUserSuperList.Find(func(m *gdb.Model) *gdb.Model {
			return m.Where("id in (?)", append([]uint64{loginUserRes.Id}, req.UserIds...)).FieldsEx("user_password,user_salt,remark")
		})
		if err != nil {
			return
		}
		if sysUserSuperList.Len()-1 != len(req.UserIds) {
			err = errors.New("非法的用户ID")
		}

		lastIdTemp := gconv.Uint64(lastId)
		var messageRoomMemberSuperList model.MessageRoomMemberSuperList
		for _, v := range sysUserSuperList {
			messageRoomMemberSuperList = append(messageRoomMemberSuperList, &model.MessageRoomMemberSuper{
				MessageRoomMember: entity.MessageRoomMember{
					RoomId: lastIdTemp,
					UserId: v.Id,
				},
			})
		}

		_, err = dao.MessageRoomMember.Ctx(ctx).TX(tx).Data(messageRoomMemberSuperList).Insert()
		if err != nil {
			return
		}

		res.Identify = identify
		res.RoomName = roomName
		res.UserList = sysUserSuperList

		// 通知其他群成员
		notifyUserIds := make([]chartLogic.UID, 0, len(req.UserIds))
		for _, item := range req.UserIds {
			notifyUserIds = append(notifyUserIds, chartLogic.UID(strconv.FormatUint(item, 10)))
		}

		var notifyMessage struct {
			Id    string `json:"id"`
			Name  string `json:"name"`
			Users []struct {
				Id       string `json:"id"`
				Avatar   string `json:"avatar"`
				Username string `json:"username"`
			} `json:"users"`
		}

		notifyMessage.Id = identify
		notifyMessage.Name = roomName

		for _, item := range sysUserSuperList {
			notifyMessage.Users = append(notifyMessage.Users, struct {
				Id       string `json:"id"`
				Avatar   string `json:"avatar"`
				Username string `json:"username"`
			}{
				Id:       strconv.FormatUint(item.Id, 10),
				Avatar:   item.Avatar,
				Username: item.UserNickname,
			})
		}
		ChatRoom.Hub.Broadcast(chartLogic.NewAddRoomMessage(identify, notifyUserIds, notifyMessage))
		return nil
	})
	return
}

// 修改房间名称
func (c *chatController) UpdateRoomName(ctx context.Context, req *chat.UpdateRoomNameReq) (res *chat.UpdateRoomNameRes, err error) {
	messageRoomSuper := model.NewMessageRoomSuper()
	err = messageRoomSuper.FindByIdentify(req.Id)
	if err != nil {
		return
	}
	if messageRoomSuper.IsEmpty() {
		err = errors.New("找不到群聊")
		return
	}
	messageRoomSuper.Name = req.Name
	err = messageRoomSuper.Update("name")
	if err != nil {
		return
	}

	return
}

// 退出群聊
func (c *chatController) Quit(ctx context.Context, req *chat.QuitRoomReq) (res *chat.QuitRoomRes, err error) {
	messageRoomSuper := model.NewMessageRoomSuper()
	err = messageRoomSuper.FindByIdentify(req.Identify)
	if err != nil {
		return
	}
	if messageRoomSuper.IsEmpty() {
		err = errors.New("找不到群聊")
		return
	}
	messageRoomSuper.Collection().LoadMessageRoomMemberSuperList()

	var member *model.MessageRoomMemberSuper
	if member = messageRoomSuper.MessageRoomMemberSuperList.Search(req.QuitUserId); member == nil {
		err = errors.New("用户不存在")
		return
	}

	i, _ := member.Delete()
	if messageRoomSuper.MessageRoomMemberSuperList.Len() == 1 && i > 0 {
		messageRoomSuper.Delete()
	}
	return
}

// 添加群成员
func (c *chatController) AddGroupMember(ctx context.Context, req *chat.AddGroupMemberReq) (res *chat.AddGroupMemberRes, err error) {
	messageRoomSuper := model.NewMessageRoomSuper()
	err = messageRoomSuper.FindByIdentify(req.Identify)
	if err != nil {
		return
	}
	if messageRoomSuper.IsEmpty() {
		err = errors.New("找不到群聊")
		return
	}
	sysUserSuperList := model.NewSysUserSuperList()
	err = sysUserSuperList.Find(func(m *gdb.Model) *gdb.Model {
		return m.Where("id in (?)", req.UserIds).FieldsEx("user_password,user_salt,remark")
	})
	if err != nil {
		return
	}
	if sysUserSuperList.Len() != len(req.UserIds) {
		err = errors.New("非法的用户ID")
	}
	var messageRoomMemberSuperList model.MessageRoomMemberSuperList
	for _, v := range req.UserIds {
		messageRoomMemberSuperList = append(messageRoomMemberSuperList, &model.MessageRoomMemberSuper{
			MessageRoomMember: entity.MessageRoomMember{
				RoomId: messageRoomSuper.Id,
				UserId: gconv.Uint64(v),
			},
		})
	}

	_, err = dao.MessageRoomMember.Ctx(ctx).Data(messageRoomMemberSuperList).Replace()
	if err != nil {
		return
	}
	res = &chat.AddGroupMemberRes{}
	res.UserList = sysUserSuperList
	return
}
