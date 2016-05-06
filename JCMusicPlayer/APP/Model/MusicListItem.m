//
//  MusicListItem.m
//  JCMusicPlayer
//
//  Created by admin on 16/5/5.
//  Copyright © 2016年 Tsoi. All rights reserved.
//

#import "MusicListItem.h"
#import <YYModel/YYModel.h>

@implementation MusicListItem
- (instancetype)init {
    if(self = [super init]) {
        //默认配置
        _state = MusicDefult;//默认非播放状态
    }
    return self;
}
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
    //获取本地3个mp3地址
//    NSArray *musicPathArray = [[NSBundle mainBundle]pathsForResourcesOfType:@"mp3" inDirectory:@"Musics"];
    NSMutableArray *musicArray = [[NSMutableArray alloc]init];
    NSDictionary *musicsDict = [self dictionaryWithContentsOfJSONString:@"music_list.json"];
    NSArray *array = [musicsDict objectForKey:@"data"];
    for (int i = 0; i < array.count; i ++) {
//        NSURL *url = [NSURL fileURLWithPath:musicPathArray[i]];
        MusicListItem *list = [MusicListItem yy_modelWithJSON:array[i]];
        list.musicListNumber = i;
        [musicArray addObject:list];
    }

    _musicListBlock(musicArray);
}
//返回一个 Dict，将 Model 属性名对映射到 JSON 的 Key。
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"Id" : @"id",
            };
}

# pragma mark - Load data from server

- (NSDictionary *)dictionaryWithContentsOfJSONString:(NSString *)fileLocation {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:[fileLocation stringByDeletingPathExtension] ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    __autoreleasing NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data
                                                options:kNilOptions error:&error];
    if (error != nil) return nil;
    return result;
}
@end
