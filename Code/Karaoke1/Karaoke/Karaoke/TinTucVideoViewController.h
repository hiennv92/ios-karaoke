//
//  TinTucVideoViewController.h
//  Karaoke
//
//  Created by datkq on 1/11/14.
//  Copyright (c) 2014 banana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavibarViewController.h"
#import "TinTucVideoCell.h"
#import "PlayTinTucVideoViewController.h"
@interface TinTucVideoViewController : NavibarViewController{
    int kindSegment;
}
@property (weak, nonatomic) IBOutlet UITableView *tableList;
@property (weak, nonatomic) IBOutlet UIButton *camera360;
@property (weak, nonatomic) IBOutlet UIButton *clipGayBao;
- (IBAction)changeSegment1:(id)sender;
- (IBAction)changeSegment2:(id)sender;

@end
