//
//  RecordViewController.m
//  Karaoke
//
//  Created by Trinh Van Duong on 12/27/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import "RecordViewController.h"
#import "Lib.h"

@interface RecordViewController ()

@end

@implementation RecordViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setIsPlay:NO];
    [self setIsRecording:NO];
    
    //Setup audio record
    // Set the audio file
    NSArray *pathComponents = [NSArray arrayWithObjects:
                               [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject],
                               @"MyAudioMemo.m4a",
                               nil];
    outputFileURL = [NSURL fileURLWithPathComponents:pathComponents];
    
    // Setup audio session
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:NULL];
    
//    UInt32 audioRouteOverride = kAudioSessionOverrideAudioRoute_Speaker;
  
    UInt32 audioRouteOverride = kAudioSessionOverrideAudioRoute_None;
    AudioSessionSetProperty (kAudioSessionProperty_OverrideAudioRoute,sizeof (audioRouteOverride),&audioRouteOverride);
    
    
    // Define the recorder setting
    NSMutableDictionary *recordSetting = [[NSMutableDictionary alloc] init];
    
    [recordSetting setValue:[NSNumber numberWithInt:kAudioFormatMPEG4AAC] forKey:AVFormatIDKey];
    [recordSetting setValue:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey];
    [recordSetting setValue:[NSNumber numberWithInt: 2] forKey:AVNumberOfChannelsKey];
    
    // Initiate and prepare the recorder
    recorder = [[AVAudioRecorder alloc] initWithURL:outputFileURL settings:recordSetting error:nil];
    recorder.delegate = self;
    recorder.meteringEnabled = YES;
    [recorder prepareToRecord];
    [self setIsPlay:NO];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)recordController:(id)sender {
    if (!recorder.recording){
        if([self isPlay]){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Chú ý"
                                                            message: @"Xin dừng phát bản ghi âm cũ trước khi tiến hành thu bản mới :)!"
                                                            delegate: nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
            [alert show];
        }
        else{
            [Lib isHeadsetPluggedIn];

            AVAudioSession *session = [AVAudioSession sharedInstance];
            [session setActive:YES error:nil];
            
            // Start recording
            [recorder record];
            [self._buttonRecord setImage:[UIImage imageNamed:@"dang-ghi-am.png"] forState:UIControlStateNormal];
            self._recordStatusLabel.text = @"Đang ghi âm";
            [self._buttonPlay setEnabled:NO];
        }
    } else {
        //Stop record
        [recorder stop];
        AVAudioSession *audioSession = [AVAudioSession sharedInstance];
        [audioSession setActive:NO error:nil];
        [self._buttonRecord setImage:[UIImage imageNamed:@"ghi-am.png"] forState:UIControlStateNormal];
        self._recordStatusLabel.text = @"Ghi âm";
        [self._buttonPlay setEnabled:YES];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Chú ý"
                                                        message: @"Bạn có muốn lưu lại bản thu âm không?"
                                                       delegate: nil
                                              cancelButtonTitle:@"Có"
                                              otherButtonTitles:@"Không",nil];
        [alert show];
    }
}

- (IBAction)playController:(id)sender {
    if(!recorder.recording){
        [Lib isHeadsetPluggedIn];

        [self._buttonPlay setImage:[UIImage imageNamed:@"pause.png"] forState:UIControlStateNormal];
 
        NSString *destinationString = [[self documentsPath] stringByAppendingPathComponent:@"MyAudioMemo.m4a"];
        NSURL* url = [NSURL fileURLWithPath:destinationString];
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        [player setDelegate:self];
        [player prepareToPlay];
        [self setIsPlay:YES];
        
//        NSLog(@"URL RECORD: %@",recorder.url);
//        NSLog(@"URL OUPUTFILE: %@",outputFileURL);
        [player play];
    }
    else{
        [player stop];
        [self._buttonPlay setImage:[UIImage imageNamed:@"play.png"] forState:UIControlStateNormal];
        [self setIsPlay:NO];
    }
}


- (NSString*) documentsPath
{
	NSArray *searchPaths =
	NSSearchPathForDirectoriesInDomains
	(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString* _documentsPath = [searchPaths objectAtIndex: 0];	
	return _documentsPath;
}

- (IBAction)sameSongController:(id)sender {

}

- (IBAction)likeController:(id)sender {
    
}

- (IBAction)backController:(id)sender {
    [player stop];
    [recorder stop];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - AVAudioRecorderDelegate

- (void) audioRecorderDidFinishRecording:(AVAudioRecorder *)avrecorder successfully:(BOOL)flag{
    [self._buttonRecord setImage:[UIImage imageNamed:@"ghi-am.png"] forState:UIControlStateNormal];
    self._recordStatusLabel.text = @"Ghi âm";
    [self._buttonPlay setEnabled:YES];

    //Mix file after record with a headphone
    [self mixWithFileBeat];
}

#pragma mark - AVAudioPlayerDelegate

- (void) audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    [self._buttonPlay setImage:[UIImage imageNamed:@"play.png"] forState:UIControlStateNormal];
    [self._buttonRecord setEnabled:YES];
    [self setIsPlay:NO];
}

////Dat mixs file/////
- (void)mixWithFileBeat{
    //URL file record dat trong bien: recordURL;
    
}

@end
