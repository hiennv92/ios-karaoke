//
//  PlayMP3ViewController.h
//  Karaoke
//
//  Created by papo on 12/26/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface PlayMP3ViewController : UIViewController <AVAudioPlayerDelegate>
{
    AVAudioPlayer*      _player;
}


- (IBAction)backButtonClicked:(id)sender;
- (IBAction)playPauseButtonClicked:(id)sender;
- (IBAction)sampleButtonClicked:(id)sender;
- (IBAction)likeButtonClicked:(id)sender;

@end
