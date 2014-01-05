//
//  RecordManagerViewController.h
//  Karaoke
//
//  Created by Trinh Van Duong on 1/5/14.
//  Copyright (c) 2014 banana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import "NavibarViewController.h"
#import "Lib.h"

@interface RecordManagerViewController : NavibarViewController<UITableViewDataSource,UITableViewDelegate,AVAudioPlayerDelegate>{
    NSMutableArray* _dataRecords;
    NSURL *_pathFileRecord;
    AVAudioPlayer *_player;
}
@property (strong, nonatomic) IBOutlet UITableView *_tableView;

- (IBAction)playRecordController:(id)sender;
- (IBAction)stopPlayRecordController:(id)sender;
- (IBAction)shareFaceBookController:(id)sender;
- (IBAction)sentEmailController:(id)sender;
- (IBAction)smsController:(id)sender;
- (IBAction)addToTopRecordsController:(id)sender;
@end
