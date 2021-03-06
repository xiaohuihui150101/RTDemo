//
//  RTMineHeaderView.m
//  ISS-ISPS-RT
//
//  Created by isoft on 2018/12/19.
//  Copyright © 2018 isoft. All rights reserved.
//

#import "RTMineHeaderView.h"

@implementation RTMineHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self backgroundImg];
        [self iconImg];
        [self userNameLB];
        [self arrowImg];
        
    }
    return self;
}

- (UIImageView *)backgroundImg {
    if (!_backgroundImg) {
        _backgroundImg = [[UIImageView alloc] init];
        _backgroundImg.image = [UIImage imageNamed:@"mine_bg_n"];
        _backgroundImg.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:_backgroundImg];
        [_backgroundImg mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.equalTo(0);
            make.left.equalTo(0);
            make.right.equalTo(0);
            make.top.equalTo(0);
            make.bottom.equalTo(0);
        }];
    }
    return _backgroundImg;
}

- (UIImageView *)iconImg {
    if (!_iconImg) {
        _iconImg = [[UIImageView alloc] init];
        _iconImg.image = [UIImage imageNamed:@"head_n"];
        _iconImg.layer.borderColor = [UIColor whiteColor].CGColor;
        _iconImg.layer.borderWidth = 2;
        _iconImg.layer.masksToBounds = YES;
        _iconImg.layer.cornerRadius = 38.0f;
        [self addSubview:_iconImg];
        [_iconImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_bottom).offset(-30);
            make.left.equalTo(16);
            make.width.height.equalTo(76);
        }];
    }
    return _iconImg;
}

- (UIImageView *)arrowImg {
    if (!_arrowImg) {
        _arrowImg = [[UIImageView alloc] init];
        _arrowImg.image = [UIImage imageNamed:@"arrow_w_n"];
//        _arrowImg.backgroundColor = [UIColor redColor];
        [self addSubview:_arrowImg];
        [_arrowImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-16);
            make.centerY.equalTo(self.iconImg.mas_centerY);
            make.width.equalTo(10);
            make.height.equalTo(14);
        }];
    }
    return _arrowImg;
}

- (UILabel *)userNameLB {
    if (!_userNameLB) {
        _userNameLB = [[UILabel alloc] init];
        _userNameLB.text = @"勒布朗.詹姆斯.二世";
        _userNameLB.textColor = [UIColor whiteColor];
        _userNameLB.font = kFont16;
        [self addSubview:_userNameLB];
        [_userNameLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(102);
            make.right.equalTo(-30);
            make.centerY.equalTo(self.iconImg.mas_centerY);
            make.height.equalTo(22);
        }];
    }
    return _userNameLB;
}

@end
