//
//  ALCameraSDK.h
//  ALCTest
//
//  Created by Allcam on 2016/11/14.
//  Copyright © 2016年 AllcamRW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
//#import <ALCameraSDK/ALCContants.h>
#import "ALCContants.h"









@protocol ALCameraDelegate;


@interface ALCameraSDK : NSObject


#pragma mark - 基本功能

/**
 *  启动SDK
 *
 *  @param appid     设置app的appId，此appId从网站获取
 *  @param appKey    设置app的appKey，此appKey从网站获取
 *  @param appSecret 设置app的appSecret，此appSecret从网站获取
 *  @param delegate  回调代理delegate
 */
+ (void)startSdkWithAuthType:(AuthType)authType AppId:(NSString *)appid
                   appKey:(NSString *)appKey
                  baseUrl:(NSString *)baseUrl
                 delegate:(id<ALCameraDelegate>)delegate;


/**
 *  获取直播URL
 *
 *  @param cameraID   设备ID
 *  @param streamType 码流类型
 *  @param urlType    URL类型
 *  @param success
 *  @param failure
 
  ALCErrorType 有已经定义的错误类型
 */
+ (void)getPlayUrlWithCameraID:(NSString *)cameraID
                    streamType:(ALCStreamType)streamType
                       urlType:(ALCURLType)urlType
                  successBlock:(void(^)(NSString *URL))success
                  failureBlock:(void(^)(NSError *error))failure;




/**
 *  获取设备列表
 *
 *  @param type
 *  @param success
 *  @param failure
 */
+ (void)getVcuListWithType:(ALCVcuListDescType)type
              successBlock:(void(^)(ALCVcuList *msgBody))success
              failureBlock:(void(^)(NSError *error))failure;





//#pragma mark - 告警功能
//
///**
// *  订阅告警
// *
// *  @param AlarmType 告警类型
// *  @param beginTime 订阅开始时间
// *  @param endTime   订阅结束时间
// *  @param reportUrl unknow
// *  @param devList   订阅告警的设备列表(数组)
// *  @param success
// *  @param failure
// */
+ (void)subAlarmWithType:(NSString *)AlarmType
               beginTime:(NSString *)beginTime
                 endTime:(NSString *)endTime
               reportUrl:(NSString *)reportUrl
                  evList:(NSArray  *)devList
            successBlock:(void(^)())success
            failureBlock:(void(^)(NSError *error))failure;
//
//
//
///**
// *  订阅告警推送
// *
// *  @param AlarmType 告警类型
// *  @param beginTime 订阅开始时间
// *  @param endTime   订阅结束时间
// *  @param reportUrl unknow
// *  @param devList   <NSString *>订阅告警的设备列表(数组)
// *  @param success
// *  @param failure
// */
+ (void)subPushAlarmWithAlarmType:(NSString *)AlarmType
                        beginTime:(NSString *)beginTime
                          endTime:(NSString *)endTime
                        reportUrl:(NSString *)reportUrl
                           evList:(NSArray *)devList
                     successBlock:(void(^)())success
                     failureBlock:(void(^)(NSError *error))failure;
//
//
//
///**
// *   获取告警列表
// *
// *  @param pageInfo    告警查询参数
// *  @param AlarmSearch 告警查询参数
// *  @param success
// *  @param failure     
// */
+ (void)getAlarmListWithPageInfo:(ALCPageInfoAlarm *)pageInfo
                 alarmSearchInfo:(ALCAlarmSearchInfo *)AlarmSearch
                    successBlock:(void(^)(ALCAlarmListRspJM * model))success
                    failureBlock:(void(^)(NSError *error))failure;





#pragma mark - 录像功能

/**
 *  获取录像列表
 *
 *  @param pageInfo
 *  @param cameraListInfo
 *  @param searchInfo
 *  @param success
 *  @param failure
 */
+ (void)getVideoListWthPageInfo:(ALCPageInfo *)pageInfo
                 cameraList:(NSArray *)cameraList
                     searchInfo:(ALCSearchInfo *)searchInfo
                   successBlock:(void(^)(ALCVideoListRspJM *msgBody))success
                   failureBlock:(void(^)(NSError *error))failure;



/**
 *  获取录像播放URL
 *
 *  @param cameraID
 *  @param streamID
 *  @param urlType
 *  @param vodType
 *  @param vodInfo
 *  @param success
 *  @param failure errorCode：03000006  设备不在线
*/
+ (void)getVideoURLWithCameraID:(NSString *)cameraID
                       streamType:(NSString *)streamType
                        urlType:(NSString *)urlType
                        vodType:(NSString *)vodType
                        vodInfo:(ALCVodInfo  *)vodInfo
                   successBlock:(void(^)(NSString *URL))success
                   failureBlock:(void(^)(NSError *error))failure;



/**
 *  裁剪录像
 *
 *  @param cameraID
 *  @param streamID
 *  @param vodType
 *  @param vodInfo
 *  @param success
 *  @param failure
 */
+ (void)cutVideoWithCameraID:(NSString *)cameraID
                    streamID:(NSString *)streamID
                     vodType:(NSString *)vodType
                     vodInfo:(ALCVodInfo *)vodInfo
                successBlock:(void(^)(ALCVideoURLRspJM *videoURLRspJM))success
                failureBlock:(void(^)(NSError *error))failure;




/**
 *  获取录像裁剪的状态
 *
 *  @param objID
 *  @param success
 *  @param failure
 */
+ (void)getCutVideoStatusWithObjID:(NSString *)objID
                      successBlock:(void(^)(NSString *objID,NSString *status))success
                      failureBlock:(void(^)(NSError *error))failure;




/**
 *  获取录像播放资源
 *
 *  @param objID
 *  @param success
 *  @param failure
 */
+ (void)getVideoPlayWithObjID:(NSString *)objID
                 successBlock:(void(^)(ALCVideoPlayRspJM *alcVideoPlayRspJM))success
                 failureBlock:(void(^)(NSError *error))failure;



#pragma mark - 云控制功能

+ (void)ptzSetDirection:(ALCControlInfo *)ALCControlInfo successBlock:(void(^)(NSString * result))success
           failureBlock:(void(^)(NSError *error))failure;




#pragma mark  -  业务上报


/**
 *  业务上报
 *
 *  @param appType        业务应用类型
 *  @param serviceType    服务器类型
 *  @param actionType     触发类型  0：一次性出发 1：开始 2：结束
 *  @param actionNum
 *  @param actionUser
 *  @param cameraID       设备ID
 *  @param actionTime     发生时间
 *  @param actionResult   操作结果  0:成功，1：失败
 *  @param fluxSize       产生的流量
 *  @param localIp        本地IP
 *  @param network        网络类型  1：数据网络（GPRS\3G\4G） 2：WIFI 3：固网
 *  @param success
 *  @param failure
 */

+(void)uploadReportWithAppType:(NSString *)appType serviceType:(ALCUploadReportType)uploadType actionType:(NSString *)actionType actionNum:(NSString *)actionNum actionUser:(NSString *)actionUser cameraID:(NSString *)cameraID actionTime:(NSString *)actionTime actionResult:(NSString *)actionResult fluxSize:(NSString *)fluxSize localIp:(NSString *)localIp network:(NSString *)network successBlock:(void(^)(NSString * result))success
                failureBlock:(void(^)(NSError *error))failure;

@end











#pragma mark - SDK Delegate
@protocol ALCameraDelegate <NSObject>
@optional
@end

