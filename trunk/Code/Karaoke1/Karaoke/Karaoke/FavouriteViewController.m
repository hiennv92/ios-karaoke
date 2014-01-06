//
//  FavouriteViewController.m
//  Karaoke
//
//  Created by datkq on 12/25/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import "FavouriteViewController.h"
#import "Cell.h"

@interface FavouriteViewController ()

@end

@implementation FavouriteViewController

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
    
        [self addTitleNavibar:@"KARAOKE YÊU THÍCH" andSize:22];
    [self setBottomBarViewHidden:NO];
    [self setSearchBarViewHidden:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)leftButtonBarPress:(id)button
{
    [[AppDelegate shareApplication] showLeftPanelWithAnimated:YES];
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
    static NSString *CellIdentifier = @"Cell";
    Cell *cell = (Cell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //    static NSString *CellIdentifier = @"Cell";
    //    Cell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //    if (cell == nil) {
    //        cell = [[Cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    //        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    //    }
    if (cell==nil) {
        NSArray *nib= [[NSBundle mainBundle]loadNibNamed:CellIdentifier owner:self options:nil];
        cell=[nib objectAtIndex:0];
    }
    
    
    
    
    
    
    // Configure the cell...
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
