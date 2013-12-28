//
//  WordLabel.m
//  Karaoke
//
//  Created by papo on 12/27/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import "WordLabel.h"
#import "Lib.h"

#define kWordDefaultHeight  20

@implementation WordLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithText:(NSString *)text
{
    self = [super init];
    if (self) {
        self.text = text;
        self.backgroundColor = [UIColor clearColor];
        CGFloat width = [Lib widthForLabel:self];
        [self setFrame:CGRectMake(0, 0, width, kWordDefaultHeight)];
    }
    return self;
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
