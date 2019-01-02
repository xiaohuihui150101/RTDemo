//
//  RTMessageListVC.m
//  ISS-ISPS-RT
//
//  Created by isoft on 2018/12/19.
//  Copyright © 2018 isoft. All rights reserved.
//

#import "RTMessageListVC.h"
#import "RTMessageListCell.h"
#import "RTMessageDetailVC.h"

@interface RTMessageListVC ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation RTMessageListVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = mHexColor(0xEAEAEA);
    self.navigationItem.title = @"消息通知";
    [self setInsetNoneWithScrollView:self.collectionView];
}
#pragma mark -- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 50;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RTMessageListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RTMessageListCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    
    mWeakSelf
    [cell.lookView tapHandle:^NSString * _Nonnull{
        RTMessageDetailVC *vc = [[RTMessageDetailVC alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
        return @"点击查看详情";
    }];
    
    return cell;
}

#pragma mark -- UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(ScreenWidth-32, 154);
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
        flowLayout.minimumInteritemSpacing = 8;
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 16, 10);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = mHexColor(0xEAEAEA);
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        //注册cell
        [_collectionView registerClass:[RTMessageListCell class] forCellWithReuseIdentifier:@"RTMessageListCell"];
    }
    return _collectionView;
}

@end
