//
//  UIView+ESTap.h
//  ISS-ISPS-RT
//
//  Created by isoft on 2018/12/18.
//  Copyright © 2018 isoft. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NSString * _Nonnull (^TapAction)(void);

@interface UIView (ESTap)

- (void)tapHandle:(TapAction)block;

@end

NS_ASSUME_NONNULL_END
