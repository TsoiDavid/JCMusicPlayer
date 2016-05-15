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
#import "JCMusicPlayerCoverView.h"
#import "JCMusicPlayerOperationView.h"
#import <SDWebImage/UIImageView+WebCache.h>

//导航栏高度
static const CGFloat NavagationBarHeight = 64;
//封面宽度占页面宽度百分比
static const CGFloat coverImageWidthOccupyViewWidthPercent = 0.8;
//封面Y轴占屏幕高度百分比
static const CGFloat coverViewTopMarginOccupyViewHeightPercent = 0.2;
//操作栏高度
static const CGFloat operationViewHeight = 80;

@interface MusicPlayerViewController ()

@property (strong,nonatomic) JCNavigationBar *jcBar;
@property (strong,nonatomic) JCMusicPlayerCoverView *coverView;
@property (strong,nonatomic) JCMusicPlayerOperationView *operaiontView;
@property (strong,nonatomic) UIToolbar *toolBar;
@property (strong,nonatomic) CALayer *imageLayer;
@property (strong,nonatomic) UIImage *stopImage;
@property (strong,nonatomic) UIView *needleView;
@property (strong,nonatomic) UIImageView *needleImageView;

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

    //背景layer
    self.imageLayer = [CALayer layer];
    _imageLayer.frame = self.view.frame;
    [self.view.layer addSublayer:_imageLayer];
    
    //模糊化
    _toolBar = [[UIToolbar alloc] initWithFrame:self.view.frame];
    _toolBar.barStyle = UIBarStyleBlackTranslucent;
    [self.view addSubview:_toolBar];
    
   UIImage *bgimage = [self getDataFromMusicManager];;
    
    if (!bgimage) {
        bgimage = [UIImage imageNamed:@"musicplayer_bgImage_default.jpg"];
    }
    self.imageLayer.contents = (__bridge id)bgimage.CGImage;
    
    //封面设置
    CGFloat coverViewY = self.view.height * coverViewTopMarginOccupyViewHeightPercent;
    CGFloat coverViewWH = self.view.width * coverImageWidthOccupyViewWidthPercent;
    CGFloat coverViewX = (self.view.width - coverViewWH)/2;
    _coverView = [JCMusicPlayerCoverView instanceView];
    _coverView.frame = CGRectMake(coverViewX, coverViewY, coverViewWH, coverViewWH);
    _coverView.rotation = YES;
//    CGPoint coverPoint =  _coverView.center;
//    coverPoint.x = self.view.center.x;
//    coverPoint.y = self.view.center.y - NavagationBarHeight;
//    _coverView.center = coverPoint;
    [_toolBar addSubview:_coverView];

    //播放杆图片
    CGFloat needleViewW = self.view.width * 0.3;
    CGFloat needleViewH = self.view.height * 0.3;
    _needleView = [[UIView alloc]initWithFrame:CGRectMake(0, self.jcBar.height, needleViewW, needleViewH)];
    _needleView.clipsToBounds = YES;
    _needleView.backgroundColor = [UIColor clearColor];
    CGPoint point = _needleView.center;
    point.x = self.view.center.x + 30;
    _needleView.center = point;
    [_toolBar addSubview:_needleView];
    
    _needleImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, -40, _needleView.width, _needleView.height)];
    _needleImageView.image = [UIImage imageNamed:@"cm2_play_needle_play"];
    _needleImageView.contentMode = UIViewContentModeScaleAspectFit;
    _needleImageView.backgroundColor = [UIColor clearColor];
    [_needleView addSubview:_needleImageView];
    
    //操作界面
    _operaiontView = [JCMusicPlayerOperationView instanceView];
    _operaiontView.frame = CGRectMake(0, self.view.height - _operaiontView.height, self.view.width, operationViewHeight);
    _operaiontView.backgroundColor = [UIColor clearColor];
    [_toolBar addSubview:_operaiontView];
    [_operaiontView clickOperationPlayMusicButton:^{
       
    }];
    //获取当前音乐图片
    [self sdWebDownLoadImageWithUrl:_musicModel.pic];
    
    
}

//CALayer实现 淡入浅出动画
- (void)layerAnimation {
    
    UIImage *stopImage = _stopImage;
    
    //contents动画
    CABasicAnimation *contentsAnimation = [CABasicAnimation animationWithKeyPath:@"contents"];
    contentsAnimation.fromValue = self.imageLayer.contents;
    contentsAnimation.toValue = (__bridge id)stopImage.CGImage;
    contentsAnimation.duration = 0.5f;
    
    //bounds动画
    CABasicAnimation *boundsAnimation = [CABasicAnimation animationWithKeyPath:@"bounds"];
    
    //因为CGRect不是对象 故用以下方式转为对象
    boundsAnimation.fromValue = [NSValue valueWithCGRect:self.imageLayer.bounds];
    boundsAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0,self.view.width, self.view.height)];
    boundsAnimation.duration = 0.5f;
    
    //组合动画
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = @[contentsAnimation,boundsAnimation];
    groupAnimation.duration = 0.5f;
    
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
        //装入当前需要显示的图片
        weakSelf.stopImage = image;
        
        //显示到封面
        weakSelf.coverView.image = image;
        
        //记录当前图片
        MusicPlayerManager *manager = [MusicPlayerManager shareInstance];
        if (manager.bgImage != image) {
           manager.bgImage = image;
        }
        //动画切换图片
        [weakSelf performSelector:@selector(layerAnimation)
                   withObject:nil
                   afterDelay:0.5f];
        
    }];
}

@end
