//
//  TinTucVideoViewController.m
//  Karaoke
//
//  Created by datkq on 1/11/14.
//  Copyright (c) 2014 banana. All rights reserved.
//

#import "TinTucVideoViewController.h"

@interface TinTucVideoViewController ()

@end

@implementation TinTucVideoViewController

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
    
    [self addTitleNavibar:@"Tin Tức Video" andSize:20];
    [self setBottomBarViewHidden:NO];
    [self setSearchBarViewHidden:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeSegment1:(id)sender {
}

- (IBAction)changeSegment2:(id)sender {
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
    
    return 220;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = nil;
    CellIdentifier=@"TinTucVideoCell";
    TinTucVideoCell *cell = (TinTucVideoCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil) {
        NSArray *nib= [[NSBundle mainBundle]loadNibNamed:CellIdentifier owner:self options:nil];
        cell=[nib objectAtIndex:0];
    }
    cell.title.text=@"Hồ Ngọc Hà gợi cảm với...";
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    PlayTinTucVideoViewController *playTinTuc= [[PlayTinTucVideoViewController alloc] init];
    [self.navigationController pushViewController:playTinTuc animated:YES];
}
-(void)leftButtonBarPress:(id)button{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
