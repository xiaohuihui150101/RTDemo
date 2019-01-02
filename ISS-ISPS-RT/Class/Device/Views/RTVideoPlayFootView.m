//
//  RTVideoPlayFootView.m
//  ISS-ISPS-RT
//
//  Created by isoft on 2018/12/21.
//  Copyright © 2018 isoft. All rights reserved.
//

#import "RTVideoPlayFootView.h"

@implementation RTVideoPlayFootView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self footLB];
        
    }
    return self;
}

- (UILabel *)footLB {
    if (!_footLB) {
        _footLB = [[UILabel alloc] init];
        _footLB.font = [UIFont systemFontOfSize:13];
        _footLB.textColor = mHexColor(0x999999);
        _footLB.text = @"提示：分屏播放最多可支持同时播放四个设备实时视频，点击可进行全屏播放";
        _footLB.numberOfLines = 0;
        [self addSubview:_footLB];
        [_footLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.right.equalTo(-10);
            make.top.equalTo(5);
            make.bottom.equalTo(-5);
        }];
    }
    return _footLB;
}

@end
