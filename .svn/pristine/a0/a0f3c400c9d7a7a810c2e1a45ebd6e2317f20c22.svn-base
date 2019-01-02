//
//  RTMineVC.m
//  ISS-ISPS-RT
//
//  Created by isoft on 2018/12/18.
//  Copyright © 2018 isoft. All rights reserved.
//

#import "RTMineVC.h"
#import "RTMineHeaderView.h"
#import "RTMineViewCell.h"
#import "RTPersonDataVC.h"
#import "RTFeedBackVC.h"
#import "RTSettingVC.h"
#import "RTMessageListVC.h"

@interface RTMineVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *reTableView;

@property (nonatomic, strong) RTMineHeaderView *headerView;
@property (nonatomic, strong) NSArray *iconArray;
@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation RTMineVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barTintColor = kConfigColor;
    [self.navigationController.navigationBar setHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"用户后台";
    self.view.backgroundColor = kBottomColor;
    [self setInsetNoneWithScrollView:self.reTableView];
    
    self.iconArray = @[@"mess_n", @"feed_n", @"set_n"];
    self.titleArray = @[@"消息通知", @"意见反馈", @"设置中心"];
    
    self.headerView = [[RTMineHeaderView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenWidth*0.4+statusBar)];
    self.reTableView.tableHeaderView = self.headerView;
    
    mWeakSelf
    [self.headerView tapHandle:^NSString * _Nonnull{
        RTPersonDataVC *vc = [[RTPersonDataVC alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
        return @"点击用户后台的head";
    }];
    
}
#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RTMineViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RTMineViewCell"];
    cell.iconImg.image = [UIImage imageNamed:self.iconArray[indexPath.row]];
    cell.titleLB.text = self.titleArray[indexPath.row];
    if (indexPath.row == 0) {
        cell.redLB.hidden = NO;
    } else {
        cell.redLB.hidden = YES;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        RTMessageListVC *vc = [[RTMessageListVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 1) {
        RTFeedBackVC *vc = [[RTFeedBackVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        RTSettingVC *vc = [[RTSettingVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (UITableView *)reTableView {
    if (!_reTableView) {
        _reTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _reTableView.backgroundColor = [UIColor whiteColor];
        _reTableView.delegate = self;
        _reTableView.dataSource = self;
        _reTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_reTableView];
        [_reTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        //注册cell
        [_reTableView registerClass:[RTMineViewCell class] forCellReuseIdentifier:@"RTMineViewCell"];
        
    }
    return _reTableView;
}


@end
