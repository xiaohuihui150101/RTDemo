//
//  RTSettingVC.m
//  ISS-ISPS-RT
//
//  Created by isoft on 2018/12/19.
//  Copyright © 2018 isoft. All rights reserved.
//

#import "RTSettingVC.h"
#import "RTSettingViewCell.h"
#import "RTAboutUsVC.h"

@interface RTSettingVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *reTableView;

@property (nonatomic, strong) NSArray *textArray;

@property (nonatomic, strong) UIButton *logoutBtn;

@end

@implementation RTSettingVC
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"设置中心";
    self.view.backgroundColor = mHexColor(0xEAEAEA);
    [self setInsetNoneWithScrollView:self.reTableView];
    [self logoutBtn];
    self.textArray = @[@"推送提醒", @"使用帮助", @"关于我们"];
    
}
#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.textArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RTSettingViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RTSettingViewCell"];
    cell.nameLB.text = self.textArray[indexPath.row];
    if (indexPath.row == 0) {
        cell.offSwitch.hidden = NO;
        cell.arrowImg.hidden = YES;
    } else {
        cell.offSwitch.hidden = YES;
        cell.arrowImg.hidden = NO;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 2) {
        RTAboutUsVC *vc = [[RTAboutUsVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (UITableView *)reTableView {
    if (!_reTableView) {
        _reTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _reTableView.backgroundColor = [UIColor whiteColor];
        _reTableView.delegate = self;
        _reTableView.dataSource = self;
        _reTableView.scrollEnabled = NO;
        _reTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_reTableView];
        [_reTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(0);
            make.centerX.equalTo(0);
            make.width.equalTo(ScreenWidth);
            make.height.equalTo(150);
        }];
        //注册cell
        [_reTableView registerClass:[RTSettingViewCell class] forCellReuseIdentifier:@"RTSettingViewCell"];
        
    }
    return _reTableView;
}

- (UIButton *)logoutBtn {
    if (!_logoutBtn) {
        _logoutBtn = [[UIButton alloc] init];
        _logoutBtn.backgroundColor = mHexColor(0x999999);
        _logoutBtn.titleLabel.font = kFont16;
        [_logoutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
        [_logoutBtn setTitleColor:kWhiteColor forState:UIControlStateNormal];
        _logoutBtn.layer.cornerRadius = 24.0f;
        _logoutBtn.layer.masksToBounds = YES;
        [_logoutBtn addTarget:self action:@selector(logoutBtnWithAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_logoutBtn];
        [_logoutBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.top.equalTo(self.reTableView.mas_bottom).offset(150);
            make.left.equalTo(40);
            make.height.equalTo(48);
        }];
    }
    return _logoutBtn;
}
#pragma mark -- 退出登录按钮
- (void)logoutBtnWithAction:(UIButton *)sender {
    NSLog(@"点击退出登录");
}

@end
