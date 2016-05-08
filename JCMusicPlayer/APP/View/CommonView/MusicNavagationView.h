//
//  MusicNavagationView.h
//  JCMusicPlayer
//
//  Created by TsoiKaShing on 16/5/8.
//  Copyright © 2016年 Tsoi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MusicNavagationView : UIView

@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@property (strong,nonatomic) NSString *titleString;
@property (strong,nonatomic) UIView *titleView;

+ (MusicNavagationView *)instanceView;

@end
