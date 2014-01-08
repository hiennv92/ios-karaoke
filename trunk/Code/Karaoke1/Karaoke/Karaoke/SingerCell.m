//
//  SingerCell.m
//  Karaoke
//
//  Created by papo on 12/26/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import "SingerCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation SingerCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    self.icon.layer.masksToBounds = YES;
    self.icon.layer.cornerRadius = self.frame.size.width / 2;
    self.backgroundColor = [UIColor clearColor];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
