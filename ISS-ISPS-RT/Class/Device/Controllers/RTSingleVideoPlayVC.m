//
//  RTSingleVideoPlayVC.m
//  ISS-ISPS-RT
//
//  Created by isoft on 2018/12/21.
//  Copyright © 2018 isoft. All rights reserved.
//

#import "RTSingleVideoPlayVC.h"
#import "RTVideoPlayHeaderView.h"
#import "RTSingleVideoPlayCell.h"
#import "RTLandScapePlayVC.h"

@interface RTSingleVideoPlayVC ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSArray *textArray;

@end

@implementation RTSingleVideoPlayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"视频播放";
    self.view.backgroundColor = kBottomColor;
    [self setInsetNoneWithScrollView:self.collectionView];
    
    self.textArray = @[@"设备名称: 摄像机V100", @"设备类型: 摄像机", @"设备状态: 运行中", @"设备区域: 航站楼-A区"];
}

#pragma mark - UIViewControllerRotation
//是否可以旋转
- (BOOL)shouldAutorotate {
    return YES;
}

//支持的方向
-(UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

#pragma mark -- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.textArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RTSingleVideoPlayCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RTSingleVideoPlayCell" forIndexPath:indexPath];
    cell.titleLB.text = self.textArray[indexPath.row];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader){
        RTVideoPlayHeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"RTVideoPlayHeaderView" forIndexPath:indexPath];
        
        reusableview = header;
        mWeakSelf
        [header.fullscreenBtn tapHandle:^NSString * _Nonnull{
            RTLandScapePlayVC *vc = [[RTLandScapePlayVC alloc] init];
            [weakSelf.navigationController pushViewController:vc animated:YES];
            return @"横屏播放";
        }];
    }
    
    return reusableview;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
   
    return CGSizeMake(ScreenWidth, ScreenWidth*0.56);
}

#pragma mark -- UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((ScreenWidth-32-10)/2, 24);
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
        flowLayout.minimumInteritemSpacing = 8;
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 16, 10, 16);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = kBottomColor;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        //注册cell和页眉
        [_collectionView registerClass:[RTSingleVideoPlayCell class] forCellWithReuseIdentifier:@"RTSingleVideoPlayCell"];
        [_collectionView registerClass:[RTVideoPlayHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"RTVideoPlayHeaderView"];
    }
    return _collectionView;
}


@end
