//
//  HomeVC.m
//  ISS-ISPS-RT
//
//  Created by isoft on 2018/12/18.
//  Copyright © 2018 isoft. All rights reserved.
//

#import "HomeVC.h"
#import "ViewController.h"

@interface HomeVC ()

@end

@implementation HomeVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barTintColor = kConfigColor;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"区域态势";
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor redColor];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:btn];
    
    mWeakSelf
    [btn tapHandle:^NSString * _Nonnull{
        ViewController *vc = [[ViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
        return @"";
    }];
    
    
}


@end
