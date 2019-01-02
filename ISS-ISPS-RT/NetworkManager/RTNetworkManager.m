//
//  RTNetworkManager.m
//  ISS-ISPS-RT
//
//  Created by isoft on 2018/12/28.
//  Copyright © 2018 isoft. All rights reserved.
//

#import "RTNetworkManager.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import <AFNetworking.h>
#import <sys/utsname.h>

#define kTimeOutInterval 15

@implementation RTNetworkManager

+ (AFHTTPSessionManager *)shareSessionManager {
    static AFHTTPSessionManager *shareManager = nil;
    static dispatch_once_t onceToken;
    mWeakSelf
    dispatch_once(&onceToken, ^{
        AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:N_HostSiteMain]];
        [manager setSecurityPolicy:[weakSelf customSecurityPolicy]];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"text/html", @"text/plain", @"text/json", @"text/javascript", @"application/json", @"application/xml"]];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        manager.requestSerializer.timeoutInterval = kTimeOutInterval;
        shareManager = manager;
    });
    
    return shareManager;
}

+ (AFSecurityPolicy*)customSecurityPolicy {
    
    //先导入证书
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"avantouch" ofType:@"cer"];
    NSData *certData = [NSData dataWithContentsOfFile:cerPath];
    
    AFSecurityPolicy *securityPolicy;
    securityPolicy.allowInvalidCertificates = YES;
    securityPolicy.validatesDomainName = NO;
    securityPolicy.pinnedCertificates = [NSSet setWithObjects:certData, nil];
    
    return securityPolicy;
}

+ (NSURLSessionDataTask *)GET:(NSString *)hostString
                       params:(NSDictionary *)params
                      success:(RTNetWordSuccess)success
                      failure:(RTNetWordFailure)failure {
    NSString *urlString = [NSString stringWithFormat:@"%@", hostString];
    if ([hostString hasPrefix:@"http"]) {
        
    } else {
        urlString = [NSString stringWithFormat:@"%@%@", N_HostSiteMain, hostString];
    }
    AFHTTPSessionManager *manager = [self shareSessionManager];
    return [manager GET:urlString parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *jsonError = nil;
        NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&jsonError];
        if ([responseDic isKindOfClass:[NSDictionary class]]) {
            success(task, responseObject);
        } else {
            success(task, responseObject);
        }
    } failure:failure];
}

+ (NSURLSessionDataTask *)POST:(NSString *)hostString
                        params:(NSDictionary *)params
                       success:(RTNetWordSuccess)success
                       failure:(RTNetWordFailure)failure {
    NSMutableDictionary *paramsDic = (params?:@{}).mutableCopy;
    NSString *urlString = [NSString stringWithFormat:@"%@", hostString];
    if ([hostString hasPrefix:@"http"]) {
        
    } else {
        urlString = [NSString stringWithFormat:@"%@%@", N_HostSiteMain, hostString];
    }
    AFHTTPSessionManager *manager = [self shareSessionManager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    return [manager POST:urlString
              parameters:paramsDic
                progress:nil
                 success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                     NSError *jsonError = nil;
                     NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&jsonError];
                     if ([responseDic isKindOfClass:[NSDictionary class]]) {
                         success(task, responseObject);
                     } else {
                         success(task, responseObject);
                     }
                 } failure:failure];
    
}

#pragma mark -- 图片上传
+ (void)uploadImages:(NSArray *)imageArray
           urlString:(NSString *)urlString
              params:(NSDictionary *)params
         targetWidth:(float)width
        successBlock:(RTNetWordSuccess)successBlock
         failurBlock:(RTNetWordFailure)failureBlock
            progress:(RTUploadProgress)progress {
    NSString *hostString = [NSString stringWithFormat:@"%@", urlString];
    if ([urlString hasPrefix:@"http"]) {
        
    } else {
        hostString = [NSString stringWithFormat:@"%@%@", N_HostSiteMain, urlString];
    }
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"text/html", @"text/plain", @"text/json", @"text/javascript", @"application/json", @"application/xml"]];
    [manager POST:hostString parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSUInteger i = 0;
        for (NSData *imageData in imageArray) {
            [formData appendPartWithFileData:imageData name:@"file" fileName:@"something.jpg" mimeType:@"image/jpeg"];
            i++;
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"%lld/%lld",uploadProgress.completedUnitCount ,uploadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(task, responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(task, error);
    }];
    
}


#pragma mark -- 取消所有的网络请求
+ (void)cancelAllRequest {
    [[self shareSessionManager].operationQueue cancelAllOperations];
}
#pragma mark - 取消指定的url请求
+ (void)cancelHttpRequestWithRequestType:(NSString *)requestType
                        requestUrlString:(NSString *)string {
    NSError *error;
    NSString *urlToPeCanced = [[[[AFHTTPSessionManager manager].requestSerializer requestWithMethod:requestType URLString:string parameters:nil error:&error] URL]path];
    for (NSOperation *operation in [AFHTTPSessionManager manager].operationQueue.operations) {
        if ([operation isKindOfClass:[NSURLSessionTask class]]) {
            BOOL hasMatchRequestType = [requestType isEqualToString:[[(NSURLSessionTask *)operation currentRequest] HTTPMethod]];
            //请求的url匹配
            BOOL hasMatchRequestUrlString = [urlToPeCanced isEqualToString:[[[(NSURLSessionTask *)operation currentRequest] URL] path]];
            //两项都匹配的话  取消该请求
            if (hasMatchRequestType&&hasMatchRequestUrlString) {
                [operation cancel];
            }
        }
    }
}

/*********
 * 图片上传的接口
 * uploadImages        上传图片的data文件，可以是多个也可以单个
 * urlString           上传图片的url
 * params              传参。file：data  fileType：类型
 * targetWidth         传进入图片的比例
 ****/
+ (RACSignal *)rac_uploadImages:(NSArray *)uploadImages
                      urlString:(NSString *)urlString
                         params:(NSDictionary *)params
                    targetWidth:(float)targetWidth {
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [self uploadImages:uploadImages urlString:urlString params:params targetWidth:targetWidth successBlock:^(NSURLSessionDataTask *task, id responseObject) {
            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                NSError *jsonError = nil;
                NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&jsonError];
                if ([responseDic isKindOfClass:[NSDictionary class]]) {
                    NSString *errorCode = responseDic[@"e"][@"code"];
                    if (errorCode.integerValue == 0) {
                        [subscriber sendNext:responseDic];
                        [subscriber sendCompleted];
                    } else {
                        [subscriber sendError:[NSError errorWithDomain:responseDic[@"e"][@"desc"] code:0 userInfo:@{NSLocalizedDescriptionKey: responseDic[@"e"][@"desc"]?: @"未知网络错误"}]];
                    }
                } else {
                    [subscriber sendError:jsonError];
                }
            } else if ([responseObject isKindOfClass:[NSArray class]]) {
                [subscriber sendNext:responseObject];
                [subscriber sendCompleted];
            }
            
        } failurBlock:^(NSURLSessionDataTask *task, NSError *error) {
            NSError *newError = [NSError errorWithDomain:error.localizedDescription code:error.code userInfo:@{NSLocalizedDescriptionKey: @"网络错误,请稍后重试"}];
            [subscriber sendError:newError];
        } progress:^(float progress) {
            
        }];
        
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
    
    return signal;
}

/********
 *
 *  图片上传的接口
 *  imgData      上传图片的二进制文件
 *  urlString    上传图片的url(接口的url)
 *
 ****/

+ (RACSignal *)upLoadImageData:(NSData *)imgData urlString:(NSString *)urlString {
    NSDictionary * dic = @{@"file":imgData,@"fileType":@"1"};
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [[RTNetworkManager rac_uploadImages:@[imgData] urlString:urlString params:dic targetWidth:1.0] subscribeNext:^(id  _Nullable x) {
            [subscriber sendNext:x];
            [subscriber sendCompleted];
        } error:^(NSError * _Nullable error) {
            NSError *newError = [NSError errorWithDomain:error.localizedDescription code:error.code userInfo:@{NSLocalizedDescriptionKey: @"网络错误,请稍后重试"}];
            [subscriber sendError:newError];
        }];
        return [RACDisposable disposableWithBlock:^{
        }];
    }];
    return signal;
}

#pragma mark -------------------------------------RAC--------------------------
+ (RACSignal *)rac_GET:(NSString *)hostString params:(NSDictionary *)params {
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [self GET:hostString params:params success:^(NSURLSessionDataTask *task, id responseObject) {
            NSError *jsonError = nil;
            NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&jsonError];
            if ([responseDic isKindOfClass:[NSDictionary class]]) {
                NSString *errorCode = responseDic[@"e"][@"code"];
                if (errorCode.integerValue == 0) {
                    [subscriber sendNext:responseDic];
                    [subscriber sendCompleted];
                } else {
                    [subscriber sendError:[NSError errorWithDomain:responseDic[@"e"][@"desc"] code:0 userInfo:@{NSLocalizedDescriptionKey: responseDic[@"e"][@"desc"]?: @"未知网络错误"}]];
                }
                
            } else {
                [subscriber sendError:jsonError];
            }
            
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            [subscriber sendError:error];
        }];
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
    return signal;
}

+ (RACSignal *)rac_POST:(NSString *)hostString params:(NSDictionary *)params {
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [self POST:hostString params:params success:^(NSURLSessionDataTask *task, id responseObject) {
            NSError *jsonError = nil;
            NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&jsonError];
            if ([responseDic isKindOfClass:[NSDictionary class]]) {
                 NSString *errorCode = responseDic[@"e"][@"code"];
                if (errorCode.integerValue == 0) {
                    [subscriber sendNext:responseDic];
                    [subscriber sendCompleted];
                } else {
                    [subscriber sendError:[NSError errorWithDomain:responseDic[@"e"][@"desc"] ?: @"" code:errorCode.integerValue userInfo:@{NSLocalizedDescriptionKey: responseDic[@"e"][@"desc"]?: @"未知网络错误"}]];
                }
            } else {
                [subscriber sendError:jsonError];
            }
            
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSError *newError = [NSError errorWithDomain:error.localizedDescription code:error.code userInfo:@{NSLocalizedDescriptionKey: @"网络错误,请稍后重试"}];
            
            [subscriber sendError:newError];
        }];
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
    return signal;
}

@end
