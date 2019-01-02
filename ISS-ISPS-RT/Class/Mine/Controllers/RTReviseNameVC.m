//
//  RTReviseNameVC.m
//  ISS-ISPS-RT
//
//  Created by isoft on 2018/12/24.
//  Copyright © 2018 isoft. All rights reserved.
//

#import "RTReviseNameVC.h"

@interface RTReviseNameVC ()<UITextFieldDelegate>

@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UITextField *reviseNameTF;

@end

@implementation RTReviseNameVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = mHexColor(0xEAEAEA);
    
    self.navigationItem.title = @"修改姓名";
    [self initUI];
    [self addNavigationBtn];
}
#pragma mark -- 配置导航栏
- (void)addNavigationBtn {
    
    UIButton *rightBtn = [[UIButton alloc] init];
    rightBtn.frame = CGRectMake(0, 0, 45, 44);
    [rightBtn setTitle:@"保存" forState:UIControlStateNormal];
    rightBtn.titleLabel.font = kFont15;
    rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [rightBtn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
}

#pragma mark -- UI
- (void)initUI {
    
    self.backView = [[UIView alloc] init];
    _backView.backgroundColor = kBottomColor;
    [self.view addSubview:_backView];
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(statusBar+64);
        make.left.right.equalTo(0);
        make.height.equalTo(50);
    }];
    
    _reviseNameTF = [[UITextField alloc] init];
    _reviseNameTF.placeholder = @"请输入您要修改的名字";
    _reviseNameTF.delegate = self;
    _reviseNameTF.font = kFont15;
    [_reviseNameTF setValue:mHexColor(0xEAEAEA) forKeyPath:@"_placeholderLabel.textColor"];
    _reviseNameTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    _reviseNameTF.textColor = kBlackColor;
    [_backView addSubview:_reviseNameTF];
    [_reviseNameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(15);
        make.right.equalTo(-15);
        make.centerY.equalTo(self.backView.mas_centerY);
        make.height.equalTo(30);
    }];
    
}

//点击空白回收键盘
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if ([self.reviseNameTF isFirstResponder]) {
        [self.reviseNameTF resignFirstResponder];
    }
}

#pragma mark -- 响应事件
- (void)rightBtnClick:(UIButton *)sender {
    NSLog(@"点击保存按钮");
    [self.navigationController popViewControllerAnimated:YES];
}


@end
