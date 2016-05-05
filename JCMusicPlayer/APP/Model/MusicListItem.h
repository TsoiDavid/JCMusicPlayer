//
//  MusicListItem.h
//  JCMusicPlayer
//
//  Created by admin on 16/5/5.
//  Copyright © 2016年 Tsoi. All rights reserved.
//

typedef enum {
 
    MusicPlaying = 0,
    MusicPluse,
    MusicNone
    
}JCMusicPlayState;//音乐播放状态

#import <Foundation/Foundation.h>

@interface MusicListItem : NSObject
/**
 *  歌曲名字
 */
@property (strong, nonatomic) NSString *name;
/**
 *  歌曲描述
 */
@property (strong, nonatomic) NSString *describe;
/**
 *  播放状态
 */
@property (assign, nonatomic) JCMusicPlayState state;



@end
