//
//  MusicPlayerViewController.h
//  JCMusicPlayer
//
//  Created by admin on 16/5/6.
//  Copyright © 2016年 Tsoi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MusicListItem;

@interface MusicPlayerViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (strong, nonatomic) MusicListItem *musicModel;
@end
