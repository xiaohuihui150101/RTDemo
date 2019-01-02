//
//  RTNoDataView.h
//  ISS-ISPS-RT
//
//  Created by isoft on 2018/12/20.
//  Copyright © 2018 isoft. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  没有数据的展示View
 */

typedef NS_ENUM(NSUInteger, RTNoDataViewType) {
    RTNoDataViewTypeNone,             // 自定义
    RTNoDataViewTypeSearch,           // 搜索空场
    RTNoDataViewTypeNoDate           // 暂无数据
};

/**
 例：
 为了统一管理空场页面，将显示的图片、文字集中处理
 使用方法：
 1.添加枚举
 2.设置文字、图片
 3.引用空场
 
 OC:=========
 @property (nonatomic, strong) RTNoDataView *noDataView;
 
 - (RTNoDataView *)noDataView
 {
 if (!_noDataView) {
 _noDataView = [[RTNoDataView alloc] initWithFrame:self.view.bounds];
 _noDataView.viewType = RTNoDataViewTypeInvestOrder;
 [self.view addSubview:_noDataView];
 }
 return _noDataView;
 }
 
 if (weakSelf.orderVM.dataArray.count <= 0) {
 weakSelf.noDataView.hidden = NO;
 } else {
 weakSelf.noDataView.hidden = YES;
 }
 */

@interface RTNoDataView : UIView

@property (nonatomic, assign) RTNoDataViewType viewType;

@property (nonatomic, strong) UIImage *noDataImage;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *detailText;

@property (nonatomic, strong) UIButton *bottomButton;

@property (nonatomic, strong) UILabel *titleLabel;

@property(nonatomic, strong) UIButton *refreshBtn;
@property (nonatomic, strong) UIImageView *noDataIV;

@property(nonatomic, strong) UIView *borderView;


@end


