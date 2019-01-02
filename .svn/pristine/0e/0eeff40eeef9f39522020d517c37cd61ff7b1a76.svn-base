//
//  RTVideoPlayHeaderView.m
//  ISS-ISPS-RT
//
//  Created by isoft on 2018/12/21.
//  Copyright © 2018 isoft. All rights reserved.
//

#import "RTVideoPlayHeaderView.h"

@implementation RTVideoPlayHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
                
        [self bgImg];
        [self fullscreenBtn];
        [self playBtn];
        
    }
    return self;
}

- (UIImageView *)bgImg {
    if (!_bgImg) {
        _bgImg = [[UIImageView alloc] init];
        _bgImg.image = [UIImage imageNamed:@"login_bg"];
        _bgImg.contentMode = UIViewContentModeScaleAspectFill;
        [_bgImg setClipsToBounds:YES];
        [self addSubview:_bgImg];
        [_bgImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.equalTo(0);
        }];
    }
    return _bgImg;
}

- (UIButton *)playBtn {
    if (!_playBtn) {
        _playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_playBtn setImage:[UIImage imageNamed:@"play_n"] forState:UIControlStateNormal];
        _playBtn.contentMode = UIViewContentModeScaleAspectFill;
        [_playBtn setClipsToBounds:YES];
        [self addSubview:_playBtn];
        [_playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.centerY.equalTo(0);
            make.width.height.equalTo(35);
        }];
    }
    return _playBtn;
}

- (UIButton *)fullscreenBtn {
    if (!_fullscreenBtn) {
        _fullscreenBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_fullscreenBtn setImage:[UIImage imageNamed:@"fullscreen_n"] forState:UIControlStateNormal];
        [self addSubview:_fullscreenBtn];
        [_fullscreenBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-15);
            make.bottom.equalTo(-13);
            make.width.height.equalTo(34);
        }];
    }
    return _fullscreenBtn;
}

@end
