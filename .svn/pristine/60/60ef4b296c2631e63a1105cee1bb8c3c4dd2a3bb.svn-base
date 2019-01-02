//
//  RTMineViewCell.m
//  ISS-ISPS-RT
//
//  Created by isoft on 2018/12/19.
//  Copyright © 2018 isoft. All rights reserved.
//

#import "RTMineViewCell.h"

@implementation RTMineViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self iconImg];
        [self titleLB];
        [self redLB];
        
        [self lineView];
        
    }
    return self;
}

- (UIImageView *)iconImg {
    if (!_iconImg) {
        _iconImg = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconImg];
        [_iconImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.left.equalTo(18);
            make.width.height.equalTo(20);
        }];
    }
    return _iconImg;
}

- (UILabel *)titleLB {
    if (!_titleLB) {
        _titleLB = [[UILabel alloc] init];
        _titleLB.textColor = mHexColor(0x666666);
        _titleLB.font = kFont14;
        [self.contentView addSubview:_titleLB];
        [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImg.mas_right).offset(15);
            make.centerY.equalTo(0);
            make.height.equalTo(20);
            make.right.lessThanOrEqualTo(50);
        }];
    }
    return _titleLB;
}

- (UILabel *)redLB {
    if (!_redLB) {
        _redLB = [[UILabel alloc] init];
        _redLB.backgroundColor = [UIColor redColor];
        _redLB.layer.cornerRadius = 10.0f;
        _redLB.layer.masksToBounds = YES;
        _redLB.textAlignment = NSTextAlignmentCenter;
        _redLB.text = @"10";
        _redLB.textColor = [UIColor whiteColor];
        _redLB.font = kFont13;
        [self.contentView addSubview:_redLB];
        [_redLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-15);
            make.centerY.equalTo(0);
            make.width.height.equalTo(20);
        }];
    }
    return _redLB;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = kLineColor;
        [self.contentView addSubview:_lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(15);
            make.top.equalTo(59);
            make.width.equalTo(ScreenWidth-15);
            make.height.equalTo(@(1));
        }];
    }
    return _lineView;
}

@end
