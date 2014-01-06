//
//  NhacDJ-TinTucViewController.h
//  Karaoke
//
//  Created by datkq on 1/6/14.
//  Copyright (c) 2014 banana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavibarViewController.h"
#import "NhacDJCell.h"

@interface NhacDJ_TinTucViewController :NavibarViewController<UITableViewDataSource,UITableViewDelegate>{
    int kindSegment;
}
@property (weak, nonatomic) IBOutlet UIButton *kind3;
@property (weak, nonatomic) IBOutlet UIButton *kind2;
@property (weak, nonatomic) IBOutlet UIButton *kind1;
@property (weak, nonatomic) IBOutlet UITableView *tableSong;
@property (weak, nonatomic) IBOutlet UIView *topView;
- (IBAction)menu:(id)sender;
- (IBAction)search:(id)sender;
- (IBAction)changeSegment1:(id)sender;
- (IBAction)changeSegment2:(id)sender;
- (IBAction)changeSegment3:(id)sender;
//- (id)initWithTypeSegment:(int)type;
@end
