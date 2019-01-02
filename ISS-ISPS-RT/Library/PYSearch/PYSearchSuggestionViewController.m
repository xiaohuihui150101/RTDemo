//
//  GitHub: https://github.com/iphone5solo/PYSearch
//  Created by CoderKo1o.
//  Copyright © 2016 iphone5solo. All rights reserved.
//

#import "PYSearchSuggestionViewController.h"
#import "PYSearchConst.h"

@interface PYSearchSuggestionViewController ()

@property (nonatomic, assign) UIEdgeInsets originalContentInsetWhenKeyboardShow;
@property (nonatomic, assign) UIEdgeInsets originalContentInsetWhenKeyboardHidden;

@property (nonatomic, assign) BOOL keyboardDidShow;

@end

@implementation PYSearchSuggestionViewController

+ (instancetype)searchSuggestionViewControllerWithDidSelectCellBlock:(PYSearchSuggestionDidSelectCellBlock)didSelectCellBlock
{
    PYSearchSuggestionViewController *searchSuggestionVC = [[PYSearchSuggestionViewController alloc] init];
    searchSuggestionVC.didSelectCellBlock = didSelectCellBlock;
    searchSuggestionVC.automaticallyAdjustsScrollViewInsets = NO;
    return searchSuggestionVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.scrollEnabled = NO;
    if ([self.tableView respondsToSelector:@selector(setCellLayoutMarginsFollowReadableWidth:)]) { // For the adapter iPad
        self.tableView.cellLayoutMarginsFollowReadableWidth = NO;
    }
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;//UIScrollView也适用
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboradFrameDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboradFrameDidHidden:) name:UIKeyboardDidHideNotification object:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //  [self setEdgesForExtendedLayout:UIRectEdgeNone];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
  //   [self setEdgesForExtendedLayout:UIRectEdgeNone];
    
    if (self.keyboardDidShow) {
        self.originalContentInsetWhenKeyboardShow = self.tableView.contentInset;
    } else {
        self.originalContentInsetWhenKeyboardHidden = self.tableView.contentInset;
    }
}

- (void)keyboradFrameDidShow:(NSNotification *)notification
{
    self.keyboardDidShow = YES;
    [self setSearchSuggestions:_searchSuggestions];
}

- (void)keyboradFrameDidHidden:(NSNotification *)notification
{
    self.keyboardDidShow = NO;
    self.originalContentInsetWhenKeyboardHidden = UIEdgeInsetsMake(-36, 0, 30, 0);
    [self setSearchSuggestions:_searchSuggestions];
}

#pragma mark - setter
- (void)setSearchSuggestions:(NSArray<NSString *> *)searchSuggestions
{
    _searchSuggestions = [searchSuggestions copy];
    
    [self.tableView reloadData];
    
    /**
     * Adjust the searchSugesstionView when the keyboard changes.
     * more information can see : https://github.com/iphone5solo/PYSearch/issues/61
     */
     if (@available(iOS 11.0, *)) {

         if (self.keyboardDidShow && !UIEdgeInsetsEqualToEdgeInsets(self.originalContentInsetWhenKeyboardShow, UIEdgeInsetsZero) && !UIEdgeInsetsEqualToEdgeInsets(self.originalContentInsetWhenKeyboardShow, UIEdgeInsetsMake(-36, 0, 30 - CGRectGetMaxY(self.navigationController.navigationBar.frame), 0))) {
        self.tableView.contentInset =  self.originalContentInsetWhenKeyboardShow;
         } else if (!self.keyboardDidShow && !UIEdgeInsetsEqualToEdgeInsets(self.originalContentInsetWhenKeyboardHidden, UIEdgeInsetsZero) && !UIEdgeInsetsEqualToEdgeInsets(self.originalContentInsetWhenKeyboardHidden, UIEdgeInsetsMake(-36, 0, 30 - CGRectGetMaxY(self.navigationController.navigationBar.frame), 0))) {
        self.tableView.contentInset =  self.originalContentInsetWhenKeyboardHidden;
         }
         self.tableView.contentOffset = CGPointMake(0, -self.tableView.contentInset.top);}
     else
     {
         self.tableView.contentOffset = CGPointMake(0, 0);
     }
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if ([self.dataSource respondsToSelector:@selector(numberOfSectionsInSearchSuggestionView:)]) {
        return [self.dataSource numberOfSectionsInSearchSuggestionView:tableView];
    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self.dataSource respondsToSelector:@selector(searchSuggestionView:numberOfRowsInSection:)]) {
        return [self.dataSource searchSuggestionView:tableView numberOfRowsInSection:section];
    }
    return self.searchSuggestions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.dataSource respondsToSelector:@selector(searchSuggestionView:cellForRowAtIndexPath:)]) {
        UITableViewCell *cell= [self.dataSource searchSuggestionView:tableView cellForRowAtIndexPath:indexPath];
        if (cell) return cell;
    }
    
    static NSString *cellID = @"PYSearchSuggestionCellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.textLabel.textColor = [UIColor darkGrayColor];
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.backgroundColor = [UIColor whiteColor];
//        [cell.textLabel mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(24);
//            make.right.equalTo(-8);
//            make.centerY.equalTo(0);
//        }];
        UIImageView *line = [[UIImageView alloc] initWithImage: [NSBundle py_imageNamed:@"cell-content-line"]];
        line.py_height = 0.5;
        line.alpha = 0.7;
        line.py_x = 0;
        line.py_y = 43.5;
        line.py_width = MAIN_WIDTH;
        [cell.contentView addSubview:line];
    }
    cell.imageView.image = nil;
    if ([self.searchSuggestions[indexPath.row] isKindOfClass:[NSAttributedString class]]) {
        cell.textLabel.attributedText = self.searchSuggestions[indexPath.row];
    }
    else {
        cell.textLabel.text = self.searchSuggestions[indexPath.row];
    }
   
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.dataSource respondsToSelector:@selector(searchSuggestionView:heightForRowAtIndexPath:)]) {
        return [self.dataSource searchSuggestionView:tableView heightForRowAtIndexPath:indexPath];
    }
    return 44.0;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (self.didSelectCellBlock) self.didSelectCellBlock([tableView cellForRowAtIndexPath:indexPath]);
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
        UIView * footView  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MAIN_WIDTH, 38)];
        footView.backgroundColor = [UIColor whiteColor];
        UIButton * closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(footView.frame.size.width-50, 0, 40, 38)];
        [closeBtn setTitle:@"关闭" forState:UIControlStateNormal];
        [closeBtn setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    closeBtn.titleLabel.font  = [UIFont systemFontOfSize:13.0f];
        [closeBtn addTarget:self action:@selector(closeView:) forControlEvents:UIControlEventTouchUpInside];
        [footView addSubview:closeBtn];
        return footView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
        return 38.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}

- (void)closeView:(UIButton *)sender
{
    if (self.dataSource&&[self.dataSource respondsToSelector:@selector(searchSuggestionViewClose)]) {
        [self.dataSource searchSuggestionViewClose];
    }
}
@end
