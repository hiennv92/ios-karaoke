//
//  karaokeListViewController.m
//  Karaoke
//
//  Created by datkq on 12/23/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import "karaokeListViewController.h"
#import "Cell.h"
#import "PlayKaraClipViewController.h"

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
//    [self createNavigationBarWithTitle:Nil backgroundImage:@"bg-top-home.png" leftButton:@"back-btn.png" leftButtonPress:Nil rightButton:@"btn-search-top.png" rightButtonPress:Nil];
    
//    [self addTitleNavibar:@"KARAOKE" andSize:22];
    [self setBottomBarViewHidden:NO];
    [self setSearchBarViewHidden:NO];
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
    return 100;
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
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
    
    
    
   
    
    
    
    // Configure the cell...
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (kindSegment==3) {
        PlayKaraClipViewController *playView=[[PlayKaraClipViewController alloc] init];
        [self.navigationController pushViewController:playView animated:YES ];
    }
}

-(IBAction)leftButtonBarPress:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)changeSegment1:(id)sender {
    kindSegment=0;
    [_tableList reloadData];
    [_kind1 setImage:[UIImage imageNamed:@"1-bai-moi-select.png"] forState:UIControlStateNormal];
    [_kind2 setImage:[UIImage imageNamed:@"2-bai-hits.png"] forState:UIControlStateNormal];
    [_kind3 setImage:[UIImage imageNamed:@"3-tat-ca.png"] forState:UIControlStateNormal];
    [_kind4 setImage:[UIImage imageNamed:@"4-karaoke-clip.png"] forState:UIControlStateNormal];
}

- (IBAction)changeSegment2:(id)sender {
    kindSegment=1;
    [_tableList reloadData];
    [_kind1 setImage:[UIImage imageNamed:@"1-bai-moi.png"] forState:UIControlStateNormal];
    [_kind2 setImage:[UIImage imageNamed:@"2-bai-hits-select.png"] forState:UIControlStateNormal];
    [_kind3 setImage:[UIImage imageNamed:@"3-tat-ca.png"] forState:UIControlStateNormal];
    [_kind4 setImage:[UIImage imageNamed:@"4-karaoke-clip.png"] forState:UIControlStateNormal];
}

- (IBAction)changeSegment3:(id)sender {
    kindSegment=2;
    [_tableList reloadData];
    [_kind1 setImage:[UIImage imageNamed:@"1-bai-moi.png"] forState:UIControlStateNormal];
    [_kind2 setImage:[UIImage imageNamed:@"2-bai-hits.png"] forState:UIControlStateNormal];
    [_kind3 setImage:[UIImage imageNamed:@"3-tat-ca-select.png"] forState:UIControlStateNormal];
    [_kind4 setImage:[UIImage imageNamed:@"4-karaoke-clip.png"] forState:UIControlStateNormal];
}

- (IBAction)changeSegment4:(id)sender {
    kindSegment=3;
    [_tableList reloadData];
    [_kind1 setImage:[UIImage imageNamed:@"1-bai-moi.png"] forState:UIControlStateNormal];
    [_kind2 setImage:[UIImage imageNamed:@"2-bai-hits.png"] forState:UIControlStateNormal];
    [_kind3 setImage:[UIImage imageNamed:@"3-tat-ca.png"] forState:UIControlStateNormal];
    [_kind4 setImage:[UIImage imageNamed:@"4-karaoke-clip-select.png"] forState:UIControlStateNormal];
}


-(IBAction)closeSearch:(id)sender{
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionTransitionNone|UIViewAnimationOptionCurveEaseInOut animations:^(){
        _searchView.center=CGPointMake(3*self.view.bounds.size.width/2, _searchView.center.y);
    }completion:^(BOOL fn){
        
    }];
}

@end
