//
//  NhacDJTinTucViewController.m
//  Karaoke
//
//  Created by datkq on 1/6/14.
//  Copyright (c) 2014 banana. All rights reserved.
//

#import "NhacDJTinTucViewController.h"

@interface NhacDJTinTucViewController ()

@end

@implementation NhacDJTinTucViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //    [self setBottomBarViewHidden:YES];
    //    [self setSearchBarViewHidden:YES];
    
    switch (kindSegment) {
        case 0:
            [_kind1 setImage:[UIImage imageNamed:@"11-moi-nhat-select.png"] forState:UIControlStateNormal];
            break;
        case 1:
            [_kind2 setImage:[UIImage imageNamed:@"11-hot-nhat-select.png"] forState:UIControlStateNormal];
            break;
        case 2:
            [_kind3 setImage:[UIImage imageNamed:@"11-noi-bat-select.png"] forState:UIControlStateNormal];
            break;
        default:
            break;
    }
    
}


- (IBAction)closeSearch:(id)sender {
    [UIView animateWithDuration:0.5f delay:0.0f options:UIViewAnimationCurveLinear|UIViewAnimationOptionCurveEaseInOut animations:^(){
        if (_topView.center.x==320) {
            _topView.center=CGPointMake(0, 22);
        }
        else
            _topView.center=CGPointMake(320, 22);
    }completion:^(BOOL fn){
        
    }];
}

- (IBAction)menu:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)search:(id)sender {
    [UIView animateWithDuration:0.5f delay:0.0f options:UIViewAnimationCurveLinear|UIViewAnimationOptionCurveEaseInOut animations:^(){
        if (_topView.center.x==320) {
            _topView.center=CGPointMake(0, 22);
        }
        else
            _topView.center=CGPointMake(320, 22);
    }completion:^(BOOL fn){
        
    }];
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = nil;
    
    CellIdentifier=@"NhacDJCell";
    NhacDJCell *cell = (NhacDJCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil) {
        NSArray *nib= [[NSBundle mainBundle]loadNibNamed:CellIdentifier owner:self options:nil];
        cell=[nib objectAtIndex:0];
    }
    
    return cell;
    
    // Configure the cell...
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
        PlayMusicViewController *playView=[[PlayMusicViewController alloc] init];
        [self.navigationController pushViewController:playView animated:YES ];
    
}
-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 101;
}

- (IBAction)changeSegment1:(id)sender {
    kindSegment=0;
    [_tableSong reloadData];
    [_kind1 setImage:[UIImage imageNamed:@"11-moi-nhat-select.png"] forState:UIControlStateNormal];
    [_kind2 setImage:[UIImage imageNamed:@"11-hot-nhat.png"] forState:UIControlStateNormal];
    [_kind3 setImage:[UIImage imageNamed:@"11-noi-bat.png"] forState:UIControlStateNormal];
    
}

- (IBAction)changeSegment2:(id)sender {
    kindSegment=1;
    [_tableSong reloadData];
    [_kind1 setImage:[UIImage imageNamed:@"11-moi-nhat.png"] forState:UIControlStateNormal];
    [_kind2 setImage:[UIImage imageNamed:@"11-hot-nhat-select.png"] forState:UIControlStateNormal];
    [_kind3 setImage:[UIImage imageNamed:@"11-noi-bat.png"] forState:UIControlStateNormal];
}

- (IBAction)changeSegment3:(id)sender {
    kindSegment=2;
    [_tableSong reloadData];
    [_kind1 setImage:[UIImage imageNamed:@"11-moi-nhat.png"] forState:UIControlStateNormal];
    [_kind2 setImage:[UIImage imageNamed:@"11-hot-nhat.png"] forState:UIControlStateNormal];
    [_kind3 setImage:[UIImage imageNamed:@"11-noi-bat-select.png"] forState:UIControlStateNormal];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
}
@end
