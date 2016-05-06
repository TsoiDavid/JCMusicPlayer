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

@interface MusicPlayerViewController ()
{
    GPUImageView *_blurView;
    GPUImageiOSBlurFilter *_blurFilter;
}
@property (strong, nonatomic) UIImage *bgImage;
//@property (strong, nonatomic) GPUImageView *bgImageView;
@end

@implementation MusicPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUI];
}
- (void)setUI {
    //导航头
    MusicPlayerHeadView *headView = [MusicPlayerHeadView instanceView];
    headView.title = _musicModel.title;
    headView.artist = _musicModel.artist;
    self.navigationItem.titleView = headView;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 耗时的操作
        [self sdWebDownLoadImageWithUrl:_musicModel.pic];
        dispatch_async(dispatch_get_main_queue(), ^{
            // 更新界面
            if (!_bgImage) {
                _bgImage = [UIImage imageNamed:@"bgImage"];
            }
        });
    });
    
    
}
- (void)blurViewFilter {
    //模糊背景
    GPUImageGaussianBlurFilter * blurFilter = [[GPUImageGaussianBlurFilter alloc] init];
    blurFilter.blurRadiusInPixels = 20.0;
    UIImage *blurredImage = [blurFilter imageByFilteringImage:_bgImage];
    _bgImageView.image = blurredImage;
}

- (void)sdWebDownLoadImageWithUrl:(NSString *)urlString {
    __weak typeof(self) weakSelf = self;
    [self.bgImageView sd_setImageWithURL:[NSURL URLWithString:urlString] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        weakSelf.bgImage = image;
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf blurViewFilter];
        });
    }];
//    SDWebImageManager *manager = [SDWebImageManager sharedManager];
//    [manager downloadImageWithURL:[NSURL URLWithString:_musicModel.pic]
//                          options:0
//                         progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//                             // progression tracking code
//                         }
//                        completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
//                            if (image) {
//                                weakSelf.bgImage = image;
//                                [weakSelf blurViewFilter];
////                                [weakSelf setBackGroundView];
//                                // do something with image
//                            }
//                        }];
}

@end
