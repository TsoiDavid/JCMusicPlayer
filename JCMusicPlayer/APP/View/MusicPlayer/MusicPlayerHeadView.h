//
//  MusicPlayerHeadView.h
//  JCMusicPlayer
//
//  Created by admin on 16/5/6.
//  Copyright © 2016年 Tsoi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MusicPlayerHeadView : UIView
/**
 *  歌名
 */
@property (strong, nonatomic) NSString *title;
/**
 *  艺术家
 */
@property (strong, nonatomic) NSString *artist;
/**
 *  字体颜色
 */
@property (strong,nonatomic) UIColor *titleColor;
/**
 *  字体大小
 */
@property (strong,nonatomic) UIFont *titleFont;
+(MusicPlayerHeadView *)instanceView;
@end
