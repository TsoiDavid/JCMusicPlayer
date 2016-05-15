//
//  JCMusicPlayerOperationView.m
//  JCMusicPlayer
//
//  Created by TsoiKaShing on 16/5/14.
//  Copyright © 2016年 Tsoi. All rights reserved.
//

#import "JCMusicPlayerOperationView.h"

@interface JCMusicPlayerOperationView ()
/**
 *  播放按钮Block
 */
@property (copy,nonatomic) void (^playMusicBlcok)();

@end

@implementation JCMusicPlayerOperationView

+(JCMusicPlayerOperationView *)instanceView {
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"JCMusicPlayerOperationView" owner:nil options:nil];
    
    return [nibView objectAtIndex:0];
    
}

- (void)setPlayMusicBlcok:(void (^)())playMusicBlcok {
    _playMusicBlcok = playMusicBlcok;
}
- (void)clickOperationPlayMusicButton:(void(^)())playMusicBlock {
    _playMusicBlcok = playMusicBlock;
}
- (IBAction)buttonsOperation:(UIButton *)sender {
    switch (sender.tag) {
        case 1://播放
            _playMusicBlcok();
            break;
        default:
            break;
    }
    
}

@end
