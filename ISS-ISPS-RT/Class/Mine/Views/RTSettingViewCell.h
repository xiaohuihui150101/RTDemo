//
//  RTSettingViewCell.h
//  ISS-ISPS-RT
//
//  Created by isoft on 2018/12/19.
//  Copyright © 2018 isoft. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RTSettingViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *nameLB;
@property (nonatomic, strong) UIImageView *arrowImg;
@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UISwitch *offSwitch;

@end

NS_ASSUME_NONNULL_END
