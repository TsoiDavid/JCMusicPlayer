//
//  MusicPlayerViewController.m
//  JCMusicPlayer
//
//  Created by admin on 16/5/6.
//  Copyright © 2016年 Tsoi. All rights reserved.
//

#import "MusicPlayerViewController.h"
#import "MusicPlayerHeadView.h"
#import "MusicListItem.h"
#import <SDWebImage/UIImageView+WebCache.h>


@interface MusicPlayerViewController ()

@property (strong, nonatomic) UIImage *bgImage;

@end

@implementation MusicPlayerViewController

- (void)viewWillDisappear:(BOOL)animated {
    
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
    //设置整个项目所有nav的主题样式
    UINavigationBar *bar = [UINavigationBar appearance];
    //字体颜色
    NSDictionary *navbarAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                      [UIColor whiteColor] ,NSForegroundColorAttributeName, nil];
    [[UINavigationBar appearance] setTitleTextAttributes:navbarAttributes];
    
    [bar setTitleTextAttributes:navbarAttributes];
    //背景颜色
    [bar setBarTintColor:[[UIColor clearColor]rgbToColorRed:93 Green:93 Blue:117]];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    导航栏变为透明
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:0];
    //    让黑线消失的方法
    self.navigationController.navigationBar.shadowImage=[UIImage new];
    
    self.view.backgroundColor = [UIColor whiteColor];
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"clear"] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setShadowImage:[UIImage imageNamed:@"clear"]];
    
//    self.navigationController.navigationBarHidden = YES;
    [self setUI];
}
- (void)setUI {
    //导航头
//    self.navigationController.title = @"Hehe";
    MusicPlayerHeadView *headView = [MusicPlayerHeadView instanceView];
    headView.title = _musicModel.title;
    headView.artist = _musicModel.artist;
    self.navigationItem.titleView = headView;
    
    _bgImageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    self.bgImageView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_bgImageView];
    //模糊化
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:_bgImageView.frame];
    toolbar.barStyle = UIBarStyleBlackTranslucent;
    [_bgImageView addSubview:toolbar];
    
    
  

    //获取图片
    [self sdWebDownLoadImageWithUrl:_musicModel.pic];
    
}

- (void)sdWebDownLoadImageWithUrl:(NSString *)urlString {
    __weak typeof(self) weakSelf = self;
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    [manager downloadImageWithURL:[NSURL URLWithString:urlString] options:SDWebImageCacheMemoryOnly progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
//        weakSelf.bgImage = image;
        weakSelf.bgImageView.image = image;
    }];
}

@end
