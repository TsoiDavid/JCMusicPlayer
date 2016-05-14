//
//  MusicPlayerViewController.h
//  JCMusicPlayer
//
//  Created by admin on 16/5/6.
//  Copyright © 2016年 Tsoi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MusicListItem;

@interface MusicPlayerViewController : UIViewController
/**
 *  控制器显示的图片
 */
@property (strong,nonatomic) UIImageView *bgImageView;

@property (strong, nonatomic) MusicListItem *musicModel;

@end
