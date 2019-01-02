//
//  ALCContants.h
//  ALCameraSDK
//
//  Created by Allcam on 2016/11/28.
//  Copyright © 2016年 AllcamRW. All rights reserved.
//

#import <Foundation/Foundation.h>




#pragma mark - ACL业务  枚举类型

typedef NS_ENUM(NSInteger , AuthType)
{
    UserNameAndPass,      //用户名密码鉴权
    AppIdAndAppKey      //appId鉴权
};

typedef NS_ENUM(NSInteger , ALCVcuListDescType)
{
    ALCVcuListDescTypeGroup,      //全部，包括组织和分组信息0
    ALCVcuListDescTypeCamera      //仅仅返回镜头信息1
};



typedef NS_ENUM(NSInteger, ALCStreamType)
{
    
    ALCStreamTypeMain,            //0 表示主码流
    ALCStreamTypePro,             //1 表示子码流
    ALCStreamTypeAir              //2 表示字码流
};

typedef NS_ENUM(NSInteger, ALCURLType)
{
    
    ALCURLTypeRtsp,               //1 表示rtsp格式的URL
    ALCURLTypeHttp,               //2 表示http格式的URL
    ALCURLTypeRtmp                //3 表示rtmp格式的URL
};


typedef NS_ENUM(NSInteger, ALCPTZControlDirection)
{
    
    ALCPTZDirectionUP,            //@"PTZ_UP";
    ACLPTZDirectionDown,          //@"PTZ_DOWN"
    ACLPTZDirectionRight,         //@"PTZ_LEFT"
    ACLPTZDirectionLeft           //@"PTZ_RIGHT"
};



typedef NS_ENUM(NSInteger, ALCUploadReportType)
{
    
    REGISTER,      //@"register";
    LIVE,          //@"live"
    VOD,           //@"vod"
    DOWNLOAD,      //@"download"
    PTZCONTROL,    //@"ptzcontrol"
    CAPTURE,       //@"capture"
    OTHER          //@"other"
    
};





typedef enum : NSUInteger {
    ALCErrorTypeParameterError=9, // 参数错误
    ALCErrorTypeUserNoLiveRight=13,//无实时浏览权限
    ALCErrorTypeUserNoRecordRight=16,//无前端录像查看权限
    ALCErrorTypeClientNotActive=18,//用户所属客户未激活
    ALCErrorTypeClientIsStopped=19,//用户所属客户已被停用
    ALCErrorTypeClientDelete=20,//用户所属客户已被删除
    ALCErrorTypeUserNotExist=21,//用户不存在
    ALCErrorTypeCameraOffline = 3000006,//设备不在线
    ALCErrorTypePraseFail = 3000007,//协议解析错误
    ALCErrorTypeCameraNotExist=3000017,//设备不存在
    ALCErrorTypeCameraStopped=3000018,//设备停用
    
} ALCErrorType;




#pragma mark - ALC业务 - 数据模型

/**
 *   获取设备列表 -  响应
 */

/* 设备组信息 */
@protocol ALCGroup
@end
@interface ALCGroup : NSObject
@property (nonatomic , strong) NSString *groupId;
@property (nonatomic , strong) NSString *groupName;
@property (nonatomic , strong) NSString *groupType;
@property (nonatomic , strong) NSString *parentId;
@end

/* 镜头信息 */
@protocol ALCCamera
@end
@interface ALCCamera : NSObject
@property (nonatomic , strong) NSString *name;
@property (nonatomic , strong) NSString *cameraId;
@property (nonatomic , strong) NSString *status;
@property (nonatomic , strong) NSString *groupId;
@property (nonatomic , strong) NSString *ptzType;
@end

/* 设备信息 */
@protocol ALCDevice
@end
@interface ALCDevice : NSObject
@property (nonatomic , strong) NSString *name;
@property (nonatomic , strong) NSString *devId;
@property (nonatomic , strong) NSString *status;
@property (nonatomic , strong) NSArray <ALCCamera> *cameraList;
@end

/* 设备列表 */
@interface ALCVcuList : NSObject
@property (nonatomic , strong) NSArray <ALCGroup>  *GroupList;
@property (nonatomic , strong) NSArray <ALCDevice> *DevList;

- (instancetype)initWithModel:(id)model developerPassword:(NSString *)password;
@end




/**
 *  设备相关 
 */
/* 设备信息 */
@protocol ALCDeviceInfo
@end
@interface ALCDeviceInfo : NSObject
@property (nonatomic , strong) NSString *userID;
@property (nonatomic , strong) NSString *name;
@property (nonatomic , strong) NSString *userName;
@property (nonatomic , strong) NSString *eMail;
@property (nonatomic , strong) NSString *mobile;
@property (nonatomic , strong) NSString *sex;

- (instancetype)initWithModel:(id)model developerPassword:(NSString *)password;
@end




/**
 *  云控制相关
 */
@protocol ALCControlInfo
@end
@interface ALCControlInfo : NSObject
@property (nonatomic , strong) NSString *cameraId;
@property (nonatomic , strong) NSString *opCode;
@property (nonatomic , strong) NSString *param1;
@property (nonatomic , strong) NSString *param2;

- (instancetype)initWithModel:(id)model developerPassword:(NSString *)password;
@end





/**
 *  告警相关
 */
@protocol ALCPageInfoAlarm
@end
@interface ALCPageInfoAlarm : NSObject
@property (nonatomic, assign) NSInteger pageNum;
@property (nonatomic, assign) NSInteger pageSize;

- (instancetype)initWithModel:(id)model developerPassword:(NSString *)password;
@end


@protocol ALCAlarmSearchInfo
@end
@interface ALCAlarmSearchInfo : NSObject
@property (nonatomic, strong) NSArray *typeList;
@property (nonatomic , strong) NSString *BeginTime;
@property (nonatomic , strong) NSString *EndTime;
@property (nonatomic , strong) NSArray  *DevList;
@property (nonatomic , strong) NSString *confirmState;

@end

@protocol ALCPageInfoJM
@end
@interface ALCPageInfoJM : NSObject
@property (nonatomic, assign) NSInteger pageNum;
@property (nonatomic, assign) NSInteger pageSize;
@property (nonatomic, assign) NSInteger totalNum;

- (instancetype)initWithModel:(id)model developerPassword:(NSString *)password;

@end

/* 告警列表 */
@interface ALCAlarmListJM : NSObject
@property (nonatomic, strong) ALCPageInfoAlarm *PageInfo;
@property (nonatomic , strong) ALCAlarmSearchInfo  *AlarmSearch;
@end


@protocol ALCAlarmList
@end
@interface ALCAlarmList : NSObject
@property (nonatomic , strong) NSString *devId;
@property (nonatomic , strong) NSString *alarmId;
@property (nonatomic , strong) NSString *alarmDevId;
@property (nonatomic , strong) NSString *alarmType;
@property (nonatomic , strong) NSString *alarmTime;
@property (nonatomic , strong) NSString *clearTime;
@property (nonatomic , strong) NSString *alarmState;
@property (nonatomic , strong) NSString *confirmState;
@property (nonatomic , strong) NSString *addition;
@property (nonatomic , strong) NSString *alarmLevel;
@property (nonatomic , strong) NSString *alarmLevelName;

- (instancetype)initWithModel:(id)model developerPassword:(NSString *)password;
@end

@interface ALCAlarmListRspJM : NSObject
@property (nonatomic , strong) ALCPageInfoJM * PageInfo;
@property (nonatomic , strong) NSArray          *AlarmList;

- (instancetype)initWithModel:(id)model developerPassword:(NSString *)password;
@end













/**
 *  录像相关
 */


@protocol ALCVodInfo
@end
@interface ALCVodInfo : NSObject
@property (nonatomic , strong) NSString *ContentID;
@property (nonatomic , strong) NSString *CameraID;
@property (nonatomic , strong) NSString *BeginTime;
@property (nonatomic , strong) NSString *EndTime;
@property (nonatomic , strong) NSString *nvrCode;

@end



@interface ALCVideoPlayRspJM : NSObject

@property (nonatomic , strong) NSString *objID;
@property (nonatomic , strong) NSString *downloadUrl;
@property (nonatomic , strong) NSString *hlsUrl;
@property (nonatomic , strong) NSString *rtmpUrl;
@property (nonatomic , strong) NSString *htmlUrl;

- (instancetype)initWithModel:(id)model developerPassword:(NSString *)password;
@end



@interface ALCVideoURLRspJM : NSObject

@property (nonatomic , strong) NSString *objID;
@property (nonatomic , strong) NSString *hlsUrl;
@property (nonatomic , strong) NSString *rtmpUrl;
@property (nonatomic , strong) NSString *htmlUrl;

- (instancetype)initWithModel:(id)model developerPassword:(NSString *)password;
@end




/**
 *  获取录像列表----业务数据模型
 */

//TO DO  这个数据模型有疑问，等到Java开发 调试的时候 一并确定数据结构
//-(instancetype)initWthPageInfo:(PageInfo *)pageInfo cameraListInfo:(CameraListInfo *)cameraListInfo searchInfo:(SearchInfo *)searchInfo;
@protocol ALCPageInfo
@end
@interface ALCPageInfo : NSObject
@property (nonatomic, assign) NSInteger pageNum;
@property (nonatomic, assign) NSInteger pageSize;
@end


@protocol ALCCameraListInfo
@end
@interface ALCCameraListInfo : NSObject
@property (nonatomic , strong) NSString *cameraId;
@end


@protocol ALCEventListInfo
@end
@interface ALCEventListInfo : NSObject
@property (nonatomic , strong) NSString *Event;
@end


@protocol ALCSearchInfo
@end
@interface ALCSearchInfo : NSObject
@property (nonatomic , strong) NSString         *from;
@property (nonatomic , strong) NSString         *beginTime;
@property (nonatomic , strong) NSString         *endTime;
@property (nonatomic , strong) NSArray * EventList;
@end



@interface ALCVideoListJM : NSObject
@property (nonatomic , strong) ALCPageInfo       *PageInfo;
@property (nonatomic , strong) NSArray *CameraList;
@property (nonatomic , strong) ALCSearchInfo     *SearchInfo;
@end


@protocol ALCRecordList
@end
@interface ALCRecordList : NSObject
@property (nonatomic , strong) NSString *contentId;
@property (nonatomic , strong) NSString *cameraId;
@property (nonatomic , strong) NSString *event;
@property (nonatomic , strong) NSString *beginTime;
@property (nonatomic , strong) NSString *endTime;
@property (nonatomic , strong) NSString *contentSize;

- (instancetype)initWithModel:(id)model developerPassword:(NSString *)password;

@end

@interface ALCVideoListRspJM : NSObject
@property (nonatomic , strong) ALCPageInfoJM *PageInfo;
@property (nonatomic , strong) NSArray  *RecordList;

- (instancetype)initWithModel:(id)model developerPassword:(NSString *)password;

@end
