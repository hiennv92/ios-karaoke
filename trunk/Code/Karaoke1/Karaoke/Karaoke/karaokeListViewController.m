//
//  karaokeListViewController.m
//  Karaoke
//
//  Created by datkq on 12/23/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import "karaokeListViewController.h"
#import "Cell.h"
#import "Lib.h"
#import "Song.h"
#import "PlayKaraClipViewController.h"
#import "SingerListViewController.h"
#import "RecordViewController.h"
#import "KindOfMusicViewController.h"

@interface karaokeListViewController ()

@end

@implementation karaokeListViewController

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
    kindSegment=0;
    /*kindSegment : 0 - bai hat moi
                    1 - bai hat hits
                    2 - tat ca
                    3 - video clip
    */
    
    
    // Do any additional setup after loading the view from its nib.
    [self.kind1 removeFromSuperview];
    [self.kind2 removeFromSuperview];
    [self.kind3 removeFromSuperview];
    [self.kind4 removeFromSuperview];
    
    [self createNavigationBarWithTitle:Nil backgroundImage:@"bg-top-home.png" leftButton:@"back-btn.png" leftButtonPress:Nil rightButton:@"btn-search-top.png" rightButtonPress:Nil andType:2];
    [self addTitleNavibar:@"KARAOKE" andSize:22];
    [self setBottomBarViewHidden:NO];
    [self setSearchBarViewHidden:NO];
    
    [self.view addSubview:self.kind1];
    [self.view addSubview:self.kind2];
    [self.view addSubview:self.kind3];
    [self.view addSubview:self.kind4];
    
    [self loadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    if(kindSegment == 0)
        return [_arraySongsNew count];
    else if(kindSegment == 1)
        return [_arraySongsHit count];
    else if(kindSegment == 2)
        return [_arraySongs count];
    else
        return 10;
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(kindSegment == 3)
        return 90;
    else
        return 70;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = nil;
    if (kindSegment!=3) {
        CellIdentifier=@"Cell";
        Cell *cell = (Cell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell==nil) {
            NSArray *nib= [[NSBundle mainBundle]loadNibNamed:CellIdentifier owner:self options:nil];
            cell=[nib objectAtIndex:0];
        }
        
        Song* song;
        if(kindSegment == 0){
            song =  [_arraySongsNew objectAtIndex:[indexPath row]];
        }
        else if(kindSegment == 1){
            song =  [_arraySongsHit objectAtIndex:[indexPath row]];
        }
        else if(kindSegment == 2){
            song = [_arraySongs objectAtIndex:[indexPath row]];
        }
        
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
    else{
        CellIdentifier=@"karaokeListCell";
        karaokeListCell *cell = (karaokeListCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell==nil) {
            NSArray *nib= [[NSBundle mainBundle]loadNibNamed:CellIdentifier owner:self options:nil];
            cell=[nib objectAtIndex:0];
        }
        
        return cell;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (kindSegment==3) {
        PlayKaraClipViewController *playView=[[PlayKaraClipViewController alloc] init];
        [self.navigationController pushViewController:playView animated:YES ];
    }
}

- (IBAction)changeSegment1:(id)sender {
    kindSegment=0;
    [_tableList reloadData];
    [_kind1 setImage:[UIImage imageNamed:@"1-bai-moi-select.png"] forState:UIControlStateNormal];
    [_kind2 setImage:[UIImage imageNamed:@"2-bai-hits.png"] forState:UIControlStateNormal];
    [_kind3 setImage:[UIImage imageNamed:@"3-tat-ca.png"] forState:UIControlStateNormal];
    [_kind4 setImage:[UIImage imageNamed:@"4-karaoke-clip.png"] forState:UIControlStateNormal];
    [self.tableList reloadData];
}

- (IBAction)changeSegment2:(id)sender {
    kindSegment=1;
    [_tableList reloadData];
    [_kind1 setImage:[UIImage imageNamed:@"1-bai-moi.png"] forState:UIControlStateNormal];
    [_kind2 setImage:[UIImage imageNamed:@"2-bai-hits-select.png"] forState:UIControlStateNormal];
    [_kind3 setImage:[UIImage imageNamed:@"3-tat-ca.png"] forState:UIControlStateNormal];
    [_kind4 setImage:[UIImage imageNamed:@"4-karaoke-clip.png"] forState:UIControlStateNormal];
    [self.tableList reloadData];
}

- (IBAction)changeSegment3:(id)sender {
    kindSegment=2;
    [_tableList reloadData];
    [_kind1 setImage:[UIImage imageNamed:@"1-bai-moi.png"] forState:UIControlStateNormal];
    [_kind2 setImage:[UIImage imageNamed:@"2-bai-hits.png"] forState:UIControlStateNormal];
    [_kind3 setImage:[UIImage imageNamed:@"3-tat-ca-select.png"] forState:UIControlStateNormal];
    [_kind4 setImage:[UIImage imageNamed:@"4-karaoke-clip.png"] forState:UIControlStateNormal];
    [self.tableList reloadData];
}

- (IBAction)changeSegment4:(id)sender {
    kindSegment=3;
    [_tableList reloadData];
    [_kind1 setImage:[UIImage imageNamed:@"1-bai-moi.png"] forState:UIControlStateNormal];
    [_kind2 setImage:[UIImage imageNamed:@"2-bai-hits.png"] forState:UIControlStateNormal];
    [_kind3 setImage:[UIImage imageNamed:@"3-tat-ca.png"] forState:UIControlStateNormal];
    [_kind4 setImage:[UIImage imageNamed:@"4-karaoke-clip-select.png"] forState:UIControlStateNormal];
}

-(void)leftButtonBarPress:(id)button{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)rightButtonBarPress:(id)button{
    [self showSearchBar:NO];
}

//Close search bar
-(void)closeSearchBarPress:(id)button{
    [self.searchBarView._searchBar resignFirstResponder];
    [self showSearchBar:YES];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    //    NSLog(@"%@",searchBar.text);
    [searchBar resignFirstResponder];
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


#pragma mark - Load data
- (void)loadData
{
    _arraySongs = [[NSMutableArray alloc] init];
    _arraySongsHit = [[NSMutableArray alloc] init];
    _arraySongsNew = [[NSMutableArray alloc] init];
    
    [Lib showLoadingOnView:self.view withText:@"Đang tải..."];
    [NSThread detachNewThreadSelector:@selector(getDataFromService) toTarget:self withObject:nil];
}

- (void)getDataFromService
{
    _arraySongs = [Lib getAllSongs];
    
    for(int i = 0;i<[_arraySongs count];i++){
        Song *song = [_arraySongs objectAtIndex:i];
        if(song.isHit)
            [_arraySongsHit addObject:song];
        if(song.isNewSong)
            [_arraySongsNew addObject:song];
    }
    
    NSLog(@"Count: %d-%d-%d",_arraySongs.count, _arraySongsHit.count, _arraySongsNew.count);
    
    [self performSelectorOnMainThread:@selector(getDataFinish) withObject:nil waitUntilDone:YES];
}

- (void)getDataFinish
{
    [Lib removeLoadingOnView:self.view];
    [self setDataScollSongs];
}

- (void)setDataScollSongs{
    [self.tableList reloadData];
}

@end
