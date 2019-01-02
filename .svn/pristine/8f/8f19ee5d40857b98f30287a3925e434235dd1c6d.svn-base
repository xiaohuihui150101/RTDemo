//
//  RTMessageDetailViewCell.m
//  ISS-ISPS-RT
//
//  Created by isoft on 2018/12/19.
//  Copyright © 2018 isoft. All rights reserved.
//

#import "RTMessageDetailViewCell.h"

@implementation RTMessageDetailViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self contentLB];
        
        [self backImg];
        [self playBtn];
        
    }
    return self;
}

- (UILabel *)contentLB {
    if (!_contentLB) {
        _contentLB = [[UILabel alloc] init];
        _contentLB.text = @"1992年，杰森·斯坦森作为英国国家跳水队运动员代表英国参加了第十二届世界跳水冠军赛，获得了第12名 。\n1998年，杰森出演了盖伊·里奇的犯罪电影《两杆大烟枪》，进入演艺圈。";
        _contentLB.font = kFont14;
        _contentLB.textColor = mHexColor(0x666666);
        _contentLB.numberOfLines = 0;
        [self.contentView addSubview:_contentLB];
        [_contentLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(15);
            make.right.equalTo(-15);
            make.top.equalTo(0);
        }];
    }
    return _contentLB;
}

- (UIImageView *)backImg {
    if (!_backImg) {
        _backImg = [[UIImageView alloc] init];
        _backImg.image = [UIImage imageNamed:@"login_bg"];
        _backImg.contentMode = UIViewContentModeScaleAspectFill;
        [_backImg setClipsToBounds:YES];
        [self.contentView addSubview:_backImg];
        [_backImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(15);
            make.right.equalTo(-15);
            make.top.equalTo(0);
            make.height.equalTo(200);
        }];
        
        _playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_playBtn setImage:[UIImage imageNamed:@"play_n"] forState:UIControlStateNormal];
        _playBtn.layer.cornerRadius = 20.0f;
        _playBtn.layer.masksToBounds = YES;
        [self.backImg addSubview:_playBtn];
        [_playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.centerY.equalTo(0);
            make.width.height.equalTo(40);
        }];
        
    }
    return _backImg;
}

@end
