//
//  Cell.m
//  Karaoke
//
//  Created by Trinh Van Duong on 12/22/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import "Cell.h"

@implementation Cell
@synthesize buttonLike;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(IBAction)likeButtonController:(id)sender{
    self.__liked = !self.__liked;
    if(self.__liked){
        [self.buttonLike setImage:[UIImage imageNamed:@"star-yellow.png"] forState:UIControlStateNormal];
    }
    else{
        [self.buttonLike setImage:[UIImage imageNamed:@"star-blue.png"] forState:UIControlStateNormal];
    }
}

@end
