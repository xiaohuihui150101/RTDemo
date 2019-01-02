//
//  RTAlertView.m
//  ISS-ISPS-RT
//
//  Created by isoft on 2018/12/18.
//  Copyright © 2018 isoft. All rights reserved.
//

#import "RTAlertView.h"
#import "RTAlertActionCell.h"

//#define KHight   230

@interface RTAlertView ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *reTableView;

@property (nonatomic, strong) UIView *creatFootView;
@property (nonatomic, strong) UIButton *cancleBtn;

@property (nonatomic, copy) ClickBlock btnClick;

@property (nonatomic, strong) NSArray *titles;

@property (nonatomic, assign) CGFloat kHeight;

@end

@implementation RTAlertView

- (instancetype)initWithTitles:(NSArray *)titles clickAction:(ClickBlock)clickBlock {
    self = [super init];
    if (self) {
        
        _btnClick = clickBlock;
        self.titles = titles;
        [self commnInit];
        
    }
    return self;
}

- (instancetype)initWithTitles:(NSArray *)titles height:(CGFloat)height clickAction:(ClickBlock)clickBlock {
    self = [super init];
    if (self) {
        _btnClick = clickBlock;
        self.titles = titles;
        self.kHeight = height;
        [self commnInit];
    }
    return self;
}

- (void)commnInit {
    [self addSubview:self.reTableView];
    
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.25];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.frame = self.superview.bounds;
    self.reTableView.frame = CGRectMake(0, ScreenHeight - self.kHeight, ScreenWidth, self.kHeight);
}


- (UIView *)creatFootView {
    if (!_creatFootView) {
        _creatFootView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 50)];
        
        UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 5)];
        backView.backgroundColor = mHexColor(0x626364);
        [_creatFootView addSubview:backView];
        
        _cancleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancleBtn.frame = CGRectMake(16, 10, ScreenWidth - 32, 35);
        [_cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
        _cancleBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [_cancleBtn setTitleColor:kBlackColor forState:UIControlStateNormal];
        [_cancleBtn addTarget:self action:@selector(cancleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [_creatFootView addSubview:_cancleBtn];
    }
    return _creatFootView;
}

- (UITableView *)reTableView {
    if (!_reTableView) {
        _reTableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _reTableView.backgroundColor = [UIColor whiteColor];
        _reTableView.delegate = self;
        _reTableView.dataSource = self;
        _reTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _reTableView.tableFooterView = [self creatFootView];
        _reTableView.showsVerticalScrollIndicator = NO;
        _reTableView.scrollEnabled = NO;
        if ([_reTableView respondsToSelector:@selector(setSeparatorInset:)]) {
            [_reTableView setSeparatorInset:UIEdgeInsetsZero];
        }
        if ([_reTableView respondsToSelector:@selector(setLayoutMargins:)]) {
            [_reTableView setLayoutMargins:UIEdgeInsetsZero];
        }
        //注册cell
        [_reTableView registerClass:[RTAlertActionCell class] forCellReuseIdentifier:@"RTAlertActionCell"];
        
    }
    return _reTableView;
}
#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RTAlertActionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RTAlertActionCell"];
    cell.textLB.text = self.titles[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 36+12;
    return 45;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (self.btnClick) {
        self.btnClick(self, indexPath);
    }
    [self hide];
}


- (void)show {
    //在主线程中弹出，不然会被遮挡，导致看不到视图。
    dispatch_async(dispatch_get_main_queue(), ^{
        self.alpha = 0.0f;
        [[UIApplication sharedApplication].keyWindow addSubview:self];
        [UIView animateWithDuration:0.35f
                              delay:0.0
             usingSpringWithDamping:0.9
              initialSpringVelocity:0.7
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             self.alpha = 1.0;
                             self.reTableView.transform = CGAffineTransformMakeTranslation(0, -self.kHeight);
                         }
                         completion:^(BOOL finished) {
                             
                         }];
    });
}

- (void)hide {
    [UIView animateWithDuration:0.35f
                          delay:0.0
         usingSpringWithDamping:0.9
          initialSpringVelocity:0.7
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.alpha = 0;
                         self.reTableView.frame = CGRectMake(0, ScreenHeight, ScreenWidth, self.kHeight);
                     } completion:^(BOOL finished) {
                         self.alpha = 1.0f;
                         [self removeFromSuperview];
                     }];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    //获取点击的点，判断是否在tableview上
    CGPoint point = [touch locationInView:self];
    if (!CGRectContainsPoint(self.reTableView.frame, point)) {
        [self hide];
    }
}

- (void)cancleButtonAction:(UIButton *)sender {
    [self hide];
}


@end
