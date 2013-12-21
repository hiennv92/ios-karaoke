//
//  HomeViewController.h
//  Karaoke
//
//  Created by papo on 12/20/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavibarViewController.h"
@interface HomeViewController : NavibarViewController{
    
}

@property (strong, nonatomic) IBOutlet UIView *__bottomBarView;
@property (strong, nonatomic) IBOutlet UIScrollView *__scrollViewContent;

- (IBAction)singerButtonController:(id)sender;
- (IBAction)songButtonController:(id)sender;
- (IBAction)kindMusicButtonController:(id)sender;
- (IBAction)favoriteButtonController:(id)sender;
- (IBAction)recordButtonController:(id)sender;
@end
