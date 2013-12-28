//
//  PlayMP3ViewController.m
//  Karaoke
//
//  Created by papo on 12/26/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import "PlayMP3ViewController.h"
#import "LyricView.h"

@interface PlayMP3ViewController ()
{
    NSTimer* _timer;
    int         _currentIndex;
    int         _currentWord;
    LyricView*   _lyricView;
}

@end

@implementation PlayMP3ViewController

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
    _lyricView = [[LyricView alloc] initWithFrame:CGRectMake(50, 200, 220, 100)];
    [self.view addSubview:_lyricView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)playSound:(NSString*)sound
{
    if (_player) {
        [_player stop];
        _player = nil;
    }
    NSString* file = [[NSBundle mainBundle] pathForResource:sound ofType:@"mp3"];
    NSURL* url = [NSURL fileURLWithPath:file];
    _player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [_player setDelegate:self];
    [_player play];
    
    // start timer
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(timerDelay) userInfo:nil repeats:YES];
    [_lyricView setLyricFile:@"10_nam_tinh_cu"];
}

- (void)timerDelay
{
//    NSLog(@"audio time: %f", _player.currentTime);
    [_lyricView step:_player.currentTime];
}

- (IBAction)backButtonClicked:(id)sender {
    if (_player && [_player isPlaying]) {
        [_player stop];
    }
    if (_timer) {
        [_timer invalidate];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)playPauseButtonClicked:(id)sender {
    if (!_player || ![_player isPlaying]) {
        [self playSound:@"10_nam_tinh_cu"];
        [sender setBackgroundImage:[UIImage imageNamed:@"pause.png"] forState:UIControlStateNormal];
    }
    else if ([_player isPlaying])
    {
        [_player stop];
        [sender setBackgroundImage:[UIImage imageNamed:@"play.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)sampleButtonClicked:(id)sender {
}

- (IBAction)likeButtonClicked:(id)sender {
}

#pragma mark - AVAudio Player Delegate
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    NSLog(@"audio player finish with flag: %d", flag);
    [_timer invalidate];
//    [sender setBackgroundImage:[UIImage imageNamed:@"play.png"] forState:UIControlStateNormal];
}
@end
