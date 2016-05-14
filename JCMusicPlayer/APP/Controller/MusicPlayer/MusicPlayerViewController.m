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
#import "MusicPlayerManager.h"
#import "JCNavigationBar.h"
#import <SDWebImage/UIImageView+WebCache.h>

static const CGFloat NavagationBarHeight = 64;

@interface MusicPlayerViewController ()

@property (strong,nonatomic) JCNavigationBar *jcBar;
@property (strong,nonatomic) UIToolbar *toolBar;
@property (strong,nonatomic) CALayer *imageLayer;
@property (strong,nonatomic) UIImage *stopImage;
@end

@implementation MusicPlayerViewController

- (void)viewWillDisappear:(BOOL)animated {

    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self.view addSubview:self.jcBar];
  
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUI];
    
}
- (UIImage *)getDataFromMusicManager {
    return [MusicPlayerManager shareInstance].bgImage;
}
- (void)setUI {
    
     self.view.backgroundColor = [UIColor whiteColor];
    //导航头
    MusicPlayerHeadView *headView = [MusicPlayerHeadView instanceView];
    headView.title = _musicModel.title;
    headView.artist = _musicModel.artist;
    headView.titleColor = [UIColor whiteColor];
    self.jcBar.titleView = headView;


    self.imageLayer = [CALayer layer];
    _imageLayer.frame = self.view.frame;
    
    [self.view.layer addSublayer:_imageLayer];
    
    //模糊化
    _toolBar = [[UIToolbar alloc] initWithFrame:self.view.frame];
    _toolBar.barStyle = UIBarStyleBlackTranslucent;
    [self.view addSubview:_toolBar];
    
   UIImage *bgimage = [self getDataFromMusicManager];;
    
    if (!bgimage) {
        bgimage = [UIImage setBackgroundImageByColor:[UIColor grayColor] withFrame:self.view.frame];
    }
    self.imageLayer.contents = (__bridge id)bgimage.CGImage;
    
    
    __weak typeof(self)weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //获取图片
        [weakSelf sdWebDownLoadImageWithUrl:_musicModel.pic];
    });
    
    
}
- (void)layerAnimation {
    
    UIImage *stopImage = _stopImage;
    
    //contents动画
    CABasicAnimation *contentsAnimation = [CABasicAnimation animationWithKeyPath:@"contents"];
    contentsAnimation.fromValue = self.imageLayer.contents;
    contentsAnimation.toValue = (__bridge id)stopImage.CGImage;
    contentsAnimation.duration = 2.f;
    
    //bounds动画
    CABasicAnimation *boundsAnimation = [CABasicAnimation animationWithKeyPath:@"bounds"];
    
    //因为CGRect不是对象 故用以下方式转为对象
    boundsAnimation.fromValue = [NSValue valueWithCGRect:self.imageLayer.bounds];
    boundsAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0,self.view.width, self.view.height)];
    boundsAnimation.duration = 2.f;
    
    //组合动画
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = @[contentsAnimation,boundsAnimation];
    groupAnimation.duration = 2.f;
    
    self.imageLayer.contents = (__bridge id)(stopImage.CGImage);
    self.imageLayer.bounds = CGRectMake(0, 0, self.view.width, self.view.height);
    [self.imageLayer addAnimation:groupAnimation forKey:nil];
}
//懒加载，设置自定义导航条样式
- (JCNavigationBar *)jcBar {
    if (!_jcBar) {
        _jcBar = [[JCNavigationBar alloc]initWithNavigationController:self.navigationController Title:@"播放音乐" Frame:CGRectMake(0, 0, self.view.width,NavagationBarHeight)];
        //是否透明
        _jcBar.transparent = YES;
        
    }
    return _jcBar;
}
- (void)sdWebDownLoadImageWithUrl:(NSString *)urlString {
    __weak typeof(self) weakSelf = self;
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    [manager downloadImageWithURL:[NSURL URLWithString:urlString] options:SDWebImageCacheMemoryOnly progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        _stopImage = image;
        //记录当前图片
        MusicPlayerManager *manager = [MusicPlayerManager shareInstance];
        if (manager.bgImage != image) {
           manager.bgImage = image;
        }
        [weakSelf performSelector:@selector(layerAnimation)
                   withObject:nil
                   afterDelay:1.5f];
        
    }];
}

@end
