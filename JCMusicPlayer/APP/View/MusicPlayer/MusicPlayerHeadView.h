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


+(MusicPlayerHeadView *)instanceView;
@end
