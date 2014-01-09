//
//  SingerDetailViewController.h
//  Karaoke
//
//  Created by papo on 1/10/14.
//  Copyright (c) 2014 banana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavibarViewController.h"

@class Singer;

@interface SingerDetailViewController : NavibarViewController<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *singerName;
@property (weak, nonatomic) IBOutlet UIImageView *singerImage;
@property (weak, nonatomic) IBOutlet UILabel *singerRealName;
@property (weak, nonatomic) IBOutlet UILabel *birthdayLb;
@property (weak, nonatomic) IBOutlet UILabel *countryLb;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIView *sectionSinger;

@property (nonatomic, retain) Singer* singer;
@end
