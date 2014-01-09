//
//  SingerCell.h
//  Karaoke
//
//  Created by papo on 12/26/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSTCollectionView.h"

@interface SingerCell : PSTCollectionViewCell

@property (nonatomic, weak) IBOutlet UIImageView* icon;
@property (nonatomic, weak) IBOutlet UILabel*   name;
@end