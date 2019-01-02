//
//  RTTopView.h
//  ISS-ISPS-RT
//
//  Created by isoft on 2018/12/26.
//  Copyright © 2018 isoft. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RTTopViewDelegate <NSObject>

- (void)closeBtnWithAction:(UIButton *)sender;

@end

@interface RTTopView : UIView

@property (nonatomic, strong) UIButton *closebtn;

@property (nonatomic, weak) id<RTTopViewDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
