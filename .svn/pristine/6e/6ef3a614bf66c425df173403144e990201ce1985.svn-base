//
//  RTTopView.m
//  ISS-ISPS-RT
//
//  Created by isoft on 2018/12/26.
//  Copyright © 2018 isoft. All rights reserved.
//

#import "RTTopView.h"


@implementation RTTopView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        _closebtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _closebtn.backgroundColor = [UIColor purpleColor];
        _closebtn.frame = CGRectMake(0, 0, 100, 200);
        [_closebtn addTarget:self action:@selector(closeButtonWithAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_closebtn];
        
    }
    return self;
}

- (void)closeButtonWithAction:(UIButton *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(closeBtnWithAction:)]) {
        [self.delegate closeBtnWithAction:sender];
    }
}

@end
