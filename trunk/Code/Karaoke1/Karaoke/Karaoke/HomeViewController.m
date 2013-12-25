//
//  HomeViewController.m
//  Karaoke
//
//  Created by papo on 12/20/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import "HomeViewController.h"
#import "KindOfMusicViewController.h"
#import "Cell.h"

@interface HomeViewController ()

@end

@implementation HomeViewController
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
    [self createNavigationBarWithTitle:Nil backgroundImage:@"bg-top-home.png" leftButton:@"menu.png" leftButtonPress:Nil rightButton:@"setting.png" rightButtonPress:Nil];
    [self addImageTitle:@"logo-banner.png"];
    
    [self setBottomBarViewHidden:NO];    
    [self loadViewContent];
}

-(void)loadViewContent{
    [self.__scrollViewContent setFrame:CGRectMake(0, 44, 320, self.view.frame.size.height- 2*44)];
    [self.__scrollViewContent setContentSize:CGSizeMake(320, 975)];
    [self.view addSubview:self.__scrollViewContent];
    
    //Ads view
    [self.__bannerView setBackgroundColor:[UIColor clearColor]];
    
    /*Introdution view*/
    _timerChangeIntroBigView = [NSTimer scheduledTimerWithTimeInterval: 8.0f target: self
                                                      selector: @selector(runViewIntroduction:) userInfo: nil repeats: YES];
//    _timerChangeIntroSmallView = [NSTimer scheduledTimerWithTimeInterval:5.0f target:self selector:@selector(runViewIntroductionSmall:) userInfo:nil repeats:YES];
    
    //Set bigView
    CGRect frame = self._bigViewIntroduction2.frame;
    frame.origin.x = 220;
    [self._bigViewIntroduction2 setFrame:frame];

    self._imageBigBanner1.image = self._imageSmallBanner3.image;
    self._imageBigBanner2.image = self._imageSmallBanner4.image;

    _changeBigView = YES;
    _changeSmallView = 0;
    
    [self performSelector:@selector(runViewIntroduction:) withObject:_timerChangeIntroBigView afterDelay:3.0f];
//    [self performSelector:@selector(runViewIntroductionSmall:) withObject:_timerChangeIntroSmallView afterDelay:3.0f];

    //Set smallView
    frame = self._imageSmallBanner1.frame;
    frame.origin.y = -180;
    self._imageSmallBanner1.frame = frame;
    frame = self._imageSmallBanner2.frame;
    frame.origin.y = -90;
    self._imageSmallBanner2.frame = frame;
    frame = self._imageSmallBanner3.frame;
    frame.origin.y = 0;
    self._imageSmallBanner3.frame = frame;
    frame = self._imageSmallBanner4.frame;
    frame.origin.y = 90;
    self._imageSmallBanner4.frame = frame;
    
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
    [self.__tableSongView registerNib:[UINib nibWithNibName:@"Cell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"Cell"];
    
    
    //Records View
    [self.__scrollViewTopRecords setFrame:CGRectMake(0, 30, 320, 100)];
    [self.__scrollViewTopRecords setContentSize:CGSizeMake(635, 100)];
    [self.__recordsView addSubview:self.__scrollViewTopRecords];
    [self.__recordsView setBackgroundColor:[UIColor clearColor]];
    
}

//Move views in Introduction view
- (void) runViewIntroduction:(NSTimer*) t{
//    NSLog(@"Change big view");
    if(_changeBigView){
        [UIView animateWithDuration:2.5f animations:^{
            CGRect frame = self._bigViewIntroduction1.frame;
            frame.origin.x = -220;
            [self._bigViewIntroduction1 setFrame: frame];
            frame = self._bigViewIntroduction2.frame;
            frame.origin.x = 0;
            [self._bigViewIntroduction2 setFrame:frame];
        } completion:^(BOOL finished) {
            CGRect frame = self._bigViewIntroduction1.frame;
            frame.origin.x = 220;
            [self._bigViewIntroduction1 setFrame:frame];
            self._imageBigBanner1.image = [self setImageForBigViewIntro];
            _changeBigView = NO;
            [self runViewIntroductionSmall];
        }];
    }
    else{
        [UIView animateWithDuration:2.5f animations:^{
            CGRect frame = self._bigViewIntroduction2.frame;
            frame.origin.x = -220;
            [self._bigViewIntroduction2 setFrame: frame];
            frame = self._bigViewIntroduction1.frame;
            frame.origin.x = 0;
            [self._bigViewIntroduction1 setFrame:frame];
        } completion:^(BOOL finished) {
            CGRect frame = self._bigViewIntroduction2.frame;
            frame.origin.x = 220;
            [self._bigViewIntroduction2 setFrame:frame];
            self._imageBigBanner2.image = [self setImageForBigViewIntro];
            _changeBigView = YES;
            [self runViewIntroductionSmall];
        }];
    }
}

-(void) runViewIntroductionSmall{
//    NSLog(@"Change view small");
    if(_changeSmallView == 0){
        [UIView animateWithDuration:TIME_CHANGE_SMALL_VIEW animations:^{
            CGRect frame = self._imageSmallBanner1.frame;
            frame.origin.y = -90;
            [self._imageSmallBanner1 setFrame: frame];
            frame = self._imageSmallBanner2.frame;
            frame.origin.y = 0;
            [self._imageSmallBanner2 setFrame:frame];
            frame = self._imageSmallBanner3.frame;
            frame.origin.y = 90;
            [self._imageSmallBanner3 setFrame:frame];
            frame = self._imageSmallBanner4.frame;
            frame.origin.y = 180;
            [self._imageSmallBanner4 setFrame:frame];
        } completion:^(BOOL finished) {
            _changeSmallView = 1;
        }];
    }
    else if(_changeSmallView == 1) {
        [UIView animateWithDuration:TIME_CHANGE_SMALL_VIEW animations:^{
            CGRect frame = self._imageSmallBanner1.frame;
            frame.origin.y = 0;
            [self._imageSmallBanner1 setFrame: frame];
            frame = self._imageSmallBanner2.frame;
            frame.origin.y = 90;
            [self._imageSmallBanner2 setFrame:frame];
            frame = self._imageSmallBanner3.frame;
            frame.origin.y = 180;
            [self._imageSmallBanner3 setFrame:frame];
            frame = self._imageSmallBanner4.frame;
            frame.origin.y = 270;
            [self._imageSmallBanner4 setFrame:frame];
        } completion:^(BOOL finished) {
            _changeSmallView = 2;
        }];
    }
    else if(_changeSmallView == 2) {
        [UIView animateWithDuration:TIME_CHANGE_SMALL_VIEW animations:^{
            CGRect frame = self._imageSmallBanner1.frame;
            frame.origin.y = -90;
            [self._imageSmallBanner1 setFrame: frame];
            frame = self._imageSmallBanner2.frame;
            frame.origin.y = 0;
            [self._imageSmallBanner2 setFrame:frame];
            frame = self._imageSmallBanner3.frame;
            frame.origin.y = 90;
            [self._imageSmallBanner3 setFrame:frame];
            frame = self._imageSmallBanner4.frame;
            frame.origin.y = 180;
            [self._imageSmallBanner4 setFrame:frame];
        } completion:^(BOOL finished) {
            _changeSmallView = 3;
        }];
    }
    else if(_changeSmallView == 3) {
        [UIView animateWithDuration:TIME_CHANGE_SMALL_VIEW animations:^{
            CGRect frame = self._imageSmallBanner1.frame;
            frame.origin.y = -180;
            [self._imageSmallBanner1 setFrame: frame];
            frame = self._imageSmallBanner2.frame;
            frame.origin.y = -90;
            [self._imageSmallBanner2 setFrame:frame];
            frame = self._imageSmallBanner3.frame;
            frame.origin.y = 0;
            [self._imageSmallBanner3 setFrame:frame];
            frame = self._imageSmallBanner4.frame;
            frame.origin.y = 90;
            [self._imageSmallBanner4 setFrame:frame];
        } completion:^(BOOL finished) {
            _changeSmallView = 0;
        }];
    }
}

-(UIImage *) setImageForBigViewIntro{
    UIImage *imageView;
    if(_changeSmallView == 0){
        imageView = self._imageSmallBanner2.image;
    }
    else if(_changeSmallView == 1){
        imageView = self._imageSmallBanner1.image;
    }
    else if(_changeSmallView == 2){
        imageView = self._imageSmallBanner3.image;
    }
    else if(_changeSmallView == 3){
        imageView = self._imageSmallBanner4.image;
    }
    return imageView;
}

////////////////////////////

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell setBackgroundColor:[UIColor clearColor]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    Cell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[Cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    
    return cell;
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)leftButtonBarPress:(id)button
{
    [[AppDelegate shareApplication] showLeftPanelWithAnimated:YES];
}

- (void)rightButtonBarPress:(id)button
{
    
}

- (void)kindMusicButtonPress:(id)button{
//    [_timerChangeIntroView invalidate];
    KindOfMusicViewController *kindMusic = [[KindOfMusicViewController alloc] initWithNibName:@"KindOfMusicViewController" bundle:Nil];
    [self.navigationController pushViewController:kindMusic animated:YES];
}



@end
