//
//  PlayMusicViewController.m
//  Karaoke
//
//  Created by datkq on 1/6/14.
//  Copyright (c) 2014 banana. All rights reserved.
//

#import "PlayMusicViewController.h"
@interface PlayMusicViewController ()

@end

@implementation PlayMusicViewController

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
    CGPoint p= _anhView.center;
    _anhView.frame=CGRectMake(0, 0, _anhView.bounds.size.height, _anhView.bounds.size.height);
    _anhView.center=p;
    // Do any additional setup after loading the view from its nib.
//    [self createNavigationBarWithTitle:Nil backgroundImage:@"bg-top-home.png" leftButton:@"back-btn.png" leftButtonPress:Nil rightButton:nil rightButtonPress:Nil];
    [self createNavigationBarWithTitle:@"VN DJ NONSTOP" backgroundImage:@"bg-top-home.png" leftButton:@"back-btn.png" leftButtonPress:nil rightButton:nil rightButtonPress:nil andType:1];
    
    [self addTitleNavibar:@"VN DJ NONSTOP" andSize:22];
    [self setBottomBarViewHidden:YES];
    [self setSearchBarViewHidden:YES];
    isPause=NO;
    
    
    _duration.adjustsFontSizeToFitWidth = YES;
	_current.adjustsFontSizeToFitWidth = YES;
	_progressSlider.minimumValue = 0.0;
    
    [_progressSlider setThumbImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"11-knob-nho" ofType:@"png"]]
                         forState:UIControlStateNormal];
    [_progressSlider setMinimumTrackImage:[[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"11-progress" ofType:@"png"]] stretchableImageWithLeftCapWidth:5 topCapHeight:3]
                                forState:UIControlStateNormal];
    [_progressSlider setMaximumTrackImage:[[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"11-bg-thanh-play" ofType:@"png"]] stretchableImageWithLeftCapWidth:5 topCapHeight:3]
                                forState:UIControlStateNormal];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)progressSliderMoved:(UISlider *)sender
{
	player.currentTime = sender.value;
	[self updateCurrentTimeForPlayer:player];
}
-(void)updateCurrentTimeForPlayer:(AVAudioPlayer *)p
{
	NSString *current = [NSString stringWithFormat:@"%d:%02d", (int)p.currentTime / 60, (int)p.currentTime % 60, nil];
	NSString *dur = [NSString stringWithFormat:@"-%d:%02d", (int)((int)(p.duration - p.currentTime)) / 60, (int)((int)(p.duration - p.currentTime)) % 60, nil];
	_duration.text = dur;
	_current.text = current;
	_progressSlider.value = p.currentTime;
    if (p.duration==p.currentTime) {
        [updateTimer invalidate];
        updateTimer=nil;
    }
}
- (void)updateCurrentTime
{
	[self updateCurrentTimeForPlayer:player];
}
- (IBAction)playBtn:(id)sender {
}

- (IBAction)next:(id)sender {
}

- (IBAction)play:(id)sender {
    if (player.isPlaying) {
        [player pause];
        isPause=YES;
    }
    else
        if (isPause==YES) {
            [player play];
            isPause=NO;
        }
        else{
	NSString* file = [[NSBundle mainBundle] pathForResource:@"10_nam_tinh_cu" ofType:@"mp3"];
    NSURL* url = [NSURL fileURLWithPath:file];
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [player setDelegate:self];
    
	
	[player stop];
	
	_progressSlider.maximumValue = player.duration;
	
	player.delegate = self;
	player.volume=1;
	[player prepareToPlay];
	[player setNumberOfLoops:0];
	[player play];
    if (updateTimer)
		[updateTimer invalidate];
    updateTimer = [NSTimer scheduledTimerWithTimeInterval:.01 target:self selector:@selector(updateCurrentTime) userInfo:player repeats:YES];
        }
}

- (IBAction)prev:(id)sender {
}

- (IBAction)repeat:(id)sender {
}

- (IBAction)shuffer:(id)sender {
}

- (IBAction)like:(id)sender {
}
-(void)leftButtonBarPress:(id)button{
    if (player.isPlaying) {
        [player stop];
    }
    [self.navigationController popViewControllerAnimated:YES];
}
@end
