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
    
}
@property (weak, nonatomic) IBOutlet UIView *searchView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@property (weak, nonatomic) IBOutlet UITableView *tableList;

-(IBAction)rightButtonBarPress:(id)sender;
-(IBAction)closeSearch:(id)sender;
-(IBAction)leftButtonBarPress:(id)sender;
@end
