//
//  karaokeListCell.h
//  Karaoke
//
//  Created by datkq on 12/23/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface karaokeListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgAvata;
@property (weak, nonatomic) IBOutlet UILabel *tenBaiHat;
@property (weak, nonatomic) IBOutlet UILabel *loiBaiHat;
@property (weak, nonatomic) IBOutlet UILabel *ngThich;
@property (weak, nonatomic) IBOutlet UILabel *ngHat;

@end
