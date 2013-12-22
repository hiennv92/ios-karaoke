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
@property (strong, nonatomic) IBOutlet UIView *__bannerView;
@property (strong, nonatomic) IBOutlet UIView *__introductionVIew;
@property (strong, nonatomic) IBOutlet UIView *__karaokeClipsView;
@property (strong, nonatomic) IBOutlet UIView *__singersView;
@property (strong, nonatomic) IBOutlet UIView *__songsView;
@property (strong, nonatomic) IBOutlet UIView *__recordsView;



@property (strong, nonatomic) IBOutlet UIView *__bottomBarView;

@property (strong, nonatomic) IBOutlet UIScrollView *__scrollViewContent;
@property (strong, nonatomic) IBOutlet UIScrollView *__scrollViewSingers;
@property (strong, nonatomic) IBOutlet UIScrollView *__scrollViewKaraokeClips;

- (IBAction)singerButtonController:(id)sender;
- (IBAction)songButtonController:(id)sender;
- (IBAction)kindMusicButtonController:(id)sender;
- (IBAction)favoriteButtonController:(id)sender;
- (IBAction)recordButtonController:(id)sender;
@end
