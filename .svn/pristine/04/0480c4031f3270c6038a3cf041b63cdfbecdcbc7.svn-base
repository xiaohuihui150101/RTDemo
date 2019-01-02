//
//  RTPersonalViewCell.m
//  ISS-ISPS-RT
//
//  Created by isoft on 2018/12/19.
//  Copyright © 2018 isoft. All rights reserved.
//

#import "RTPersonalViewCell.h"

@implementation RTPersonalViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self nameLB];
        [self arrowImg];
        [self headImg];
        [self subNameLB];
        [self lineView];
        
    }
    return self;
}

- (UILabel *)nameLB {
    if (!_nameLB) {
        _nameLB = [[UILabel alloc] init];
        _nameLB.font = kFont14;
        _nameLB.textColor = mHexColor(0x323232);
        _nameLB.text = @"哈哈哈";
        [self.contentView addSubview:_nameLB];
        [_nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.left.equalTo(20);
            make.width.lessThanOrEqualTo(70);
            make.height.equalTo(20);
        }];
    }
    return _nameLB;
}

- (UIImageView *)arrowImg {
    if (!_arrowImg) {
        _arrowImg = [[UIImageView alloc] init];
        _arrowImg.image = [UIImage imageNamed:@"arrow_n"];
        [self.contentView addSubview:_arrowImg];
        [_arrowImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.right.equalTo(-15);
            make.width.equalTo(8);
            make.height.equalTo(13);
        }];
    }
    return _arrowImg;
}

- (UIImageView *)headImg {
    if (!_headImg) {
        _headImg = [[UIImageView alloc] init];
        _headImg.image = [UIImage imageNamed:@"head_n"];
        _headImg.contentMode = UIViewContentModeScaleAspectFill;
        _headImg.layer.cornerRadius = 22.0f;
        _headImg.layer.masksToBounds = YES;
        [self.contentView addSubview:_headImg];
        [_headImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.right.equalTo(self.arrowImg.mas_left).offset(-15);
            make.width.height.equalTo(44);
        }];
    }
    return _headImg;
}

- (UILabel *)subNameLB {
    if (!_subNameLB) {
        _subNameLB = [[UILabel alloc] init];
        _subNameLB.font = kFont14;
        _subNameLB.textColor = mHexColor(0x999999);
        _subNameLB.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_subNameLB];
        [_subNameLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.right.equalTo(-38);
            make.height.equalTo(20);
            make.left.equalTo(self.nameLB.mas_right).offset(5);
        }];
    }
    return _subNameLB;
}


- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = kLineColor;
        [self.contentView addSubview:_lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(15);
            make.top.equalTo(49);
            make.width.equalTo(ScreenWidth-30);
            make.height.equalTo(1);
        }];
    }
    return _lineView;
}

@end
