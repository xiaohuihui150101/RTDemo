//
//  RTDeviceMainCell.m
//  ISS-ISPS-RT
//
//  Created by isoft on 2018/12/20.
//  Copyright © 2018 isoft. All rights reserved.
//

#import "RTDeviceMainCell.h"

@implementation RTDeviceMainCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.layer.cornerRadius = 8;
        self.layer.masksToBounds = YES;
        
        [self bgImg];
        [self deviceNameLB];
        [self statsLB];
        [self lookLB];
        [self nameLB];
        [self nameImg];
        [self numberLB];
        [self numberImg];
        [self locationLB];
        [self locationImg];
        [self isSelectImg];
        
    }
    return self;
}

- (UIImageView *)bgImg {
    if (!_bgImg) {
        _bgImg = [[UIImageView alloc] init];
        _bgImg.image = [UIImage imageNamed:@"device_sel"];
        [self.contentView addSubview:_bgImg];
        [_bgImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
    }
    return _bgImg;
}

- (UILabel *)deviceNameLB {
    if (!_deviceNameLB) {
        _deviceNameLB = [[UILabel alloc] init];
        _deviceNameLB.font = kFont15;
        _deviceNameLB.textColor = mHexColor(0x1BA0D0);
        _deviceNameLB.text = @"摄像机";
        [self.contentView addSubview:_deviceNameLB];
        [_deviceNameLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(16);
            make.top.equalTo(10);
            make.height.equalTo(20);
        }];
    }
    return _deviceNameLB;
}

- (UILabel *)statsLB {
    if (!_statsLB) {
        _statsLB = [[UILabel alloc] init];
        _statsLB.text = @"运行中";
        _statsLB.font = kFont12;
        _statsLB.textColor = [UIColor whiteColor];
        _statsLB.textAlignment = NSTextAlignmentCenter;
        _statsLB.backgroundColor = mHexColor(0x27B0E1);
        [self.contentView addSubview:_statsLB];
        [_statsLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.deviceNameLB.mas_centerY);
            make.left.equalTo(self.deviceNameLB.mas_right).offset(10);
            make.height.equalTo(16);
            make.width.equalTo(45);
        }];
    }
    return _statsLB;
}

- (UILabel *)lookLB {
    if (!_lookLB) {
        _lookLB = [[UILabel alloc] init];
        _lookLB.font = kFont13;
        _lookLB.textColor = mHexColor(0x27B0E1);
        _lookLB.text = @"查看 >";
        _lookLB.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_lookLB];
        [_lookLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.deviceNameLB.mas_centerY);
            make.right.equalTo(-15);
            make.height.equalTo(16);
        }];
    }
    return _lookLB;
}

- (UIImageView *)nameImg {
    if (!_nameImg) {
        _nameImg = [[UIImageView alloc] init];
        _nameImg.image = [UIImage imageNamed:@"device_n"];
        [self.contentView addSubview:_nameImg];
        [_nameImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(20);
            make.top.equalTo(54);
            make.width.height.equalTo(13);
        }];
    }
    return _nameImg;
}

- (UILabel *)nameLB {
    if (!_nameLB) {
        _nameLB = [[UILabel alloc] init];
        _nameLB.font = kFont13;
        _nameLB.textColor = mHexColor(0x666666);
        _nameLB.text = @"设备名称: 摄像机V1000";
        [self.contentView addSubview:_nameLB];
        [_nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.nameImg.mas_centerY);
            make.left.equalTo(self.nameImg.mas_right).offset(10);
            make.height.equalTo(17);
            make.right.equalTo(-20);
        }];
    }
    return _nameLB;
}

- (UIImageView *)numberImg {
    if (!_numberImg) {
        _numberImg = [[UIImageView alloc] init];
        _numberImg.image = [UIImage imageNamed:@"number_n"];
        _numberImg.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:_numberImg];
        [_numberImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(20);
            make.top.equalTo(self.nameLB.mas_bottom).offset(11);
            make.width.equalTo(16);
            make.height.equalTo(10);
        }];
    }
    return _numberImg;
}

- (UILabel *)numberLB {
    if (!_numberLB) {
        _numberLB = [[UILabel alloc] init];
        _numberLB.font = kFont13;
        _numberLB.textColor = mHexColor(0x666666);
        _numberLB.text = @"设备编号: E13594212";
        [self.contentView addSubview:_numberLB];
        [_numberLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.numberImg.mas_centerY);
            make.left.equalTo(self.nameLB.mas_left);
            make.height.equalTo(17);
            make.right.equalTo(-20);
        }];
    }
    return _numberLB;
}
/***
 * 位置
 */
- (UIImageView *)locationImg {
    if (!_locationImg) {
        _locationImg = [[UIImageView alloc] init];
        _locationImg.image = [UIImage imageNamed:@"location_n"];
        _locationImg.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:_locationImg];
        [_locationImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(20);
            make.top.equalTo(self.numberLB.mas_bottom).offset(8);
            make.height.equalTo(13);
            make.width.equalTo(10);
        }];
    }
    return _locationImg;
}

- (UILabel *)locationLB {
    if (!_locationLB) {
        _locationLB = [[UILabel alloc] init];
        _locationLB.font = kFont13;
        _locationLB.textColor = mHexColor(0x666666);
        _locationLB.text = @"所属区域: 航站楼A区";
        [self.contentView addSubview:_locationLB];
        [_locationLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.locationImg.mas_centerY);
            make.left.equalTo(self.nameLB.mas_left);
            make.height.equalTo(17);
            make.right.equalTo(-20);
        }];
    }
    return _locationLB;
}

- (UIImageView *)isSelectImg {
    if (!_isSelectImg) {
        _isSelectImg = [[UIImageView alloc] init];
        _isSelectImg.image = [UIImage imageNamed:@"select_n"];//选中
        _isSelectImg.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:_isSelectImg];
        [_isSelectImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(0);
            make.bottom.equalTo(0);
            make.width.height.equalTo(30);
        }];
    }
    return _isSelectImg;
}


@end
