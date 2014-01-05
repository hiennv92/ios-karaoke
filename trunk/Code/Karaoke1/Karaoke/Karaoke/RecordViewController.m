//
//  RecordViewController.m
//  Karaoke
//
//  Created by Trinh Van Duong on 12/27/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import "RecordViewController.h"
#import "Lib.h"
#import "PCMMixer.h"
#import "BJIConverter.h"
#import "LyricView.h"
#import "SoundMix.h"

@interface RecordViewController ()
{
    NSTimer*    _timer;
    LyricView*  _lyricView;
    NSString*   _mp3LastUrl;
}

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
    [self._buttonPlay setEnabled:FALSE];
    
    //Setup audio record
    // Set the audio file
    NSArray *pathComponents = [NSArray arrayWithObjects:
                               [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject],
                               @"MyAudioMemo.caf",
                               nil];
    outputFileCafURL = [NSURL fileURLWithPathComponents:pathComponents];
//    NSLog(@"url record: %@", outputFileCafURL);
    
    // Setup audio session
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:NULL];
    
//    UInt32 audioRouteOverride = kAudioSessionOverrideAudioRoute_Speaker;
    UInt32 audioRouteOverride = kAudioSessionOverrideAudioRoute_None;
    AudioSessionSetProperty (kAudioSessionProperty_OverrideAudioRoute,sizeof (audioRouteOverride),&audioRouteOverride);
    
    // Define the recorder setting
    NSMutableDictionary *recordSetting = [[NSMutableDictionary alloc] init];
    
    [recordSetting setValue:[NSNumber numberWithInt:kAudioFormatLinearPCM] forKey:AVFormatIDKey];
    [recordSetting setValue:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey];
    [recordSetting setValue:[NSNumber numberWithInt: 2] forKey:AVNumberOfChannelsKey];
    
    // Initiate and prepare the recorder
    recorder = [[AVAudioRecorder alloc] initWithURL:outputFileCafURL settings:recordSetting error:nil];
    recorder.delegate = self;
    recorder.meteringEnabled = YES;
    [recorder prepareToRecord];
    [self setIsPlay:NO];
    
    //
    _lyricView = [[LyricView alloc] initWithFrame:CGRectMake(10, 150, 300, 300)];
    [self.view addSubview:_lyricView];
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

            // disable auto lock screen
            [[UIApplication sharedApplication] setIdleTimerDisabled:YES];
            
            AVAudioSession *session = [AVAudioSession sharedInstance];
            [session setActive:YES error:nil];
            
            // Start recording
            [recorder record];
            [self._buttonRecord setImage:[UIImage imageNamed:@"dang-ghi-am.png"] forState:UIControlStateNormal];
            self._recordStatusLabel.text = @"Đang ghi âm";
            [self._buttonPlay setEnabled:NO];
            
            
            NSString *destinationString = [[NSBundle mainBundle] pathForResource:@"10_nam_tinh_cu" ofType:@"mp3"];
            
            mixFileURL = [NSURL fileURLWithPath:destinationString];
            
            player = [[AVAudioPlayer alloc] initWithContentsOfURL:mixFileURL error:nil];
            [player setDelegate:self];
            [player prepareToPlay];
            [self setIsPlay:YES];
            
            [self._buttonRecord setImage:[UIImage imageNamed:@"dang-ghi-am.png"] forState:UIControlStateNormal];
            self._recordStatusLabel.text = @"Đang ghi âm";
            
            [_lyricView setLyricFile:@"10_nam_tinh_cu"];
            [player play];
            
            _timer = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(step) userInfo:nil repeats:YES];
        }
    } else {
        [_lyricView clearAllText];
        [player stop];
      
        //Stop record
        [recorder stop];
        AVAudioSession *audioSession = [AVAudioSession sharedInstance];
        [audioSession setActive:NO error:nil];
        
        [self._buttonRecord setImage:[UIImage imageNamed:@"ghi-am.png"] forState:UIControlStateNormal];
        self._recordStatusLabel.text = @"Ghi âm";
        [self._buttonPlay setEnabled:YES];
        
        if (_timer) {
            [_timer invalidate];
            _timer = nil;
        }
    }
}

- (IBAction)playController:(id)sender {
    if(!player.isPlaying){
        [self._buttonPlay setImage:[UIImage imageNamed:@"pause.png"] forState:UIControlStateNormal];
        
		AVAudioPlayer *avAudioObj = [[AVAudioPlayer alloc] initWithContentsOfURL:outputFileCafURL error:nil];
        player = avAudioObj;
        [player setDelegate:self];
        
		[avAudioObj prepareToPlay];
		[avAudioObj play];
    }
    else{
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
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
    if ([recorder isRecording]) {
        [recorder stop];
        return;
    }
    [[UIApplication sharedApplication]setIdleTimerDisabled:NO];
    [self.navigationController popViewControllerAnimated:YES];
}


// timer
- (void)step
{
    [_lyricView step:player.currentTime];
}

#pragma mark - AVAudioRecorderDelegate

- (void) audioRecorderDidFinishRecording:(AVAudioRecorder *)avrecorder successfully:(BOOL)flag{
    [self._buttonRecord setImage:[UIImage imageNamed:@"ghi-am.png"] forState:UIControlStateNormal];
    self._recordStatusLabel.text = @"Ghi âm";
    [self._buttonPlay setEnabled:YES];

    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    _alert = [[UIAlertView alloc] init];
    [_alert setTitle:@"Chờ chút xíu..."];
    
    UIActivityIndicatorView* activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activity.frame = CGRectMake(140,
                                80,
                                CGRectGetWidth(_alert.frame),
                                CGRectGetHeight(_alert.frame));
    [_alert addSubview:activity];
    [activity startAnimating];
    
    [_alert show];
    
    if ([Lib isHeadsetPluggedIn])
    {
        NSLog(@"Mix file");
        [NSThread detachNewThreadSelector:@selector(mixWithFileBeat) toTarget:self withObject:nil];
    }
    else
    {
        [NSThread detachNewThreadSelector:@selector(convertM4aToMp3) toTarget:self withObject:nil];
    }
}

#pragma mark - AVAudioPlayerDelegate

- (void) audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    [self._buttonPlay setImage:[UIImage imageNamed:@"play.png"] forState:UIControlStateNormal];
    [self._buttonRecord setEnabled:YES];
    [self setIsPlay:NO];
    
    [[UIApplication sharedApplication]setIdleTimerDisabled:NO];
}


- (void)convertM4aToMp3
{
    _startDate = [NSDate date] ;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    //    NSFileManager *fm = [NSFileManager defaultManager];
    //    NSArray *dirContents = [fm contentsOfDirectoryAtPath:bundleRoot error:nil];
    //    NSPredicate *fltr = [NSPredicate predicateWithFormat:@"self ENDSWITH '.mp3'"];
        //  Convert mp3's to their full paths

    
    NSString *recordOutput=[docPath stringByAppendingPathComponent:@"MyAudioMemo.caf"];
//    NSString* cafOutPut = [recordOutput stringByAppendingString:@".caf"];
    
//    [BJIConverter convertFile:recordOutput toFile:cafOutPut];

    [self toMp3:recordOutput];
}

////Dat mixs file/////
#pragma mark - Dat Mix audio

- (void)mixWithFileBeat{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    NSString *bundleRoot = [[NSBundle mainBundle] bundlePath];
    _startDate = [NSDate date] ;
    NSLog(@"mix file beat");
    //URL file record dat trong bien: recordURL;
    NSArray *mp3s = [self getMP3s];
    NSArray *cafs = [self getCAFs:mp3s];
    
    NSString* mp3file = [bundleRoot stringByAppendingPathComponent:@"10_nam_tinh_cu.mp3"];
    NSString* cafFile = [docPath stringByAppendingPathComponent:@"10_nam_tinh_cu.caf"];
    NSString* recordCaf = [docPath stringByAppendingPathComponent:@"MyAudioMemo.caf"];
    //  Convert all mp3's to cafs
//    [BJIConverter convertFiles:mp3s toFiles:cafs];
    [BJIConverter convertFile:mp3file toFile:cafFile];
    
    // Trim sound file
    double recordTime = [SoundMix getSoundLength:recordCaf];
    double beatTime = [SoundMix getSoundLength:cafFile];
    NSLog(@"record time: %lf beat time: %lf ", recordTime, beatTime);
    
//    if (recordTime < beatTime) {
//        [SoundMix trimSoundFile:cafFile withTime:recordTime];
//        cafFile = [docPath stringByAppendingPathComponent:@"trim.caf"];
//    }
    
//    NSArray *files = cafs;
    NSArray* files = @[cafFile, recordCaf];
    NSArray *times = [self getTimes];
    NSString *mixURL = [self getMixURL];
    
	OSStatus status = [PCMMixer mixFiles:files atTimes:times toMixfile:mixURL];
    
    if (status == OSSTATUS_MIX_WOULD_CLIP) {
		NSLog(@"Loi mix file cua Dat");
	} else {
		NSLog(@"mix thanh cong. url file : %@",mixURL);
	}
    NSLog(@"status: %d",(int)status);
//    [self playMix:mixURL withStatus:status];
//    [BJIConverter convertFile:mixURL toFile:[mixURL stringByReplacingOccurrencesOfString:@".caf" withString:@".aiff"]];
    
    
    _startDate = [NSDate date] ;
//    [NSThread detachNewThreadSelector:@selector(toMp3:) toTarget:self withObject:mixURL ];
    [self toMp3:mixURL];
    
    
//    [self toMp3:mixURL];
    NSLog(@"converted url: %@",mixURL);
    
    
}

- (void)playMix:(NSString*)mixURL withStatus:(OSStatus)status {
    if (status == OSSTATUS_MIX_WOULD_CLIP) {
		
	} else {
		
        
		NSURL *url = [NSURL fileURLWithPath:mixURL];
        
		NSData *urlData = [NSData dataWithContentsOfURL:url];
        
		NSLog(@"wrote mix file of size %d : %@", [urlData length], mixURL);
        
		AVAudioPlayer *avAudioObj = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        
        player = avAudioObj;
        [player setDelegate:self];
        
		[avAudioObj prepareToPlay];
		[avAudioObj play];
	}
}

- (NSArray*)getMP3s {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    NSString *bundleRoot = [[NSBundle mainBundle] bundlePath];
//    NSFileManager *fm = [NSFileManager defaultManager];
//    NSArray *dirContents = [fm contentsOfDirectoryAtPath:bundleRoot error:nil];
//    NSPredicate *fltr = [NSPredicate predicateWithFormat:@"self ENDSWITH '.mp3'"];
    NSArray *mp3s = [[NSArray alloc] initWithObjects:@"10_nam_tinh_cu.mp3" ,nil];
    NSLog(@"getMP3 after find all: %@",mp3s);
    //  Convert mp3's to their full paths
    NSMutableArray *fullmp3s = [[NSMutableArray alloc] initWithCapacity:[mp3s count]];
    [mp3s enumerateObjectsUsingBlock:^(NSString *file, NSUInteger idx, BOOL *stop) {
        [fullmp3s addObject:[bundleRoot stringByAppendingPathComponent:file]];
    }];
    
    NSString *recordOutput=[docPath stringByAppendingPathComponent:@"MyAudioMemo.m4a"];
    [fullmp3s addObject: recordOutput];
    NSLog(@"getMP3s return:%@",fullmp3s);
    return fullmp3s;
}

- (NSArray*)getCAFs:(NSArray*)mp3s {
    //  Find 'Documents' directory
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    
    //  Create AIFFs from mp3's
    NSMutableArray *cafs = [[NSMutableArray alloc] initWithCapacity:[mp3s count]];
    [mp3s enumerateObjectsUsingBlock:^(NSString *file, NSUInteger idx, BOOL *stop) {
        if ([[[file lastPathComponent] substringFromIndex:[[file lastPathComponent] length]-4] isEqualToString:@".mp3"]) {
            [cafs addObject:[docPath stringByAppendingPathComponent:[[file lastPathComponent] stringByReplacingOccurrencesOfString:@".mp3" withString:@".caf"]]];
        }
        if ([[[file lastPathComponent] substringFromIndex:[[file lastPathComponent] length]-4] isEqualToString:@".m4a"]) {
        [cafs addObject:[docPath stringByAppendingPathComponent:[[file lastPathComponent] stringByReplacingOccurrencesOfString:@".m4a" withString:@".caf"]]];
        }
    }];
    NSLog(@"getCAFs return: %@",cafs);
    return cafs;
}

- (NSArray *)getTimes {
    //  First item must be at time 0. All other sounds must be relative to this first sound.
    return [NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:0], nil];
}

- (NSString*)getMixURL {
    NSLog(@"getmixURl");
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSLog( @"GetMixURL return :%@",[[paths objectAtIndex:0] stringByAppendingPathComponent:@"Mix.caf"]);
    return [[paths objectAtIndex:0] stringByAppendingPathComponent:@"Mix.caf"];
}

- (void) toMp3 :(NSString*)cafFilePath
{
//    NSString *cafFilePath =[NSTemporaryDirectory() stringByAppendingString:@"RecordedFile"];
//    
    NSString *mp3FilePath = Nil;
    mp3FilePath = [cafFilePath stringByAppendingString:@".mp3"];
//    NSString *mp3FilePath = [[NSHomeDirectory() stringByAppendingFormat:@"/Documents/"] stringByAppendingPathComponent:mp3FileName];
    NSLog(@"to mp3: %@", mp3FilePath);
    _mp3LastUrl = mp3FilePath;
    @try {
        int read, write;
        
        FILE *pcm = fopen([cafFilePath cStringUsingEncoding:1], "rb");  //source
        fseek(pcm, 4*1024, SEEK_CUR);                                   //skip file header
        FILE *mp3 = fopen([mp3FilePath cStringUsingEncoding:1], "wb");  //output
        
        const int PCM_SIZE = 8192;
        const int MP3_SIZE = 8192;
        short int pcm_buffer[PCM_SIZE*2];
        unsigned char mp3_buffer[MP3_SIZE];
        
        lame_t lame = lame_init();
        lame_set_in_samplerate(lame, 44100);
        lame_set_VBR(lame, vbr_default);
        lame_init_params(lame);
        
        do {
            read = fread(pcm_buffer, 2*sizeof(short int), PCM_SIZE, pcm);
            if (read == 0)
                write = lame_encode_flush(lame, mp3_buffer, MP3_SIZE);
            else
                write = lame_encode_buffer_interleaved(lame, pcm_buffer, read, mp3_buffer, MP3_SIZE);
            
            fwrite(mp3_buffer, write, 1, mp3);
            
        } while (read != 0);
        
        lame_close(lame);
        fclose(mp3);
        fclose(pcm);
    }
    @catch (NSException *exception) {
        NSLog(@"exception: %@",[exception description]);
    }
    @finally {
        [self performSelectorOnMainThread:@selector(convertMp3Finish)
                               withObject:nil
                            waitUntilDone:YES];
    }
}

- (void) convertMp3Finish
{
    [[UIApplication sharedApplication] endIgnoringInteractionEvents];
    [_alert dismissWithClickedButtonIndex:0 animated:YES];
    
    _alert = [[UIAlertView alloc] initWithTitle: @"Chú ý"
                                        message: @"Bạn có muốn lưu lại bản thu âm không?"
                                       delegate: nil
                              cancelButtonTitle:@"Không"
                              otherButtonTitles:@"Có",nil];
    
    [_alert setTag:1];
    [_alert setDelegate:self];
    [_alert show];
}

#pragma mark - UIAlertView delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 123) {
        [self._buttonPlay setImage:[UIImage imageNamed:@"pause.png"] forState:UIControlStateNormal];
        
        NSString* mixURL = _mp3LastUrl;
        NSURL *url = [NSURL fileURLWithPath:mixURL];
        
		NSData *urlData = [NSData dataWithContentsOfURL:url];
        
		NSLog(@"wrote mix file of size %d : %@", [urlData length], mixURL);
        
		AVAudioPlayer *avAudioObj = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        
        player = avAudioObj;
        [player setDelegate:self];
        
		[avAudioObj prepareToPlay];
		[avAudioObj play];
    }
    
    //Ask save file
    if(alertView.tag == 1){
        if(buttonIndex == 1){
            UIAlertView *saveAlert = [[UIAlertView alloc]initWithTitle:@"Lưu bản thu" message:@"Nhập tên file ghi âm bạn muốn lưu" delegate:self cancelButtonTitle:@"Huỷ" otherButtonTitles:@"Lưu", nil];
            saveAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
            [saveAlert textFieldAtIndex:0].delegate = self;
            [saveAlert setTag:2];
            [saveAlert show];
        }
    }
    
    //Save file
    if(alertView.tag == 2){
        if(buttonIndex == 1){
            _mp3LastUrl = [self saveFileMp3:[alertView textFieldAtIndex:0].text];
        }
    }
}


//Save file record after convert and rename to folder /RecordedFiles
-(NSString*)saveFileMp3:(NSString *)fileName{
    // For error information
    NSError *error;
    // Create file manager
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0]; // Get documents folder
    NSString *saveDataPath = [documentsDirectory stringByAppendingPathComponent:@"/RecordedFiles"];
    
    //Create folder if it isn't appear
    if (![[NSFileManager defaultManager] fileExistsAtPath:saveDataPath])
        [[NSFileManager defaultManager] createDirectoryAtPath:saveDataPath withIntermediateDirectories:NO attributes:nil error:&error];
    
    // Rename the file, by moving the file
    saveDataPath = [saveDataPath
                           stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.mp3",fileName]];
    
    // Attempt the move
    if ([fileMgr moveItemAtPath:_mp3LastUrl toPath:saveDataPath error:&error] != YES)
        NSLog(@"Unable to move file: %@", [error localizedDescription]);
    
// Show contents of Documents directory
//    NSLog(@"Documents directory: %@",
//          [fileMgr contentsOfDirectoryAtPath:documentsDirectory error:&error]);
 
    return  saveDataPath;
}

@end


