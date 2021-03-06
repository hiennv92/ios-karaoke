//
//  karaokeListViewController.h
//  Karaoke
//
//  Created by datkq on 12/23/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "karaokeListCell.h"
#import "NavibarViewController.h"

@interface karaokeListViewController : NavibarViewController <UITableViewDelegate,UITableViewDataSource>
{
    int kindSegment;
    NSMutableArray *_arraySongs;
    NSMutableArray *_arraySongsHit;
    NSMutableArray *_arraySongsNew;
}
@property (weak, nonatomic) IBOutlet UIButton *kind4;
@property (weak, nonatomic) IBOutlet UIButton *kind3;
@property (weak, nonatomic) IBOutlet UIButton *kind2;
@property (weak, nonatomic) IBOutlet UIButton *kind1;
@property (weak, nonatomic) IBOutlet UITableView *tableList;

- (IBAction)changeSegment1:(id)sender;
- (IBAction)changeSegment2:(id)sender;
- (IBAction)changeSegment3:(id)sender;
- (IBAction)changeSegment4:(id)sender;
@end
