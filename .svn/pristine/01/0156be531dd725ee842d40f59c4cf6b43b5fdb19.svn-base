//
//  RTMessageDetailHeaderView.m
//  ISS-ISPS-RT
//
//  Created by isoft on 2018/12/19.
//  Copyright © 2018 isoft. All rights reserved.
//

#import "RTMessageDetailHeaderView.h"

@implementation RTMessageDetailHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self titleLB];
        [self timeLB];
        
    }
    return self;
}

- (UILabel *)titleLB {
    if (!_titleLB) {
        _titleLB = [[UILabel alloc] init];
        _titleLB.font = [UIFont systemFontOfSize:17];
        _titleLB.textColor = kBlackColor;
        _titleLB.text = @"系统消息";
        [self addSubview:_titleLB];
        [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(15);
            make.width.equalTo(ScreenWidth-30);
            make.height.equalTo(20);
        }];
    }
    return _titleLB;
}

- (UILabel *)timeLB {
    if (!_timeLB) {
        _timeLB = [[UILabel alloc] init];
        _timeLB.font = kFont12;
        _timeLB.textColor = mHexColor(0x999999);
        _timeLB.text = @"2018-12-19 13:46";
        [self addSubview:_timeLB];
        [_timeLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLB.mas_left);
            make.top.equalTo(self.titleLB.mas_bottom).offset(8);
            make.width.equalTo(ScreenWidth-30);
            make.height.equalTo(14);
        }];
    }
    return _timeLB;
}

@end
