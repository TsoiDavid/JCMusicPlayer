//
//  JCMusicPlayerOperationView.h
//  JCMusicPlayer
//
//  Created by TsoiKaShing on 16/5/14.
//  Copyright © 2016年 Tsoi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JCMusicPlayerOperationView : UIView

/**
 *  构造方法
 *
 *  @return 播放器操作栏view
 */
+(JCMusicPlayerOperationView *)instanceView;

/**
 *  点击操作页面按钮
 *
 *  @param playMusicBlock 播放block
 */
- (void)clickOperationPlayMusicButton:(void(^)())playMusicBlock;

@end
