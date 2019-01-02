//
//  RTSearchResultVC.m
//  ISS-ISPS-RT
//
//  Created by isoft on 2018/12/24.
//  Copyright © 2018 isoft. All rights reserved.
//

#import "RTSearchResultVC.h"
#import "RTDeviceMainCell.h"
#import "RTSingleVideoPlayVC.h"
#import "RTMoreVideoPlayVC.h"

@interface RTSearchResultVC ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation RTSearchResultVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barTintColor = kConfigColor;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = kBottomColor;
    self.view.backgroundColor = mHexColor(0xEAEAEA);
    [self setInsetNoneWithScrollView:self.collectionView];
    self.navigationItem.title = self.searchStr;
    
}

#pragma mark -- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RTDeviceMainCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RTDeviceMainCell" forIndexPath:indexPath];
    
    
    mWeakSelf
    [cell.lookLB tapHandle:^NSString * _Nonnull{
        [weakSelf initLookTapHandle];
        return @"点击查看按钮";
    }];
    
    return cell;
}
- (void)initLookTapHandle {
    NSArray *titles = @[@"设备单选", @"设备多选"];
    RTAlertView *alert = [[RTAlertView alloc] initWithTitles:titles height:140+BottomHeight clickAction:^(RTAlertView * _Nonnull actiont, NSIndexPath * _Nonnull indexPath) {
        if ([titles[indexPath.row] isEqualToString:@"设备单选"]) {
            NSLog(@"点击设备单选");
        } else if ([titles[indexPath.row] isEqualToString:@"设备多选"]) {
            NSLog(@"点击设备多选");
        }
    }];
    [alert show];
}
#pragma mark -- UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        RTSingleVideoPlayVC *vc = [[RTSingleVideoPlayVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        RTMoreVideoPlayVC *vc = [[RTMoreVideoPlayVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
#pragma mark -- UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(ScreenWidth-30, 130);
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
        flowLayout.minimumInteritemSpacing = 8;
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = mHexColor(0xEAEAEA);
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        //注册cell
        [_collectionView registerClass:[RTDeviceMainCell class] forCellWithReuseIdentifier:@"RTDeviceMainCell"];
        
    }
    return _collectionView;
}

@end
