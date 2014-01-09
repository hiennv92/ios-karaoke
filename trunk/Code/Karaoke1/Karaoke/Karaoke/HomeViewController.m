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
#import "SingerListViewController.h"
#import "PlayMP3ViewController.h"
#import "RecordViewController.h"
#import "Lib.h"
#import "ServiceLib.h"
#import "Singer.h"
#import "Song.h"

@interface HomeViewController (){
    
}

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
    [self createNavigationBarWithTitle:Nil backgroundImage:@"bg-top-home.png" leftButton:@"menu.png" leftButtonPress:Nil rightButton:@"setting.png" rightButtonPress:Nil andType:1];
    [self addImageTitle:@"logo-banner.png"];
    
    [self setBottomBarViewHidden:NO];    
    [self loadViewContent];
    [self loadData];
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
    [self.__scrollViewSingers setContentSize:CGSizeMake(890, 120)];
    [self.__singersView addSubview:self.__scrollViewSingers];
    [self.__singersView setBackgroundColor:[UIColor clearColor]];
    
    for(int i = 0;i < _arrayListSinger.count;i++){
        _arrayImageSingers[i] = [[UIImageView alloc]initWithFrame:CGRectMake(10 + 110*i, 10, 100, 100)];
        [_arrayImageSingers[i] setImage:[UIImage imageNamed:@"ca-si.png"]];
        [self.__scrollViewSingers addSubview:_arrayImageSingers[i]];
        
        
        UIImageView *baseNameSinger = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BaseNameSingers.png"]];
        [baseNameSinger setFrame:CGRectMake(10 + 110*i, 80, 100,15)];
        [self.__scrollViewSingers addSubview:baseNameSinger];
        
        _arrayLabelSingerName[i] = [[UILabel alloc] initWithFrame:CGRectMake(10 + 110*i, 80, 100, 15)];
        _arrayLabelSingerName[i].textColor = [UIColor blueColor];
        _arrayLabelSingerName[i].font = [_arrayLabelSingerName[i].font fontWithSize:11];
        _arrayLabelSingerName[i].textAlignment = NSTextAlignmentCenter;

        [self.__scrollViewSingers addSubview:_arrayLabelSingerName[i]];
        
        _arrayBtnSelectSinger[i] = [[UIButton alloc]initWithFrame:CGRectMake(10 + 110*i, 10, 100, 100)];
        [_arrayBtnSelectSinger[i] addTarget:self action:@selector(chooseSingerController:) forControlEvents:UIControlEventTouchUpInside];
        [_arrayBtnSelectSinger[i] setImage:[UIImage imageNamed:@"khung-tron.png"] forState:UIControlStateNormal];
        [self.__scrollViewSingers addSubview:_arrayBtnSelectSinger[i]];
        [_arrayBtnSelectSinger[i] setTag:i];
    }
    
    //Songs View
    [self.__tableSongView registerNib:[UINib nibWithNibName:@"Cell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"Cell"];
    
    
    //Records View
    [self.__scrollViewTopRecords setFrame:CGRectMake(0, 30, 320, 100)];
    [self.__scrollViewTopRecords setContentSize:CGSizeMake(635, 100)];
    [self.__recordsView addSubview:self.__scrollViewTopRecords];
    [self.__recordsView setBackgroundColor:[UIColor clearColor]];
    
}

-(void)chooseSingerController:(id)sender{
    NSLog(@"Singer: %d",((UIButton*)sender).tag);
}

//Move views in Introduction view
- (void) runViewIntroduction:(NSTimer*) t{
    NSArray* views = [self.navigationController viewControllers];

    if([views count] == 1){
//        NSLog(@"CHANGE");
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
            [self setImageForSmallViewIntro:_changeSmallView];
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
            [self setImageForSmallViewIntro:_changeSmallView];
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
            [self setImageForSmallViewIntro:_changeSmallView];
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
            [self setImageForSmallViewIntro:_changeSmallView];
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

- (void)setImageForSmallViewIntro:(int)choose{
    if (_arrayIntroduce.count <= 0) {
        return;
    }
    int n1 = rand()%[_arrayIntroduce count];
    Song *song1 = [_arrayIntroduce objectAtIndex:n1];
    NSData *imageData1 = [NSData dataWithContentsOfURL:[NSURL URLWithString:[song1 getLargeImageUrl]]];
    
    int n2 = rand()%[_arrayIntroduce count];
    Song *song2 = [_arrayIntroduce objectAtIndex:n2];
    NSData *imageData2 = [NSData dataWithContentsOfURL:[NSURL URLWithString:[song2 getLargeImageUrl]]];
    
    switch (choose) {
        case 0:
            self._imageSmallBanner1.image = [UIImage imageWithData:imageData1];
            self._imageSmallBanner2.image = [UIImage imageWithData:imageData2];
            self._labelBigBanner2.text = song2.name;
            break;
        case 1:
            self._imageSmallBanner1.image = [UIImage imageWithData:imageData1];
            self._imageSmallBanner4.image = [UIImage imageWithData:imageData2];
            self._labelBigBanner2.text = song1.name;
            break;
        case 2:
            self._imageSmallBanner3.image = [UIImage imageWithData:imageData1];
            self._imageSmallBanner4.image = [UIImage imageWithData:imageData2];
            self._labelBigBanner2.text = song1.name;
            break;
        case 3:
            self._imageSmallBanner4.image = [UIImage imageWithData:imageData1];
            self._imageSmallBanner1.image = [UIImage imageWithData:imageData2];
            self._labelBigBanner2.text = song1.name;
            break;
        default:
            break;
    }

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
    return [_arrayListSong count];
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
    
    Song* song =  [_arrayListSong objectAtIndex:[indexPath row]];
    cell._nameSong.text = song.name;
    cell._numberLikes.text = [NSString stringWithFormat:@"%@ lượt thích",song.voteCount];
    cell._numberPlay.text = [NSString stringWithFormat:@"%@ lượt hát",song.voteScore];
    cell._lyricExample.text = song.lyric;
    if(song.isFavorite)
        cell.__liked = YES;
    else
        cell.__liked = NO;
    [cell reloadLikeButton];
    
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
    PlayMP3ViewController* vc = [[PlayMP3ViewController alloc] initWithNibName:@"PlayMP3ViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)kindMusicButtonPress:(id)button{
//    [_timerChangeIntroView invalidate];
    KindOfMusicViewController *kindMusic = [[KindOfMusicViewController alloc] initWithNibName:@"KindOfMusicViewController" bundle:Nil];
    [self.navigationController pushViewController:kindMusic animated:YES];
}

- (void)singerButtonPress:(id)button
{
    SingerListViewController* vc = [[SingerListViewController alloc] initWithNibName:@"SingerListViewController" bundle:Nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)recordButtonPress:(id)button{
    RecordViewController *rc = [[RecordViewController alloc] initWithNibName:@"RecordViewController" bundle:Nil];
    [self.navigationController pushViewController:rc animated:YES];
}

- (IBAction)showAllSingersController:(id)sender {
    SingerListViewController* vc = [[SingerListViewController alloc] initWithNibName:@"SingerListViewController" bundle:Nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)showAllKaraokeClipsController:(id)sender {
}

- (IBAction)showAllSongsController:(id)sender {
}

- (IBAction)showAllTopRecordsController:(id)sender {
}


#pragma mark - Load data
- (void)loadData
{
    _arrayListSinger = [[NSMutableArray alloc]initWithCapacity:8];
    _arrayListSong = [[NSMutableArray alloc] initWithCapacity:10];

    [Lib showLoadingOnView:self.view withText:@"Đang tải..."];
    [NSThread detachNewThreadSelector:@selector(getDataFromService) toTarget:self withObject:nil];
}

- (void)getDataFromService
{
    NSString* retVal = [ServiceLib sendGetRequest:[Lib getServiceUrl:kServiceSingerUrl]];
    SBJsonParser* parser = [[SBJsonParser alloc] init];
    id data = [parser objectWithString:retVal];
    if (data && [data isKindOfClass:[NSDictionary class]]) {
        NSString* message = [data objectForKey:@"message"];
        NSString* error = [data objectForKey:@"error"];
        id result = [data objectForKey:@"result"];
        if (error.integerValue == 0) { // success!
            NSArray* items = [result objectForKey:@"items"];
            if (items) {
                for (id singer in items) {
                    Singer *s = [Singer singerFromDictionary:singer];
                    [_arrayListSinger addObject:s];
                }
            }
        }
        else{
            NSLog(@"error: %@ message: %@", error, message);
        }
    }
    
    NSString *retValSong= [ServiceLib sendGetRequest:[Lib getServiceUrl:kServiceSongUrl]];
    SBJsonParser* parserSong = [[SBJsonParser alloc] init];
    id dataSong = [parserSong objectWithString:retValSong];
    if (dataSong && [dataSong isKindOfClass:[NSDictionary class]]) {
        NSString* message = [dataSong objectForKey:@"message"];
        NSString* error = [dataSong objectForKey:@"error"];
        id result = [dataSong objectForKey:@"result"];
        if (error.integerValue == 0) { // success!
            NSArray* items = [result objectForKey:@"items"];
            if (items) {
                for (id song in items) {
                    Song *s = [Song songFromDictionary:song];
                    [_arrayListSong addObject:s];
                }
            }
        }
        else{
            NSLog(@"error: %@ message: %@", error, message);
        }
    }
    
    [self performSelectorOnMainThread:@selector(getDataFinish) withObject:nil waitUntilDone:YES];
}

- (void)getDataFinish
{
    [Lib removeLoadingOnView:self.view];
    [self setDataScrollSingers];
    [self setDataScollSongs];
}

- (void)setDataScrollSingers{
    for(int i = 0;i < _arrayListSinger.count; i++){
        Singer *singer = [_arrayListSinger objectAtIndex:i];
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[singer getLargeImageUrl]]];
        _arrayLabelSingerName[i].text = singer.name;
        _arrayImageSingers[i].image = [UIImage imageWithData:imageData];
    }
}

- (void)setDataScollSongs{
    [self.__tableSongView reloadData];
    [self getDataIntroduce];
}


//Get data image for view introduce
- (void)getDataIntroduce{
    _arrayIntroduce = [[NSMutableArray alloc]init];
    for(int i = 0;i<[_arrayListSong count];i ++){
        Song *tmp = [_arrayListSong objectAtIndex:i];
        if(![tmp.largeImage isEqualToString:@"notImage"])
            [_arrayIntroduce addObject:tmp];
    }
}

@end
