//
//  JCMusicPlayerCoverView.m
//  JCMusicPlayer
//
//  Created by TsoiKaShing on 16/5/14.
//  Copyright © 2016年 Tsoi. All rights reserved.
//

#import "JCMusicPlayerCoverView.h"

@interface JCMusicPlayerCoverView()
{
    BOOL animating;
}
//封面底部ImageView
@property (weak, nonatomic) IBOutlet UIImageView *coverBgImageView;
//封面ImageView
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;


@end

@implementation JCMusicPlayerCoverView

+(JCMusicPlayerCoverView *)instanceView {
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"JCMusicPlayerCoverView" owner:nil options:nil];
    
    return [nibView objectAtIndex:0];
    
}

- (void)setRotation:(BOOL)rotation {
    _rotation = rotation;
    if (_rotation) {
//       NSTimer *time = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(rotateTransformAnimation) userInfo:nil repeats:YES];
//        [time invalidate];
        animating = YES;
        [self spinWithOptions: UIViewAnimationOptionCurveEaseIn];
    }else {
        animating = NO;
    }
}
- (void)setImage:(UIImage *)image {
    _image = image;
    _coverImageView.image = _image;
}
- (void)setImageName:(NSString *)imageName {
    _imageName = imageName;
    _coverImageView.image = [UIImage imageNamed:_imageName];
}
- (void)awakeFromNib {
    _coverImageView.backgroundColor = [UIColor blackColor];
    _coverImageView.layer.cornerRadius = _coverImageView.width/4;
    _coverImageView.clipsToBounds = YES;
     self.rotation = NO;
}

//旋转动画
- (void)spinWithOptions: (UIViewAnimationOptions) options {
    // this spin completes 360 degrees every 2 seconds
    [UIView animateWithDuration: 10.f
                          delay: 0.2f
                        options: options
                     animations: ^{
                         self.transform = CGAffineTransformRotate(self.transform, M_PI / 2);
                     }
                     completion: ^(BOOL finished) {
                         if (finished) {
                             if (animating) {
                                 // if flag still set, keep spinning with constant speed
                                 [self spinWithOptions: UIViewAnimationOptionCurveLinear];
                             } else if (options != UIViewAnimationOptionCurveEaseOut) {
                                 // one last spin, with deceleration
                                 [self spinWithOptions: UIViewAnimationOptionCurveEaseOut];
                             }
                         }
                     }];
}


@end
