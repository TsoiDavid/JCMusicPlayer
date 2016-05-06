//
//  MusicListItem.m
//  JCMusicPlayer
//
//  Created by admin on 16/5/5.
//  Copyright © 2016年 Tsoi. All rights reserved.
//

#import "MusicListItem.h"

@implementation MusicListItem
+ (void)requestMusicListWithBlick:(RequestMusicListBlock)musicListBlock {
    MusicListItem *musicList = [[MusicListItem alloc]init];
    [musicList requestMusicListWithBlick:musicListBlock];
}
- (void)requestMusicListWithBlick:(RequestMusicListBlock)musicListBlock {
    _musicListBlock = musicListBlock;
    
    [self requestMusicListFromServer];
}
//从服务端获取数据
- (void)requestMusicListFromServer {
    NSArray *array = [[NSBundle mainBundle]pathsForResourcesOfType:@"mp3" inDirectory:@"Musics"];
    NSMutableArray *urlArray = [[NSMutableArray alloc]init];
    for (int i = 0; i < array.count; i ++) {
        NSURL *url = [NSURL fileURLWithPath:array[i]];
        NSLog(@"mp3 url = %@",url);
        [urlArray addObject:url];
    }
    _musicListBlock(urlArray);
}
@end
