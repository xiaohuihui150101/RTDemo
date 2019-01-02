//
//  RTAlertActionCell.m
//  ISS-ISPS-RT
//
//  Created by isoft on 2018/12/18.
//  Copyright © 2018 isoft. All rights reserved.
//

#import "RTAlertActionCell.h"

@implementation RTAlertActionCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self textLB];
        [self lineView];
        
    }
    return self;
}

- (UILabel *)textLB {
    if (!_textLB) {
        _textLB = [[UILabel alloc] init];
        _textLB.textAlignment = NSTextAlignmentCenter;
        _textLB.font = kFont16;
        _textLB.textColor = kBlackColor;
        [self.contentView addSubview:_textLB];
        [_textLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.centerY.equalTo(0);
            make.width.equalTo(ScreenWidth-32);
            make.height.equalTo(36);
        }];
    }
    return _textLB;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = kLineColor;
        [self.contentView addSubview:_lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(@(0));
            make.top.equalTo(44);
            make.height.equalTo(@(1));
        }];
    }
    return _lineView;
}

@end
