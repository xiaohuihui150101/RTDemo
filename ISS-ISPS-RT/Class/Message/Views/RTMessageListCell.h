//
//  RTMessageListCell.h
//  ISS-ISPS-RT
//
//  Created by isoft on 2018/12/19.
//  Copyright © 2018 isoft. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RTMessageListCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *titleLB;
@property (nonatomic, strong) UILabel *timeLB;
@property (nonatomic, strong) UILabel *contentLB;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIView *lookView;
@property (nonatomic, strong) UILabel *lookLB;

@property (nonatomic, strong) UIImageView *readImg;//显示已读或未读的标识

@end

NS_ASSUME_NONNULL_END
