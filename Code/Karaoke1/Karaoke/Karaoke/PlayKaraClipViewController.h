//
//  PlayKaraClipViewController.h
//  Karaoke
//
//  Created by datkq on 12/25/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavibarViewController.h"
#import "Cell.h"
#import "karaokeListCell.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface PlayKaraClipViewController : NavibarViewController<MPMediaPickerControllerDelegate> {
    int kindSegment;
    NSMutableArray *_arraySongsNew;
    MPMoviePlayerController* player;
}
@property (weak, nonatomic) IBOutlet UIView *playerView;
@property (weak, nonatomic) IBOutlet UITableView *tableList;
@property (weak, nonatomic) IBOutlet UIButton *lienQuanBtn;
@property (weak, nonatomic) IBOutlet UIButton *baiMauBtn;
@property (weak, nonatomic) IBOutlet UIButton *chiaSeBtn;
@property (weak, nonatomic) IBOutlet UIButton *playPauseBtn;
@property (weak, nonatomic) IBOutlet UISlider *sliderProgress;
- (IBAction)changeSegment1:(id)sender;
- (IBAction)changeSegment2:(id)sender;
- (IBAction)changeSegment3:(id)sender;
- (IBAction)playPause:(id)sender;
- (IBAction)share:(id)sender;
- (IBAction)fullscreen:(id)sender;

@end
