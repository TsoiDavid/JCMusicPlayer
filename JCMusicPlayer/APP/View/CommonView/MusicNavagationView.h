//
//  MusicNavagationView.h
//  JCMusicPlayer
//
//  Created by TsoiKaShing on 16/5/8.
//  Copyright © 2016年 Tsoi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MusicNavagationView : UIView
/**
 *  背景颜色
 */
@property (strong,nonatomic) UIColor *backcroundColor;
/**
 *  左边返回按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *backButton;
/**
 *  右边按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
/**
 *  中间头部title
 */
@property (strong,nonatomic) NSString *titleString;
@property (strong,nonatomic) UIView *titleView;
@property (copy,nonatomic) void (^backBlock)();
@property (copy,nonatomic) void (^rightButtonBlcok)();

+ (MusicNavagationView *)instanceView;
- (void)back:(void(^)())backBlock RightButtonBlcok:(void(^)())rightButtonBlcok;
@end
