//
//  RTSingleVideoPlayCell.m
//  ISS-ISPS-RT
//
//  Created by isoft on 2018/12/21.
//  Copyright © 2018 isoft. All rights reserved.
//

#import "RTSingleVideoPlayCell.h"

@implementation RTSingleVideoPlayCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self titleLB];
        
    }
    return self;
}

- (UILabel *)titleLB {
    if (!_titleLB) {
        _titleLB = [[UILabel alloc] init];
        _titleLB.font = kFont13;
        _titleLB.textColor = kBlackColor;
        _titleLB.text = @"设备类型";
        [self.contentView addSubview:_titleLB];
        [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.left.right.equalTo(0);
            make.height.equalTo(20);
        }];
    }
    return _titleLB;
}

@end
