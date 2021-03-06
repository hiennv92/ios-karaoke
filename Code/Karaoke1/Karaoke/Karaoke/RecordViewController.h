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
#include "lame.h"

@interface RecordViewController : UIViewController<AVAudioPlayerDelegate,AVAudioRecorderDelegate,AVAudioSessionDelegate, UIAlertViewDelegate,UITextFieldDelegate,MPMediaPlayback,MPMediaPickerControllerDelegate>{
    AVAudioRecorder *recorder;
    AVAudioPlayer *player;
    
    NSURL *outputFileCafURL;
    NSURL *outputFileMp3URL;
    
    NSURL *mixFileURL;
    MPMoviePlayerController *moviePlayer;
}
@property (nonatomic, retain) UIAlertView *alert;
@property (nonatomic, retain) NSDate *startDate;
@property (nonatomic, assign) BOOL isPlay;
@property (nonatomic, assign) BOOL isRecording;
@property (nonatomic, assign) BOOL isMp4Play;
@property (strong, nonatomic) IBOutlet UIButton *_buttonPlay;
@property (strong, nonatomic) IBOutlet UIButton *_buttonRecord;
@property (strong, nonatomic) IBOutlet UILabel *_recordStatusLabel;


- (IBAction)recordController:(id)sender;
- (IBAction)playController:(id)sender;
- (IBAction)sameSongController:(id)sender;
- (IBAction)likeController:(id)sender;
- (IBAction)backController:(id)sender;

@end
