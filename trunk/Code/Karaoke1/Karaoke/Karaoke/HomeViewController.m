//
//  HomeViewController.m
//  Karaoke
//
//  Created by papo on 12/20/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController
@synthesize __bottomBarView;
@synthesize __scrollViewContent;
@synthesize __bannerView;
@synthesize __introductionVIew;
@synthesize __karaokeClipsView;
@synthesize __recordsView;
@synthesize __scrollViewSingers;
@synthesize __singersView;
@synthesize __songsView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self createNavigationBarWithTitle:Nil backgroundImage:@"bg-top-home.png" leftButton:Nil leftButtonPress:Nil rightButton:Nil rightButtonPress:Nil];
    [self addImageTitle:@"logo-banner.png"];
    self.__bottomBarView.frame = CGRectMake(0, self.view.frame.size.height-44, 320, 44);
//    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    
    [self loadViewContent];
}

-(void)loadViewContent{
    [self.__scrollViewContent setFrame:CGRectMake(0, 44, 320, self.view.frame.size.height- 2*44)];
    [self.__scrollViewContent setContentSize:CGSizeMake(320, 1300)];
    [self.view addSubview:self.__scrollViewContent];
    
    //Ads view
    [self.__bannerView setBackgroundColor:[UIColor clearColor]];
    
    //Karaoke clips view
    [self.__scrollViewKaraokeClips setFrame:CGRectMake(0, 30, 320, 120)];
    [self.__scrollViewKaraokeClips setContentSize:CGSizeMake(640, 120)];
    [self.__karaokeClipsView addSubview:self.__scrollViewKaraokeClips];
    [self.__karaokeClipsView setBackgroundColor:[UIColor clearColor]];
    
    //Singers View
    [self.__scrollViewSingers setFrame:CGRectMake(0,30, 320, 120)];
    [self.__scrollViewSingers setContentSize:CGSizeMake(640, 120)];
    [self.__singersView addSubview:self.__scrollViewSingers];
    [self.__singersView setBackgroundColor:[UIColor clearColor]];
    
    //Songs View
    
    
    //Records View
    [self.__scrollViewTopRecords setFrame:CGRectMake(0, 30, 320, 100)];
    [self.__scrollViewTopRecords setContentSize:CGSizeMake(635, 100)];
    [self.__recordsView addSubview:self.__scrollViewTopRecords];
    [self.__recordsView setBackgroundColor:[UIColor clearColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)leftButtonBarPress:(id)button
{
    
}

- (void)rightButtonBarPress:(id)button
{
    
}
- (IBAction)singerButtonController:(id)sender {
}

- (IBAction)songButtonController:(id)sender {
}

- (IBAction)kindMusicButtonController:(id)sender {
}

- (IBAction)favoriteButtonController:(id)sender {
}

- (IBAction)recordButtonController:(id)sender {
}
@end
