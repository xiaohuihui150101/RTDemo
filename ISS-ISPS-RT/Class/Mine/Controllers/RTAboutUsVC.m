//
//  RTAboutUsVC.m
//  ISS-ISPS-RT
//
//  Created by isoft on 2018/12/19.
//  Copyright © 2018 isoft. All rights reserved.
//

#import "RTAboutUsVC.h"
#import "RTSettingViewCell.h"

@interface RTAboutUsVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *reTableView;
@property (nonatomic, strong) NSArray *textArray;

@end

@implementation RTAboutUsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"关于我们";
    self.view.backgroundColor = mHexColor(0xEAEAEA);
    [self setInsetNoneWithScrollView:self.reTableView];
    self.textArray = @[@"联系我们", @"使用帮助", @"使用协议"];
    
}
#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.textArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RTSettingViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RTSettingViewCell"];
    cell.offSwitch.hidden = YES;
    cell.nameLB.text = self.textArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UITableView *)reTableView {
    if (!_reTableView) {
        _reTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _reTableView.backgroundColor = mHexColor(0xEAEAEA);
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


@end
