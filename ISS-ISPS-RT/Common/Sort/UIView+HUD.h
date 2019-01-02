//
//  UIView+HUD.h
//  ISS-ISPS-RT
//
//  Created by isoft on 2018/12/19.
//  Copyright © 2018 isoft. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (HUD)

//忙提示
- (void)showBusyHUD;
//忙提示+文字
- (void)showBusyHudWithText:(NSString *)text;

//文字提示
- (void)showWarning:(NSString *)warning;
//隐藏提示
- (void)hideBusyHUD;

- (void)showBusyHUDWithYoffSet:(CGFloat)offSet;

- (void)showMsgWithTitle:(NSString *)title;


- (void)showCustomView:(UIImage *)image title:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
