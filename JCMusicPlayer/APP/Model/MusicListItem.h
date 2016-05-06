//
//  MusicListItem.h
//  JCMusicPlayer
//
//  Created by admin on 16/5/5.
//  Copyright © 2016年 Tsoi. All rights reserved.
//

typedef enum {
 
    MusicPlaying = 0,//播放中
    MusicPluse,
    MusicNone
    
}JCMusicPlayState;//音乐播放状态



#import <Foundation/Foundation.h>

typedef void(^RequestMusicListBlock)(NSArray *musicListArray);

@interface MusicListItem : NSObject

/**
 *  歌曲名字
 */
@property (strong, nonatomic) NSString *musicName;
/**
 *  歌曲描述
 */
@property (strong, nonatomic) NSString *musicInfo;
/**
 *  歌曲位置
 */
@property (assign, nonatomic) NSInteger musicListNumber;
/**
 *  播放状态
 */
@property (assign, nonatomic) JCMusicPlayState state;

/**
 *  请求音乐列表数据Block
 */
@property (copy, nonatomic) RequestMusicListBlock musicListBlock;

+(void)requestMusicListWithBlick:(RequestMusicListBlock)musicListBlock;


@end
