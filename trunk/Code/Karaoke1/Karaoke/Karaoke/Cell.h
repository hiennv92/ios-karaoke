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

@end
