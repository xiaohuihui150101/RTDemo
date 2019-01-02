//
//  RTMineViewCell.h
//  ISS-ISPS-RT
//
//  Created by isoft on 2018/12/19.
//  Copyright © 2018 isoft. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RTMineViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *iconImg;
@property (nonatomic, strong) UILabel *titleLB;

@property (nonatomic, strong) UILabel *redLB;

@property (nonatomic, strong) UIView *lineView;

@end

NS_ASSUME_NONNULL_END
