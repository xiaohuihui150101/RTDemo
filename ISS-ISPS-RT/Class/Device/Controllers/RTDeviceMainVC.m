//
//  RTDeviceMainVC.m
//  ISS-ISPS-RT
//
//  Created by isoft on 2018/12/18.
//  Copyright © 2018 isoft. All rights reserved.
//

#import "RTDeviceMainVC.h"
#import "RTMessageListVC.h"
#import "RTDeviceMainCell.h"
#import "RTSingleVideoPlayVC.h"
#import "RTMoreVideoPlayVC.h"
#import "RTSearchResultVC.h"
#import "RTMaskPopups.h"
#import "RTTopView.h"


@interface RTDeviceMainVC ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, PYSearchViewControllerDelegate, PYSearchViewControllerDataSource, RTTopViewDelegate>

@property (nonatomic, strong) RTNoDataView *noDataView;

@property (nonatomic, strong) UIView *redPoint;

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) RTMaskPopups *maskPopups;//控制点击区域的弹框

@end

@implementation RTDeviceMainVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barTintColor = kConfigColor;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"设备管理";
    
    self.view.backgroundColor = mHexColor(0xEAEAEA);
    [self setInsetNoneWithScrollView:self.collectionView];
    [self addNavigationBtn];
    self.noDataView.hidden = YES;
    
}
#pragma mark -- 配置导航栏
- (void)addNavigationBtn {
    /**
     * 左边导航栏
     **/
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 45, 44);
    [leftBtn setImage:[UIImage imageNamed:@"search_n"] forState:UIControlStateNormal];
    leftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [leftBtn addTarget:self action:@selector(leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    /**
     * 右边导航栏
     **/
    UIButton *rightBtn = [[UIButton alloc] init];
    rightBtn.frame = CGRectMake(0, 0, 45, 44);
    [rightBtn setImage:[UIImage imageNamed:@"mess_white_n"] forState:UIControlStateNormal];
    [rightBtn setImage:[UIImage imageNamed:@"mess_white_n"] forState:UIControlStateHighlighted];
    rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [rightBtn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    //消息的小红点
    self.redPoint = [[UIView alloc] initWithFrame:CGRectMake(39, 10, 6, 6)];
    [rightBtn addSubview:self.redPoint];
    self.redPoint.backgroundColor = [UIColor redColor];
    self.redPoint.clipsToBounds = YES;
    self.redPoint.layer.cornerRadius = 3;
    self.redPoint.hidden = YES;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    /**
     * 中间导航栏
     **/
    UIButton * button =[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20, 20, 100, 44);
    button.titleLabel.font = kFont15;
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:@"航站区/飞行区" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(centerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = button;
    
}
#pragma mark -- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RTDeviceMainCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RTDeviceMainCell" forIndexPath:indexPath];
    
    if (indexPath.row == 0 || indexPath.row == 1) {
        cell.bgImg.image = [UIImage imageNamed:@"device_nor"];
        cell.isSelectImg.hidden = YES;
    } else {
        cell.bgImg.image = [UIImage imageNamed:@"device_sel"];
        cell.isSelectImg.hidden = NO;
    }
    
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

- (RTNoDataView *)noDataView {
    if (!_noDataView) {
        _noDataView = [[RTNoDataView alloc] initWithFrame:self.view.bounds];
        _noDataView.viewType = RTNoDataViewTypeNone;
        [self.view addSubview:_noDataView];
    }
    return _noDataView;
}

#pragma mark -- 导航栏响应事件
- (void)leftBtnClick:(UIButton *)sender {
    NSLog(@"点击搜索");
    
    PYSearchViewController *searchVC = [PYSearchViewController searchViewControllerWithHotSearches:nil searchBarPlaceholder:@"请输入设备名称,编号" isHome:NO];
    searchVC.hotSearchStyle = 0;
    searchVC.searchHistoryStyle = PYHotSearchStyleDefault;
    searchVC.delegate = self;
    searchVC.dataSource = self;
    [self.navigationController pushViewController:searchVC animated:YES];
    
}
- (void)rightBtnClick:(UIButton *)sender {
    RTMessageListVC *vc = [[RTMessageListVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)centerBtnClick:(UIButton *)sender {
    RTTopView *topView= [[RTTopView alloc] init];
    topView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300);
    topView.delegate = self;
    _maskPopups = [RTMaskPopups popupsWithMaskStyle:MaskStyleBlackTranslucent aView:topView];
    _maskPopups.presentationStyle = PresentationStyleTop;
    [_maskPopups presentInView:self.view animated:YES completion:NULL];
}

#pragma mark -- RTTopViewDelegate
- (void)closeBtnWithAction:(UIButton *)sender {
    [_maskPopups dismissAnimated:YES completion:nil];
}

#pragma mark -- PYSearchViewControllerDataSource
- (void)didClickCancel:(PYSearchViewController *)searchViewController {
    NSLog(@"点击取消");
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)searchViewController:(PYSearchViewController *)searchViewController didSearchWithSearchBar:(UISearchBar *)searchBar searchText:(NSString *)searchText {
    RTSearchResultVC *vc = [[RTSearchResultVC alloc] init];
    vc.searchStr = searchBar.text;
    [self.navigationController pushViewController:vc animated:NO];
}



@end
