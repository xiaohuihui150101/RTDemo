//
//  RTLoginVC.m
//  ISS-ISPS-RT
//
//  Created by isoft on 2018/12/18.
//  Copyright © 2018 isoft. All rights reserved.
//

#import "RTLoginVC.h"

@interface RTLoginVC ()<UITextFieldDelegate>

@property (nonatomic, strong) UIImageView *backImg;

@property (nonatomic, strong) UIImageView *logoImg;

@property (nonatomic, strong) UIView *user_lineView;
@property (nonatomic, strong) UITextField *userNameTF;

@property (nonatomic, strong) UIView *pass_lineView;
@property (nonatomic, strong) UITextField *passwordTF;

@property (nonatomic, strong) UIButton *loginBtn;

@property (nonatomic, strong) UILabel *presentLB;

@end

@implementation RTLoginVC
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = kBottomColor;
    [self initUI];
}

#pragma mark -- UI
- (void)initUI {
    
    //背景图
    _backImg = [[UIImageView alloc] init];
    _backImg.userInteractionEnabled = YES;
    _backImg.image = [UIImage imageNamed:@"login_bg"];
    _backImg.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:_backImg];
    [_backImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(0);
    }];
    
    //logo
    _logoImg = [[UIImageView alloc] init];
    _logoImg.image = [UIImage imageNamed:@"login_logo"];
    _logoImg.contentMode = UIViewContentModeScaleAspectFill;
    [_logoImg setClipsToBounds:YES];
    [self.backImg addSubview:_logoImg];
    [_logoImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.backImg.mas_centerX);
        make.top.equalTo(statusBar+110);
        make.width.equalTo(126);
        make.height.equalTo(102);
    }];
    
    /***
     * 用户名
     */
    _user_lineView = [[UIView alloc] init];
    _user_lineView.backgroundColor = mHexColor(0xF0F0F0);
    [self.backImg addSubview:_user_lineView];
    [_user_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.backImg.mas_centerX);
        make.top.equalTo(self.logoImg.mas_bottom).offset(100);
        make.height.equalTo(1);
        make.width.equalTo(ScreenWidth-100);
    }];
    
    _userNameTF = [[UITextField alloc] init];
    _userNameTF.placeholder = @"请输入用户名";
    _userNameTF.delegate = self;
    _userNameTF.font = kFont15;
    [_userNameTF setValue:mHexColor(0xEEEEEE) forKeyPath:@"_placeholderLabel.textColor"];
    _userNameTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    _userNameTF.textColor = mHexColor(0xEEEEEE);
    [self.backImg addSubview:_userNameTF];
    [_userNameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.user_lineView.mas_left);
        make.right.equalTo(self.user_lineView.mas_right);
        make.bottom.equalTo(self.user_lineView.mas_top).offset(-10);
        make.height.equalTo(16);
    }];
    
    /***
     * 密码
     */
    _pass_lineView = [[UIView alloc] init];
    _pass_lineView.backgroundColor = mHexColor(0xF0F0F0);
    [self.backImg addSubview:_pass_lineView];
    [_pass_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.backImg.mas_centerX);
        make.top.equalTo(self.user_lineView.mas_bottom).offset(64);
        make.height.equalTo(1);
        make.width.equalTo(ScreenWidth-100);
    }];
    
    _passwordTF = [[UITextField alloc] init];
    _passwordTF.placeholder = @"请输入密码";
    _passwordTF.delegate = self;
    _passwordTF.font = kFont15;
    [_passwordTF setValue:mHexColor(0xEEEEEE) forKeyPath:@"_placeholderLabel.textColor"];
    _passwordTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    _passwordTF.textColor = mHexColor(0xEEEEEE);
    [self.backImg addSubview:_passwordTF];
    [_passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.pass_lineView.mas_left);
        make.right.equalTo(self.pass_lineView.mas_right);
        make.bottom.equalTo(self.pass_lineView.mas_top).offset(-10);
        make.height.equalTo(16);
    }];
    /***
     * 登录
     */
    _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _loginBtn.backgroundColor = kConfigColor;
    [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    _loginBtn.titleLabel.font = kFont16;
    _loginBtn.layer.masksToBounds = YES;
    _loginBtn.layer.cornerRadius = 48/2;
    [_loginBtn addTarget:self action:@selector(loginBtnWithAction:) forControlEvents:UIControlEventTouchUpInside];
    [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.backImg addSubview:_loginBtn];
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.backImg.mas_centerX);
        make.top.equalTo(self.pass_lineView.mas_bottom).offset(55);
        make.height.equalTo(48);
        make.width.equalTo(ScreenWidth-80);
    }];
    
    _presentLB = [[UILabel alloc] init];
    _presentLB.text = @"没有账号密码 ? 请联系平台管理员";
    _presentLB.font = [UIFont systemFontOfSize:12];
    _presentLB.textColor = mHexColor(0xE6E6E6);
    _presentLB.textAlignment = NSTextAlignmentCenter;
    [self.backImg addSubview:_presentLB];
    [_presentLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.backImg.mas_centerX);
        make.top.equalTo(self.loginBtn.mas_bottom).offset(20);
        make.width.equalTo(ScreenWidth-80);
        make.height.equalTo(16);
    }];
    
}
//点击空白回收键盘
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if ([self.userNameTF isFirstResponder]) {
        [self.userNameTF resignFirstResponder];
    }
    if ([self.passwordTF isFirstResponder]) {
        [self.passwordTF resignFirstResponder];
    }
}
#pragma mark -- UITextFieldDelegate
/***
 * 点击return 回收键盘
 **/
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.userNameTF || textField == self.passwordTF) {
        [self.userNameTF resignFirstResponder];
        [self.passwordTF resignFirstResponder];
    }
    return YES;
}

#pragma mark -- UIButton的响应事件
- (void)loginBtnWithAction:(UIButton *)sender {
    NSLog(@"点击登录");
}

@end
