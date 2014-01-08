//
//  Cell.h
//  Karaoke
//
//  Created by Trinh Van Duong on 12/22/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Cell : UITableViewCell{

}

@property(assign,nonatomic) BOOL __liked;
@property (strong, nonatomic) IBOutlet UIButton *buttonLike;

-(IBAction)likeButtonController:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *_nameSong;
@property (strong, nonatomic) IBOutlet UILabel *_lyricExample;
@property (strong, nonatomic) IBOutlet UILabel *_numberLikes;
@property (strong, nonatomic) IBOutlet UILabel *_numberPlay;

//Use for cell of record
@property (strong, nonatomic) IBOutlet UILabel *_nameRecord;
@property (strong, nonatomic) IBOutlet UILabel *_idRecord;
@property (strong, nonatomic) IBOutlet UILabel *_infoRecord;
@property (strong, nonatomic) IBOutlet UILabel *_lyricRecord;

- (void)reloadLikeButton;

@end
