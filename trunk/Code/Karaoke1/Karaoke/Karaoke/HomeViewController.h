//
//  HomeViewController.h
//  Karaoke
//
//  Created by papo on 12/20/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavibarViewController.h"
#define TIME_CHANGE_SMALL_VIEW 1.5
@interface HomeViewController : NavibarViewController{
    NSString *_stringImageBigBanner;
    NSTimer* _timerChangeIntroSmallView, *_timerChangeIntroBigView;
    BOOL _changeBigView;
    int _changeSmallView;
}
@property (strong, nonatomic) IBOutlet UIView *__bannerView;
@property (strong, nonatomic) IBOutlet UIView *__introductionVIew;
@property (strong, nonatomic) IBOutlet UIView *__karaokeClipsView;
@property (strong, nonatomic) IBOutlet UIView *__singersView;
@property (strong, nonatomic) IBOutlet UIView *__songsView;
@property (strong, nonatomic) IBOutlet UIView *__recordsView;
@property (strong, nonatomic) IBOutlet UITableView *__tableSongView;


@property (strong, nonatomic) IBOutlet UIScrollView *__scrollViewContent;
@property (strong, nonatomic) IBOutlet UIScrollView *__scrollViewSingers;
@property (strong, nonatomic) IBOutlet UIScrollView *__scrollViewKaraokeClips;
@property (strong, nonatomic) IBOutlet UIScrollView *__scrollViewTopRecords;


@property (strong, nonatomic) IBOutlet UIView *_bigViewIntroduction1;
@property (strong, nonatomic) IBOutlet UIView *_bigViewIntroduction2;

@property (strong, nonatomic) IBOutlet UIImageView *_imageBigBanner1;
@property (strong, nonatomic) IBOutlet UIImageView *_imageBigBanner2;
@property (strong, nonatomic) IBOutlet UIImageView *_imageSmallBanner1;
@property (strong, nonatomic) IBOutlet UIImageView *_imageSmallBanner2;
@property (strong, nonatomic) IBOutlet UIImageView *_imageSmallBanner3;
@property (strong, nonatomic) IBOutlet UIImageView *_imageSmallBanner4;

- (IBAction)showAllSingersController:(id)sender;
- (IBAction)showAllKaraokeClipsController:(id)sender;
- (IBAction)showAllSongsController:(id)sender;
- (IBAction)showAllTopRecordsController:(id)sender;

@end
