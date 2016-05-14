//
//  MusicPlayerManager.h
//  JCMusicPlayer
//
//  Created by TsoiKaShing on 16/5/14.
//  Copyright © 2016年 Tsoi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MusicPlayerManager : NSObject
/**
 *  player的背景图
 */
@property (strong,nonatomic) UIImage *bgImage;
#pragma mark - attribute
/**
 *  单例创建
 *
 *  @return 单例模型
 */
+ (instancetype)shareInstance;

@end
