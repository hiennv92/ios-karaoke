//
//  karaokeListCell.m
//  Karaoke
//
//  Created by datkq on 12/23/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import "karaokeListCell.h"

@implementation karaokeListCell

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

- (IBAction)like:(id)sender {
    if (self.likeBtn.imageView.image==[UIImage imageNamed:@"star-blue.png"]) {
        [self.likeBtn setImage:[UIImage imageNamed:@"star-yellow.png"] forState:UIControlStateNormal];
    }
    else
        [self.likeBtn setImage:[UIImage imageNamed:@"star-blue.png"] forState:UIControlStateNormal];
    
}
@end
