//
//  MusicListItem.h
//  JCMusicPlayer
//
//  Created by admin on 16/5/5.
//  Copyright © 2016年 Tsoi. All rights reserved.
//

typedef enum {
 
    MusicPlaying = 0,//播放中
    MusicPluse,//暂停
    MusicDefult//Defult
    
}JCMusicPlayState;//音乐播放状态



#import <Foundation/Foundation.h>

typedef void(^RequestMusicListBlock)(NSArray *musicListArray);

@interface MusicListItem : NSObject
//----------------基本属性------------//
/**
 *  歌曲Id
 */
@property (strong, nonatomic) NSString *Id;
/**
 *  歌曲名字
 */
@property (strong, nonatomic) NSString *title;

/**
 *  艺术家名字
 */
@property (strong, nonatomic) NSString *artist;
/**
 *  封面图片
 */
@property (strong, nonatomic) NSString *pic;
/**
 *  歌曲描述
 */
@property (strong, nonatomic) NSString *musicInfo;
/**
 *  歌曲网络url
 */
@property (strong, nonatomic) NSString *music_url;

//----------------额外属性------------//
/**
 *  歌曲位置
 */
@property (assign, nonatomic) NSInteger musicListNumber;
/**
 *  歌曲本地路径url
 */
@property (strong, nonatomic) NSURL *musicUrl;
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
