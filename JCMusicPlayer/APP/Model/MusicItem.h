//
//  MusicItem.h
//  JCMusicPlayer
//
//  Created by admin on 16/5/5.
//  Copyright © 2016年 Tsoi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MusicItem : NSObject
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *cover;
@property (strong, nonatomic) NSString *singer;
/**
 *  名字描述
 */
@property (strong, nonatomic) NSString *describe;
@end
