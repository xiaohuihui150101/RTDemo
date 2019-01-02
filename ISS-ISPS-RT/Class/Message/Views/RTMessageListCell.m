//
//  RTMessageListCell.m
//  ISS-ISPS-RT
//
//  Created by isoft on 2018/12/19.
//  Copyright © 2018 isoft. All rights reserved.
//

#import "RTMessageListCell.h"

@implementation RTMessageListCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.layer.cornerRadius = 8.0f;
        self.layer.masksToBounds = YES;
        
        [self readImg];
        [self titleLB];
        [self timeLB];
        [self contentLB];
        [self lineView];
        [self lookView];
        
    }
    return self;
}

- (UIImageView *)readImg {
    if (!_readImg) {
        _readImg = [[UIImageView alloc] init];
        _readImg.image = [UIImage imageNamed:@"unread_n"];//read_n 已读 unread_n 未读
        [self.contentView addSubview:_readImg];
        [_readImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(0);
            make.top.equalTo(0);
            make.width.height.equalTo(50);
        }];
    }
    return _readImg;
}

- (UILabel *)titleLB {
    if (!_titleLB) {
        _titleLB = [[UILabel alloc] init];
        _titleLB.font = kFont14;
        _titleLB.textColor = kBlackColor;
        _titleLB.text = @"系统消息";
        [self.contentView addSubview:_titleLB];
        [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(10);
            make.width.equalTo(ScreenWidth-32-20);
            make.height.equalTo(16);
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
        [self.contentView addSubview:_timeLB];
        [_timeLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLB.mas_left);
            make.top.equalTo(self.titleLB.mas_bottom).offset(8);
            make.width.equalTo(ScreenWidth-32-20);
            make.height.equalTo(14);
        }];
    }
    return _timeLB;
}

- (UILabel *)contentLB {
    if (!_contentLB) {
        _contentLB = [[UILabel alloc] init];
        _contentLB.font = kFont13;
        _contentLB.textColor = mHexColor(0x666666);
        _contentLB.numberOfLines = 0;
        _contentLB.text = @"通知标题通知内容之类的东西通知标题通知内容之类的东西通知标题通知内容之类的东西";
        [self.contentView addSubview:_contentLB];
        [_contentLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLB.mas_left);
            make.top.equalTo(self.timeLB.mas_bottom).offset(15);
            make.width.equalTo(ScreenWidth-32-20);
            make.height.equalTo(32);
        }];
    }
    return _contentLB;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = kLineColor;
        [self.contentView addSubview:_lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.height.equalTo(1);
            make.top.equalTo(self.contentLB.mas_bottom).offset(18);
        }];
    }
    return _lineView;
}

- (UIView *)lookView {
    if (!_lookView) {
        _lookView = [[UIView alloc] init];
        _lookView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_lookView];
        [_lookView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.top.equalTo(self.lineView.mas_bottom);
            make.bottom.equalTo(self.contentView.mas_bottom);
        }];
        
        _lookLB = [[UILabel alloc] init];
        _lookLB.font = kFont13;
        _lookLB.textAlignment = NSTextAlignmentCenter;
        _lookLB.textColor = mHexColor(0x666666);
        _lookLB.text = @"查看详情 >";
        [self.lookView addSubview:_lookLB];
        [_lookLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.lookView.mas_centerX);
            make.centerY.equalTo(self.lookView.mas_centerY);
            make.height.equalTo(18);
        }];
        
        
    }
    return _lookView;
}

@end
