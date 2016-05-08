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
#import <GPUImage/GPUImage.h>
#import "FXBlurView.h"

@interface MusicPlayerViewController ()

//@property (strong,nonatomic) FXBlurView *blurView;
//@property (strong,nonatomic) UIImageView *bgImageView;
//@property (weak, nonatomic) IBOutlet FXBlurView *blurView;
@property (strong, nonatomic) UIImage *bgImage;

@end

@implementation MusicPlayerViewController
- (void)viewWillAppear:(BOOL)animated {
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = YES;
    [self setUI];
}
- (void)setUI {
    //导航头
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
    
    UIView *navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 49)];
    navView.backgroundColor = [UIColor redColor];
    [self.view addSubview:navView];

    //获取图片
    [self sdWebDownLoadImageWithUrl:_musicModel.pic];
    
  
    
    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        // 耗时的操作
//        [self sdWebDownLoadImageWithUrl:_musicModel.pic];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            // 更新界面
//            if (!_bgImage) {
//                _bgImage = [UIImage imageNamed:@"bgImage"];
//            }
//        });
//    });
    
    
}
//- (void)refreshBgView {
//    //获取主线程
//    dispatch_queue_t mainQueue = dispatch_get_main_queue();
//    //更新UI界面,此处调用了GCD主线程队列的方法
//    //UI改变一般调用同步方式
//    dispatch_sync(mainQueue, ^{
//        NSLog(@"调用主线程改变UI");
//        self.bgImageView.image = _bgImage;
//    });
//}
//- (void)blurViewFilter {
//    /*
//     并发队列同样是使用dispatch_queue_create()方法创建，只是最后一个参数指定为DISPATCH_QUEUE_CONCURRENT进行创建，但是在实际开发中我们通常不会重新创建一个并发队列而是使用dispatch_get_global_queue()方法取得一个全局的并发队列
//     */
//    /*取得全局队列
//     第一个参数：线程优先级
//     第二个参数：标记参数，目前没有用，一般传入0
//     */
//    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    //异步执行队列任务
//    //参数1.创建的并发队列多线程的名称
//    dispatch_async(globalQueue, ^{
//        //模糊背景
//        GPUImageGaussianBlurFilter * blurFilter = [[GPUImageGaussianBlurFilter alloc] init];
//        blurFilter.blurRadiusInPixels = 20.0;
//        UIImage *blurredImage = [blurFilter imageByFilteringImage:_bgImage];
//        _bgImage = blurredImage;
//        [self refreshBgView];
//    });
//    
//    
//}

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
