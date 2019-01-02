//
//  RTDeviceMainCell.h
//  ISS-ISPS-RT
//
//  Created by isoft on 2018/12/20.
//  Copyright © 2018 isoft. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RTDeviceMainCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *bgImg;

@property (nonatomic, strong) UILabel *deviceNameLB;
@property (nonatomic, strong) UILabel *statsLB;
@property (nonatomic, strong) UILabel *lookLB;

@property (nonatomic, strong) UIImageView *nameImg;
@property (nonatomic, strong) UILabel *nameLB;

@property (nonatomic, strong) UIImageView *numberImg;
@property (nonatomic, strong) UILabel *numberLB;

@property (nonatomic, strong) UIImageView *locationImg;
@property (nonatomic, strong) UILabel *locationLB;

@property (nonatomic, strong) UIImageView *isSelectImg;




@end

NS_ASSUME_NONNULL_END
