//
//  RTSettingViewCell.m
//  ISS-ISPS-RT
//
//  Created by isoft on 2018/12/19.
//  Copyright © 2018 isoft. All rights reserved.
//

#import "RTSettingViewCell.h"

@implementation RTSettingViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self nameLB];
        [self arrowImg];
        [self lineView];
        [self offSwitch];
        
    }
    return self;
}

- (UILabel *)nameLB {
    if (!_nameLB) {
        _nameLB = [[UILabel alloc] init];
        _nameLB.font = kFont14;
        _nameLB.textColor = mHexColor(0x323232);
        _nameLB.text = @"软通动力";
        [self.contentView addSubview:_nameLB];
        [_nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.left.equalTo(20);
            make.height.equalTo(20);
            make.width.lessThanOrEqualTo(100);
        }];
    }
    return _nameLB;
}

- (UIImageView *)arrowImg {
    if (!_arrowImg) {
        _arrowImg = [[UIImageView alloc] init];
        _arrowImg.image = [UIImage imageNamed:@"arrow_n"];
//        _arrowImg.backgroundColor = [UIColor cyanColor];
        [self.contentView addSubview:_arrowImg];
        [_arrowImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.right.equalTo(-15);
            make.width.equalTo(8);
            make.height.equalTo(14);
        }];
    }
    return _arrowImg;
}

- (UISwitch *)offSwitch {
    if (!_offSwitch) {
        _offSwitch = [[UISwitch alloc] init];
        [_offSwitch setOn:YES];
        [_offSwitch addTarget:self action:@selector(offSwitchAction:) forControlEvents:UIControlEventValueChanged];
        [self.contentView addSubview:_offSwitch];
        [_offSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.right.equalTo(-15);
            make.width.equalTo(50);
            make.height.equalTo(30);
        }];
    }
    return _offSwitch;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = kLineColor;
        [self.contentView addSubview:_lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(15);
            make.right.equalTo(-15);
            make.top.equalTo(@(49));
            make.height.equalTo(@(1));
        }];
    }
    return _lineView;
}

- (void)offSwitchAction:(UISwitch *)offSwitch {
    if (offSwitch.on == YES) {
       NSLog(@"点击开");
    } else {
        NSLog(@"点击关闭");
    }
}

@end
