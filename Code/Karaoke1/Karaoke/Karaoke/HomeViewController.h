//
//  HomeViewController.h
//  Karaoke
//
//  Created by papo on 12/20/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavibarViewController.h"
#import "Cell.h"

@interface HomeViewController : NavibarViewController{
    Cell *arraySongs[10];
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
@property (strong, nonatomic) IBOutlet UIScrollView *__scrollViewTopRecords;
@property (strong, nonatomic) IBOutlet UITableView *__tableViewSongs;

- (IBAction)showAllKaraokeClipController:(id)sender;
- (IBAction)showAllSingersButtonController:(id)sender;
- (IBAction)showAllSongsButtonController:(id)sender;
- (IBAction)showAllRecordsButtonController:(id)sender;


- (IBAction)singerButtonController:(id)sender;
- (IBAction)songButtonController:(id)sender;
- (IBAction)kindMusicButtonController:(id)sender;
- (IBAction)favoriteButtonController:(id)sender;
- (IBAction)recordButtonController:(id)sender;
@end
