//
//  RTFeedBackVC.m
//  ISS-ISPS-RT
//
//  Created by isoft on 2018/12/19.
//  Copyright © 2018 isoft. All rights reserved.
//

#import "RTFeedBackVC.h"

#define  MaxTextLenght 500

@interface RTFeedBackVC ()<UITextViewDelegate>

@property (nonatomic, strong) UIView *backView;

@property (nonatomic, strong) UITextView *feedbackTextView;
@property (nonatomic, strong) UIButton *saveBtn;

@end

@implementation RTFeedBackVC
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"意见反馈";
    self.view.backgroundColor = mHexColor(0xEAEAEA);
    
    [self initUI];
    
}
#pragma mark -- UI布局
- (void)initUI {
    _backView = [[UIView alloc] initWithFrame:CGRectMake(0, statusBar+64, ScreenWidth, ScreenWidth*0.42)];
    _backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_backView];
    /**
     * 输入框
     **/
    _feedbackTextView = [[UITextView alloc] initWithFrame:CGRectMake(15, 15, ScreenWidth-15, ScreenWidth*0.42-15)];
    _feedbackTextView.font = kFont14;
    _feedbackTextView.textColor = kBlackColor;
    _feedbackTextView.placeholder = @"请输入遇到的问题或建议";
    _feedbackTextView.delegate = self;
    _feedbackTextView.placeholderColor = mHexColor(0x999999);
    _feedbackTextView.placeholderLabel.font = kFont14;
    [self.backView addSubview:_feedbackTextView];
    
    _saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _saveBtn.frame = CGRectMake(40, CGRectGetMaxY(self.backView.frame)+80, ScreenWidth-80, 48);
    _saveBtn.backgroundColor = kConfigColor;
    _saveBtn.titleLabel.font = kFont16;
    [_saveBtn setTitleColor:kWhiteColor forState:UIControlStateNormal];
    [_saveBtn setTitle:@"提交" forState:UIControlStateNormal];
    [_saveBtn addTarget:self action:@selector(saveBtnWithAction:) forControlEvents:UIControlEventTouchUpInside];
    _saveBtn.layer.cornerRadius = 24.0f;
    _saveBtn.layer.masksToBounds = YES;
    [self.view addSubview:_saveBtn];
    
}

#pragma mark textviewDelegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if (textView.text.length+text.length>MaxTextLenght) {
        [self.view showWarning:[NSString stringWithFormat:@"最大可输入%i个字符",MaxTextLenght]];
        return NO;
    } else {
        return YES;
    }
}

//点击空白回收键盘
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.feedbackTextView resignFirstResponder];
}

#pragma mark -- 提交按钮的事件
- (void)saveBtnWithAction:(UIButton *)sender {
    
    if (self.feedbackTextView.text.length == 0) {
        [self.view showWarning:@"反馈信息不能为空"];
        return;
    }
    [self.feedbackTextView resignFirstResponder];
    NSLog(@"点击提交按钮");
}

@end
