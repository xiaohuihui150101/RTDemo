//
//  RTNetworkManager.h
//  ISS-ISPS-RT
//
//  Created by isoft on 2018/12/28.
//  Copyright © 2018 isoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#ifndef RTNetworkManager_h
#define RTNetworkManager_h

//请求成功
typedef void (^RTNetWordSuccess)(NSURLSessionDataTask * task, id responseObject);
//请求失败
typedef void (^RTNetWordFailure)(NSURLSessionDataTask * task, NSError * error);

typedef void (^RTNetWordResult)(id data, NSError *error);
//上传的进度
typedef void (^RTUploadProgress)(float progress);


#endif

NS_ASSUME_NONNULL_BEGIN

@interface RTNetworkManager : NSObject

+ (NSURLSessionDataTask *)GET:(NSString *)hostString params:(NSDictionary *)params success:(RTNetWordSuccess)success failure:(RTNetWordFailure)failure;

+ (NSURLSessionDataTask *)POST:(NSString *)hostString params:(NSDictionary *)params success:(RTNetWordSuccess)success failure:(RTNetWordFailure)failure;

+ (void)uploadImages:(NSArray *)imageArray
           urlString:(NSString *)urlString
              params:(NSDictionary *)params
         targetWidth:(float)width
        successBlock:(RTNetWordSuccess)successBlock
         failurBlock:(RTNetWordFailure)failureBlock
            progress:(RTUploadProgress)progress;

/**
 *  取消所有的网络请求
 */
+ (void)cancelAllRequest;

/**
 *  取消指定的url请求
 *
 *  @param requestType 该请求的请求类型
 *  @param string      该请求的完整url
 */

+ (void)cancelHttpRequestWithRequestType:(NSString *)requestType requestUrlString:(NSString *)string;



@end

@interface RTNetworkManager (RAC)

+ (RACSignal *)upLoadImageData:(NSData *)imgData urlString:(NSString *)urlString;

/// RAC Post请求
+ (RACSignal *)rac_POST:(NSString *)hostString params:(NSDictionary *)params;

/// RAC Get请求
+ (RACSignal *)rac_GET:(NSString *)hostString params:(NSDictionary *)params;


@end

NS_ASSUME_NONNULL_END
