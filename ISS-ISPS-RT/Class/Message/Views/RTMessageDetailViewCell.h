//
//  RTMessageDetailViewCell.h
//  ISS-ISPS-RT
//
//  Created by isoft on 2018/12/19.
//  Copyright © 2018 isoft. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RTMessageDetailViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *contentLB;

@property (nonatomic, strong) UIImageView *backImg;
@property (nonatomic, strong) UIButton *playBtn;

@end

NS_ASSUME_NONNULL_END
