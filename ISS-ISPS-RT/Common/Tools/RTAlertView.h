//
//  RTAlertView.h
//  ISS-ISPS-RT
//
//  Created by isoft on 2018/12/18.
//  Copyright © 2018 isoft. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class RTAlertView;

typedef void(^ClickBlock) (RTAlertView *actiont, NSIndexPath *indexPath);

@interface RTAlertView : UIView

/**
 * 初始化
 **/
- (instancetype)initWithTitles:(NSArray *)titles clickAction:(ClickBlock)clickBlock;

- (instancetype)initWithTitles:(NSArray *)titles height:(CGFloat)height clickAction:(ClickBlock)clickBlock;

/**
 * 显示
 **/
- (void)show;

/**
 * 隐藏
 **/
- (void)hide;

@end

NS_ASSUME_NONNULL_END
