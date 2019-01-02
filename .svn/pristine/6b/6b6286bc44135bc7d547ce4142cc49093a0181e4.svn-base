//
//  RSMediaPlayer.h
//  ALCTest
//
//  Created by HX on 2018/3/2.
//  Copyright © 2018年 AllcamRW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ALCContants.h"
@protocol RSMediaPlayerDelegate;


typedef enum : NSUInteger {
    videoContentModeScaleToFill=100, //视频画面强制16:9
    videoContentModeScaleAspectFit, //
} videoContentMode;




@interface RSMediaPlayer : NSObject

@property (assign) id<RSMediaPlayerDelegate> delegate;

@property(assign,nonatomic) videoContentMode videoContentMode;

//获取实例
+ (RSMediaPlayer *)sharedInstaned;
/**
 *  直接使用CameraID进行播放，其中参数已经配置好：主码流 rtsp
 *
 *  @param cameraID
 *  @param drawView
 */
- (void)playWithCameraID:(NSString *)CameraID drawView:(UIView *)drawView;
/**
 *  直接使用CameraID进行播放，其中参数自定义
 *
 *  @param cameraID
 *  @param urlType
 *  @param streamType
 *  @param drawView
 */
- (void)playWithCameraID:(NSString *)cameraID
              streamType:(ALCStreamType)streamType
                 urlType:(ALCURLType)urlType
                drawView:(UIView *)drawView;

/**
 *  使用播放地址播放视频流
 *
 *  @param URL
 *  @param drawView
 *
 */

- (void)playWithURL:(NSString *)URL drawView:(UIView *)drawView;

/**
 *  停止播放，再次播放之前需要调用此方法
 *
 */
- (void)stopPlay;

/**
 *  暂停播放
 *
 */
- (void)pause;


/**
 *  开始播放（暂停后的开始）
 *
 */
- (void)play;

/**
 *  是否正在播放
 *
 */
- (BOOL)isPlaying;

/**
 *  静音
 *
 */
- (void)mute;

/**
 *  取消静音
 *
 */
- (void)cancelMute;

//获取缩略图(必须在视频开始播放时才能获取成功)   结果走代理回调
-(void)obtainHumbnail;

/**
 * Take a snapshot of the current video.
 *
 * If width AND height is 0, original size is used.
 * If width OR height is 0, original aspect-ratio is preserved.
 *
 * \param path the path where to save the screenshot to
 * \param width the snapshot's width
 * \param height the snapshot's height
 */
-(void)saveVideoSnapshotAt:(NSString *)path withWidth:(int)width andHeight:(int)height;


@end


@protocol RSMediaPlayerDelegate <NSObject>

-(void)RSMediaPlayerStateStopped;      ///< Player has stopped
-(void)RSMediaPlayerStateOpening;        ///< Stream is opening
-(void)RSMediaPlayerStateBuffering;      ///< Stream is buffering
-(void)RSMediaPlayerStateEnded;          ///< Stream has ended
-(void)RSMediaPlayerStateError;          ///< Player has generated an error
-(void)RSMediaPlayerStatePlaying;        ///< Stream is playing 暂停后开始播放的状态
-(void)RSCMediaPlayerStatePaused;          ///< Stream is paused
-(void)RSCMediaPlayerVideoStartPlay;      //视频第一次播放


-(void)RSCMediaPlayerGetPlayUrlFailed;//使用CameraID播放的回调


-(void)RSMediaPlayerSnapshot:(UIImage *)Snapshot;

//获取视频的缩略图
//获取失败state返回no , 成功则返回 yes 并且返回图片
-(void)obtainHumbnailState:(BOOL )state obtainImage:(UIImage *)image;

@end







