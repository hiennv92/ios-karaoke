//
//  PlayKaraClipViewController.m
//  Karaoke
//
//  Created by datkq on 12/25/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import "PlayKaraClipViewController.h"
#import "Lib.h"
#import "Song.h"
@interface PlayKaraClipViewController ()

@end

@implementation PlayKaraClipViewController

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
    [self createNavigationBarWithTitle:Nil backgroundImage:@"bg-top-home.png" leftButton:@"back-btn.png" leftButtonPress:Nil rightButton:@"btn-trai-tim.png" rightButtonPress:Nil andType:1];
    
    [self addTitleNavibar:@"EM SẼ HẠNH PHÚC" andSize:20];
    [self setBottomBarViewHidden:NO];
    [self setSearchBarViewHidden:YES];
    // Do any additional setup after loading the view from its nib.

    
    NSURL*theurl=[[NSBundle mainBundle] URLForResource:@"anh_khong_doi_qua" withExtension:@"mp4"];
    player=[[MPMoviePlayerController alloc] initWithContentURL:theurl];
    [player.view setFrame:CGRectMake(0, 0, 320,210)];
    [player prepareToPlay];
    [player setShouldAutoplay:NO]; // And other options you can look through the documentation.
    [self.playerView addSubview:player.view];
    [self.playerView setUserInteractionEnabled:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)leftButtonBarPress:(id)button{
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)changeSegment1:(id)sender {
}

- (IBAction)changeSegment2:(id)sender {
}

- (IBAction)changeSegment3:(id)sender {
}

- (IBAction)playPause:(id)sender {
//    if (([player duration]>[player currentPlaybackTime])&&([player currentPlaybackTime])>0) {
//        [player pause];
//        [_playPauseBtn setBackgroundImage:[UIImage imageNamed:@"4_1_play_btn.png"] forState:UIControlStateNormal];
//    }
//    else{
//        [_playPauseBtn setBackgroundImage:[UIImage imageNamed:@"4_1_play_btn.png"] forState:UIControlStateNormal];
//        [player play];
//    }
}

- (IBAction)share:(id)sender {
}

- (IBAction)fullscreen:(id)sender {
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
   
    return 20;
   
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        return 90;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = nil;
        CellIdentifier=@"karaokeListCell";
        karaokeListCell *cell = (karaokeListCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell==nil) {
            NSArray *nib= [[NSBundle mainBundle]loadNibNamed:CellIdentifier owner:self options:nil];
            cell=[nib objectAtIndex:0];
        }
        
        return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
   
}

@end
