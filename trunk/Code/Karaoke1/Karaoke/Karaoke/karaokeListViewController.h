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
}
@property (weak, nonatomic) IBOutlet UIButton *kind4;
@property (weak, nonatomic) IBOutlet UIButton *kind3;
@property (weak, nonatomic) IBOutlet UIButton *kind2;
@property (weak, nonatomic) IBOutlet UIButton *kind1;
@property (weak, nonatomic) IBOutlet UIView *searchView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@property (weak, nonatomic) IBOutlet UITableView *tableList;

-(IBAction)rightButtonBarPress:(id)sender;
-(IBAction)closeSearch:(id)sender;
-(IBAction)leftButtonBarPress:(id)sender;
- (IBAction)changeSegment1:(id)sender;
- (IBAction)changeSegment2:(id)sender;
- (IBAction)changeSegment3:(id)sender;
- (IBAction)changeSegment4:(id)sender;
@end
