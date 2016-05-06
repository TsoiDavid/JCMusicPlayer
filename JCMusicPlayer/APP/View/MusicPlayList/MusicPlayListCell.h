//
//  MusicPlayListCell.h
//  JCMusicPlayer
//
//  Created by admin on 16/5/6.
//  Copyright © 2016年 Tsoi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MusicListItem;

@interface MusicPlayListCell : UITableViewCell
/**
 *  歌曲名
 */
@property (weak, nonatomic) IBOutlet UILabel *musicName;
/**
 *  歌曲信息
 */
@property (weak, nonatomic) IBOutlet UILabel *musicInfo;
/**
 *  左侧底部图
 */
@property (weak, nonatomic) IBOutlet UIView *leftView;
/**
 *  左侧指示图(播放中图片)
 */
@property (weak, nonatomic) IBOutlet UIImageView *musicIndicatorView;
/**
 *  左侧歌曲位置数字
 */
@property (weak, nonatomic) IBOutlet UILabel *musicIndicatorNumberLabel;

@property (strong, nonatomic) MusicListItem *musicList;

@end
