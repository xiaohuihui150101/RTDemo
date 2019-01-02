//
//  RTMoreVideoPlayCell.m
//  ISS-ISPS-RT
//
//  Created by isoft on 2018/12/21.
//  Copyright © 2018 isoft. All rights reserved.
//

#import "RTMoreVideoPlayCell.h"

@implementation RTMoreVideoPlayCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self nameLB];
        [self bgImg];
        [self fullBtn];
        
    }
    return self;
}

- (UILabel *)nameLB {
    if (!_nameLB) {
        _nameLB = [[UILabel alloc] init];
        _nameLB.text = @"设备名称: 摄像机V100";
        _nameLB.font = kFont14;
        _nameLB.textColor = kBlackColor;
        [self.contentView addSubview:_nameLB];
        [_nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(5);
            make.left.right.equalTo(0);
            make.height.equalTo(18);
        }];
    }
    return _nameLB;
}

- (UIImageView *)bgImg {
    if (!_bgImg) {
        _bgImg = [[UIImageView alloc] init];
        _bgImg.image = [UIImage imageNamed:@"login_bg"];
        _bgImg.contentMode = UIViewContentModeScaleAspectFill;
        [_bgImg setClipsToBounds:YES];
        [self.contentView addSubview:_bgImg];
        [_bgImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.top.equalTo(self.nameLB.mas_bottom).offset(10);
        }];
    }
    return _bgImg;
}

- (UIButton *)fullBtn {
    if (!_fullBtn) {
        _fullBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_fullBtn setImage:[UIImage imageNamed:@"fullscreen_n"] forState:UIControlStateNormal];
        [self.contentView addSubview:_fullBtn];
        [_fullBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.equalTo(0);
            make.width.height.equalTo(30);
        }];
    }
    return _fullBtn;
}

@end
