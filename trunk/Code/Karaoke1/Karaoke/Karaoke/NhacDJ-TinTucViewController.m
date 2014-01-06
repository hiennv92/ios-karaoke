//
//  NhacDJ-TinTucViewController.m
//  Karaoke
//
//  Created by datkq on 1/6/14.
//  Copyright (c) 2014 banana. All rights reserved.
//

#import "NhacDJ-TinTucViewController.h"
#import "PlayMusicViewController.h"

@interface NhacDJ_TinTucViewController ()

@end

@implementation NhacDJ_TinTucViewController
//
//- (id)initWithTypeSegment:(int)type
//{
//    self = [super init];
//    if (self) {
//        // Custom initialization
//    }
//    kindSegment=type;
//    return self;
//}

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
    [self setBottomBarViewHidden:YES];
    [self setSearchBarViewHidden:YES];
    
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)menu:(id)sender {
}

- (IBAction)search:(id)sender {
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
    if (kindSegment==3) {
        PlayMusicViewController *playView=[[PlayMusicViewController alloc] init];
        [self.navigationController pushViewController:playView animated:YES ];
    }
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

@end
