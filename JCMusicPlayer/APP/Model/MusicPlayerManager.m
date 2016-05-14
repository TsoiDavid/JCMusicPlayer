//
//  MusicPlayerManager.m
//  JCMusicPlayer
//
//  Created by TsoiKaShing on 16/5/14.
//  Copyright © 2016年 Tsoi. All rights reserved.
//

#import "MusicPlayerManager.h"

@implementation MusicPlayerManager

+ (MusicPlayerManager *)shareInstance {
    
    static MusicPlayerManager *manager = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        manager = [[MusicPlayerManager alloc] init];
    });
    
    return manager;
}
@end
