//
//  MostVotedViewController.m
//  Karaoke
//
//  Created by datkq on 1/17/14.
//  Copyright (c) 2014 banana. All rights reserved.
//

#import "MostVotedViewController.h"

@interface MostVotedViewController ()

@end

@implementation MostVotedViewController

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
    [self createNavigationBarWithTitle:Nil backgroundImage:@"bg-top-home.png" leftButton:@"menu.png" leftButtonPress:Nil rightButton:nil rightButtonPress:Nil andType:1];
    
    [self addTitleNavibar:@"THU ÂM ĐƯỢC BÌNH CHỌN NHIỀU NHẤT" andSize:22];
    [self setBottomBarViewHidden:YES];
    [self setSearchBarViewHidden:YES];
}
- (void)leftButtonBarPress:(id)button
{
    [[AppDelegate shareApplication] showLeftPanelWithAnimated:YES];
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
    
    return 20;
    
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 98;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = nil;
    CellIdentifier=@"MostVotedCell";
    MostVotedCell *cell = (MostVotedCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil) {
        NSArray *nib= [[NSBundle mainBundle]loadNibNamed:CellIdentifier owner:self options:nil];
        cell=[nib objectAtIndex:0];
    }
//    cell.title.text=@"Hồ Ngọc Hà gợi cảm với...";
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    PlayMostVotedViewController *next= [[PlayMostVotedViewController alloc] init];
    [self.navigationController pushViewController:next animated:YES];
}

@end
