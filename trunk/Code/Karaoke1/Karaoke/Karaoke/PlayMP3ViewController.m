//
//  PlayMP3ViewController.m
//  Karaoke
//
//  Created by papo on 12/26/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import "PlayMP3ViewController.h"
#import "Lyric.h"
#import "Sentence.h"
#import "Word.h"
#import "SentenceView.h"

@interface PlayMP3ViewController ()
{
    NSTimer* _timer;
    Lyric*    _lyric;
    int         _currentIndex;
    int         _currentWord;
    SentenceView*   _sentenceView;
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
    _lyric = [Lyric lyricWithFile:@"10_nam_tinh_cu"];
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
    _currentIndex = 0;
    _currentWord = 0;
}

- (void)timerDelay
{
//    NSLog(@"audio time: %f", _player.currentTime);
    Sentence* sentence = [_lyric sentenceAtIndex:_currentIndex];
    int compare = [sentence compareWithTime:_player.currentTime];
    if (compare == CompareResultSame) {
        if (!_sentenceView) {
            _sentenceView = [[SentenceView alloc] initWithSentence:sentence atPos:CGPointMake(50, 100)];
            [self.view addSubview:_sentenceView];
        }
        for (int i = _currentWord; i < sentence.wordsArray.count; i++) {
            Word* w = sentence.wordsArray[i];
            if ([w isWordInTime:_player.currentTime]) {
                NSLog(@"word: %@", w.value);
                ++_currentWord;
                [_sentenceView selectWord:i];
                break;
            }
        }
    }
    else if (compare == CompareResultAcc)
    {
        ++_currentIndex;
        _currentWord = 0;
        [_sentenceView removeFromSuperview];
        _sentenceView = nil;
    }
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
}
@end
