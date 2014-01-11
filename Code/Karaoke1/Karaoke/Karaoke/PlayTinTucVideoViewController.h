//
//  PlayTinTucVideoViewController.h
//  Karaoke
//
//  Created by datkq on 1/11/14.
//  Copyright (c) 2014 banana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavibarViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import "TinTucVideoCell.h"

@interface PlayTinTucVideoViewController : NavibarViewController{
    MPMoviePlayerController *player;
}
@property (weak, nonatomic) IBOutlet UIView *playerView;
@property (weak, nonatomic) IBOutlet UILabel *tilteBanner;
@property (weak, nonatomic) IBOutlet UITableView *tableList;

@end
