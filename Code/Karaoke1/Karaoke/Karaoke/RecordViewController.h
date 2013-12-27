//
//  RecordViewController.h
//  Karaoke
//
//  Created by Trinh Van Duong on 12/27/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface RecordViewController : UIViewController<AVAudioPlayerDelegate,AVAudioRecorderDelegate,AVAudioSessionDelegate>{
    AVAudioRecorder *recorder;
    AVAudioPlayer *player;
    NSURL *outputFileURL;
    NSURL *mixFileURL;
}

@property (nonatomic, assign) BOOL isPlay;
@property (nonatomic, assign) BOOL isRecording;
@property (strong, nonatomic) IBOutlet UIButton *_buttonPlay;
@property (strong, nonatomic) IBOutlet UIButton *_buttonRecord;
@property (strong, nonatomic) IBOutlet UILabel *_recordStatusLabel;


- (IBAction)recordController:(id)sender;
- (IBAction)playController:(id)sender;
- (IBAction)sameSongController:(id)sender;
- (IBAction)likeController:(id)sender;
- (IBAction)backController:(id)sender;

@end
