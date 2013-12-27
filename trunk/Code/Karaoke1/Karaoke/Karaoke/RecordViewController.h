//
//  RecordViewController.h
//  Karaoke
//
//  Created by Trinh Van Duong on 12/27/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecordViewController : UIViewController{
    
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
