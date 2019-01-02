//
//  RTNoDataView.m
//  ISS-ISPS-RT
//
//  Created by isoft on 2018/12/20.
//  Copyright © 2018 isoft. All rights reserved.
//

#import "RTNoDataView.h"

@interface RTNoDataView ()

@property (nonatomic, strong) UILabel *detailTextLabel;

@end

@implementation RTNoDataView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = mHexColor(0xF6F6F6);
        self.backgroundColor = mHexColor(0xEAEAEA);
        [self addSubviews];
        [self refreshBtn];
    }
    return self;
}

- (void)addSubviews {
    self.noDataIV = ({
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.contentMode = UIViewContentModeScaleAspectFill;//ch --UIViewContentModeScaleAspectFit-->UIViewContentModeScaleAspectFill
        imageView;
    });
    self.noDataIV.clipsToBounds = YES;
    [self addSubview:self.noDataIV];
    
    self.titleLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.textColor = mHexColor(0x666666);
        label.font = [UIFont systemFontOfSize:16];
        label.textAlignment = NSTextAlignmentCenter;
        label.numberOfLines = 0;
        label;
    });
    [self addSubview:self.titleLabel];
    
    self.detailTextLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.textColor = mHexColor(0x666666);
        label.font = [UIFont systemFontOfSize:14];
        label.numberOfLines = 0;
        label;
    });
    [self addSubview:self.detailTextLabel];
    
    self.bottomButton = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        button.layer.cornerRadius = 22;
        button.layer.masksToBounds = YES;
        [button setBackgroundImage:[UIImage imageNamed:@"ws_nodata_btn_orange_n"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"ws_nodata_btn_orange_p"] forState:UIControlStateHighlighted];
        [button setTitle:@"" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button;
    });
    [self addSubview:self.bottomButton];
    
    [self confignConstraints];
    
    [self confignViewByType:RTNoDataViewTypeNone];
}

- (void)confignConstraints {
    [self.noDataIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(0);
        make.centerY.equalTo(-44);
        make.width.equalTo(336*m6Scale);
        make.height.equalTo(240*m6Scale);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.noDataIV.mas_bottom).offset(17);
        make.left.equalTo(8);
        make.right.equalTo(-8);
    }];
    
    [self.detailTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(17);
        make.centerX.equalTo(self.noDataIV);
    }];
    
    [self.bottomButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(30);
        make.centerX.equalTo(self.noDataIV);
        make.size.mas_equalTo(CGSizeMake(200, 44));
    }];
}

- (void)confignViewByType:(RTNoDataViewType)viewType {
    switch (viewType) {
        case RTNoDataViewTypeNone:
            self.titleLabel.text = @"对不起,内容获取失败\n请确定您是否拥有所属区域权限或检查网络是否畅通";
            self.titleLabel.textColor = mHexColor(0x666666);
            self.noDataIV.image = [UIImage imageNamed:@"emptystats_n"];
            break;
            
        case RTNoDataViewTypeSearch:
            self.titleLabel.text = @"对不起,内容获取失败\n请确定您是否拥有所属区域权限或检查网络是否畅通";
            [self.titleLabel setTextColor:mHexColor(0x666666)];
            self.noDataIV.image = [UIImage imageNamed:@"emptystats_n"];
            break;
        case RTNoDataViewTypeNoDate:
            self.titleLabel.text = @"对不起,内容获取失败\n请确定您是否拥有所属区域权限或检查网络是否畅通";
            [self.titleLabel setTextColor:mHexColor(0x666666)];
            self.noDataIV.image = [UIImage imageNamed:@"emptystats_n"];
            break;
            
            
        default:
            break;
    }
}

- (void)setViewType:(RTNoDataViewType)viewType {
    _viewType = viewType;
    [self confignViewByType:viewType];
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
}

- (void)setNoDataImage:(UIImage *)noDataImage {
    _noDataImage = noDataImage;
    self.noDataIV.image = noDataImage;
}

- (void)setDetailText:(NSString *)detailText {
    _detailText = detailText;
    self.detailTextLabel.text = detailText;
}

- (UIButton *)refreshBtn {
    if (!_refreshBtn) {
        _refreshBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_refreshBtn];
        [_refreshBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.top.equalTo(self.titleLabel.mas_bottom).equalTo(25);
            make.width.equalTo(150);
            make.height.equalTo(30);
        }];
        [_refreshBtn setTitle:@"重新加载" forState:UIControlStateNormal];
        _refreshBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_refreshBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _refreshBtn.hidden = YES;
    }
    return _refreshBtn;
}


- (UIView *)borderView {
    if (!_borderView) {
        _borderView = [UIView new];
    }
    return _borderView;
}
@end
