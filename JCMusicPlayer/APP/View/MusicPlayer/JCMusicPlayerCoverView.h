//
//  JCMusicPlayerCoverView.h
//  JCMusicPlayer
//
//  Created by TsoiKaShing on 16/5/14.
//  Copyright © 2016年 Tsoi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JCMusicPlayerCoverView : UIView
/**
 *  cover 封面图片
 */
@property (strong,nonatomic) UIImage *image;
/**
 *  cover 封面读取图片的名字
 */
@property (strong,nonatomic) NSString *imageName;
/**
 *  是否自动旋转//默认NO
 */
@property (assign,nonatomic) BOOL rotation;
/**
 *  构造方法
 *
 *  @return MusicPlayer 封面
 */
+(JCMusicPlayerCoverView *)instanceView;

@end
