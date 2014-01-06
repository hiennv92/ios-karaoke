//
//  PlayMusicViewController.h
//  Karaoke
//
//  Created by datkq on 1/6/14.
//  Copyright (c) 2014 banana. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AVFoundation/AVFoundation.h>
#import <QuartzCore/QuartzCore.h>
#import "NavibarViewController.h"

@interface PlayMusicViewController : NavibarViewController<AVAudioPlayerDelegate>{
    AVAudioPlayer *player;
    NSTimer *updateTimer;
    BOOL isPause;
}
@property (weak, nonatomic) IBOutlet UIImageView *imgIntro;
@property (weak, nonatomic) IBOutlet UILabel *albumNameLb;
@property (weak, nonatomic) IBOutlet UILabel *authorLb;
@property (weak, nonatomic) IBOutlet UIButton *playBtn;
@property (weak, nonatomic) IBOutlet UISlider *progressSlider;
@property (weak, nonatomic) IBOutlet UILabel *current;
@property (weak, nonatomic) IBOutlet UILabel *duration;
- (IBAction)next:(id)sender;
- (IBAction)play:(id)sender;
- (IBAction)prev:(id)sender;
- (IBAction)repeat:(id)sender;
- (IBAction)shuffer:(id)sender;
- (IBAction)like:(id)sender;
- (IBAction)progressSliderMoved:(UISlider *)sender;
@end
