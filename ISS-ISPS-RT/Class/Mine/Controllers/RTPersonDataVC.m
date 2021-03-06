//
//  RTPersonDataVC.m
//  ISS-ISPS-RT
//
//  Created by isoft on 2018/12/19.
//  Copyright © 2018 isoft. All rights reserved.
//

#import "RTPersonDataVC.h"
#import "RTPersonalViewCell.h"
#import <TZImagePickerController.h>
#import <UIView+Layout.h>
#import <Photos/Photos.h>
#import <TZImageManager.h>
#import <TZPhotoPreviewController.h>
#import <TZLocationManager.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "RTReviseNameVC.h"


@interface RTPersonDataVC ()<UITableViewDelegate, UITableViewDataSource, TZImagePickerControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UITableView *reTableView;
@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, strong) NSData *data;
@property (nonatomic, strong) UIImagePickerController *imagePickerVc;
@property (strong, nonatomic) CLLocation *location;

@end

@implementation RTPersonDataVC
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = kBottomColor;
    self.navigationItem.title = @"个人资料";
    [self setInsetNoneWithScrollView:self.reTableView];
    
    self.titleArray = @[@"头像", @"姓名", @"性别", @"工号", @"区域", @"所在地"];
    
}
#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RTPersonalViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RTPersonalViewCell"];
    if (indexPath.row == 0) {
        cell.headImg.hidden = NO;
        cell.subNameLB.hidden = YES;
        if (self.data.bytes > 0) {
           cell.headImg.image = [UIImage imageWithData:self.data];
        }
    } else {
        cell.headImg.hidden = YES;
        cell.subNameLB.hidden = NO;
        if (indexPath.row == 1 || indexPath.row == 2 ) {
            cell.arrowImg.hidden = NO;
        } else {
            cell.arrowImg.hidden = YES;
        }
    }
    cell.nameLB.text = self.titleArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *vi = [[UIView alloc] init];
    vi.backgroundColor = [UIColor whiteColor];
    return vi;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        NSArray *titles = @[@"拍照", @"从手机相册选择"];
        mWeakSelf
        RTAlertView *alert = [[RTAlertView alloc] initWithTitles:titles height:140+BottomHeight clickAction:^(RTAlertView * _Nonnull actiont, NSIndexPath * _Nonnull indexPath) {
            NSLog(@"当前选中的是%@",titles[indexPath.row]);
            if ([titles[indexPath.row] isEqualToString:@"拍照"]) {
                [weakSelf takePhoto];
            } else if ([titles[indexPath.row] isEqualToString:@"从手机相册选择"]) {
                [weakSelf pushTZImagePickerController];
            }
            
        }];
        [alert show];
    } else if (indexPath.row == 1) {
        RTReviseNameVC *vc = [[RTReviseNameVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (UITableView *)reTableView {
    if (!_reTableView) {
        _reTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _reTableView.backgroundColor = kBottomColor;
        _reTableView.delegate = self;
        _reTableView.dataSource = self;
        _reTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_reTableView];
        [_reTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        //注册cell
        [_reTableView registerClass:[RTPersonalViewCell class] forCellReuseIdentifier:@"RTPersonalViewCell"];
        
    }
    return _reTableView;
}

- (void)pushTZImagePickerController {
    
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 columnNumber:4 delegate:self pushPhotoPickerVc:YES];
    imagePickerVc.allowTakePicture = NO; // 在内部显示拍照按钮
    imagePickerVc.allowTakeVideo = NO;   // 在内部显示拍视频按
    imagePickerVc.videoMaximumDuration = 10; // 视频最大拍摄时间
    [imagePickerVc setUiImagePickerControllerSettingBlock:^(UIImagePickerController *imagePickerController) {
        imagePickerController.videoQuality = UIImagePickerControllerQualityTypeHigh;
    }];
    
    imagePickerVc.iconThemeColor = [UIColor colorWithRed:31 / 255.0 green:185 / 255.0 blue:34 / 255.0 alpha:1.0];
    imagePickerVc.showPhotoCannotSelectLayer = YES;
    imagePickerVc.cannotSelectLayerColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8];
    [imagePickerVc setPhotoPickerPageUIConfigBlock:^(UICollectionView *collectionView, UIView *bottomToolBar, UIButton *previewButton, UIButton *originalPhotoButton, UILabel *originalPhotoLabel, UIButton *doneButton, UIImageView *numberImageView, UILabel *numberLabel, UIView *divideLine) {
        [doneButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }];
    imagePickerVc.allowPickingImage = YES;
    imagePickerVc.allowPickingOriginalPhoto = YES;
    // 4. 照片排列按修改时间升序
    imagePickerVc.sortAscendingByModificationDate = YES;
    /// 5. 单选模式,maxImagesCount为1时才生效
    imagePickerVc.showSelectBtn = NO;
    imagePickerVc.allowCrop = YES;
    imagePickerVc.needCircleCrop = YES;
    // 设置竖屏下的裁剪尺寸
    NSInteger left = 30;
    NSInteger widthHeight = self.view.tz_width - 2 * left;
    NSInteger top = (self.view.tz_height - widthHeight) / 2;
    imagePickerVc.cropRect = CGRectMake(left, top, widthHeight, widthHeight);
    imagePickerVc.statusBarStyle = UIStatusBarStyleLightContent;
    // 设置是否显示图片序号
    imagePickerVc.showSelectedIndex = NO;
    
    //    // You can get the photos by block, the same as by delegate.
    //    // 你可以通过block或者代理，来得到用户选择的照片.
    //    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
    //        NSLog(@"===========%@", photos);
    //    }];
    
    [self presentViewController:imagePickerVc animated:YES completion:nil];
}

#pragma mark - UIImagePickerController

- (void)takePhoto {
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied) {
        // 无相机权限 做一个友好的提示
        [[RTAlert API] OkAlertWithTitle:@"无法使用相机" message:@"请在iPhone的""设置-隐私-相机""中允许访问相机" :@"设置" :@"取消" vc:self sure:^{
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        }];
       
    } else if (authStatus == AVAuthorizationStatusNotDetermined) {
        // fix issue 466, 防止用户首次拍照拒绝授权时相机页黑屏
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            if (granted) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self takePhoto];
                });
            }
        }];
        // 拍照之前还需要检查相册权限
    } else if ([PHPhotoLibrary authorizationStatus] == 2) { // 已被拒绝，没有相册权限，将无法保存拍的照片
        [[RTAlert API] OkAlertWithTitle:@"无法使用相机" message:@"请在iPhone的""设置-隐私-相机""中允许访问相机" :@"设置" :@"取消" vc:self sure:^{
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        }];
    } else if ([PHPhotoLibrary authorizationStatus] == 0) { // 未请求过相册权限
        [[TZImageManager manager] requestAuthorizationWithCompletion:^{
            [self takePhoto];
        }];
    } else {
        [self pushImagePickerController];
    }
}

// 调用相机
- (void)pushImagePickerController {
    // 提前定位
    //    __weak typeof(self) weakSelf = self;
    //    [[TZLocationManager manager] startLocationWithSuccessBlock:^(NSArray<CLLocation *> *locations) {
    //        __strong typeof(weakSelf) strongSelf = weakSelf;
    //        strongSelf.location = [locations firstObject];
    //    } failureBlock:^(NSError *error) {
    //        __strong typeof(weakSelf) strongSelf = weakSelf;
    //        strongSelf.location = nil;
    //    }];
    
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        self.imagePickerVc.sourceType = sourceType;
        _imagePickerVc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        [self presentViewController:_imagePickerVc animated:YES completion:nil];
    } else {
        NSLog(@"模拟器中无法打开照相机,请在真机中使用");
    }
}

- (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    
    TZImagePickerController *tzImagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
    tzImagePickerVc.sortAscendingByModificationDate = YES;
    [tzImagePickerVc showProgressHUD];
    if ([type isEqualToString:@"public.image"]) {
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        UIImage *photo = [self scaleImage:image toSize:CGSizeMake(828, (int)(828 * image.size.height / image.size.width))];
        
        NSData *data;
        if (UIImagePNGRepresentation(photo) == nil) {
            data = UIImageJPEGRepresentation(photo, 0.3);
        } else {
            data = UIImagePNGRepresentation(photo);
        }
        self.data = data;
        [self.reTableView reloadData];
        NSLog(@"摄像机打印的====%@========%@", image, data);
        // save photo and get asset / 保存图片，获取到asset
        [[TZImageManager manager] savePhotoWithImage:image location:self.location completion:^(PHAsset *asset, NSError *error){
            [tzImagePickerVc hideProgressHUD];
            if (error) {
                NSLog(@"图片保存失败 %@",error);
            } else {
                TZAssetModel *assetModel = [[TZImageManager manager] createModelWithAsset:asset];
                //                if (self.allowCropSwitch.isOn) { // 允许裁剪,去裁剪
                //                    TZImagePickerController *imagePicker = [[TZImagePickerController alloc] initCropTypeWithAsset:assetModel.asset photo:image completion:^(UIImage *cropImage, id asset) {
                //                        [self refreshCollectionViewWithAddedAsset:asset image:cropImage];
                //                    }];
                //                    imagePicker.needCircleCrop = self.needCircleCropSwitch.isOn;
                //                    imagePicker.circleCropRadius = 100;
                //                    [self presentViewController:imagePicker animated:YES completion:nil];
                //                } else {
                [self refreshCollectionViewWithAddedAsset:assetModel.asset image:image];
                //                }
            }
        }];
    }
}

- (UIImage *)scaleImage:(UIImage *)image toSize:(CGSize)size {
    if (image.size.width < size.width) {
        return image;
    }
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (void)refreshCollectionViewWithAddedAsset:(PHAsset *)asset image:(UIImage *)image {
    
    
    if ([asset isKindOfClass:[PHAsset class]]) {
        PHAsset *phAsset = asset;
        NSLog(@"location:%@",phAsset.location);
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    if ([picker isKindOfClass:[UIImagePickerController class]]) {
        [picker dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark - TZImagePickerControllerDelegate
/***
 * 从相册中选择
 ***/
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto infos:(NSArray<NSDictionary *> *)infos {
    for (UIImage *image in photos) {
        NSData *data = UIImageJPEGRepresentation(image, 0.3);
        NSLog(@"相册打印的===%@======%@", image, data);
        self.data = data;
        [self.reTableView reloadData];
    }
}


- (UIImagePickerController *)imagePickerVc {
    if (_imagePickerVc == nil) {
        _imagePickerVc = [[UIImagePickerController alloc] init];
        _imagePickerVc.delegate = self;
        // set appearance / 改变相册选择页的导航栏外观
        //         picker.navigationBar.barTintColor = HexRGB(0x4294FE);
        _imagePickerVc.navigationBar.barTintColor = self.navigationController.navigationBar.barTintColor;
        _imagePickerVc.navigationBar.tintColor = self.navigationController.navigationBar.tintColor;
        UIBarButtonItem *tzBarItem, *BarItem;
        if (@available(iOS 9, *)) {
            tzBarItem = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[TZImagePickerController class]]];
            BarItem = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UIImagePickerController class]]];
        } else {
            tzBarItem = [UIBarButtonItem appearanceWhenContainedIn:[TZImagePickerController class], nil];
            BarItem = [UIBarButtonItem appearanceWhenContainedIn:[UIImagePickerController class], nil];
        }
        NSDictionary *titleTextAttributes = [tzBarItem titleTextAttributesForState:UIControlStateNormal];
        [BarItem setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
        
    }
    return _imagePickerVc;
}

@end
