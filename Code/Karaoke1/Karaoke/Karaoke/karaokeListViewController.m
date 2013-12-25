//
//  karaokeListViewController.m
//  Karaoke
//
//  Created by datkq on 12/23/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import "karaokeListViewController.h"

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
    // Do any additional setup after loading the view from its nib.
//    [self createNavigationBarWithTitle:Nil backgroundImage:@"bg-top-home.png" leftButton:@"back-btn.png" leftButtonPress:Nil rightButton:@"btn-search-top.png" rightButtonPress:Nil];
    
//    [self addTitleNavibar:@"KARAOKE" andSize:22];
    [self setBottomBarViewHidden:NO];
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
    static NSString *CellIdentifier = @"karaokeListCell";
    karaokeListCell *cell = (karaokeListCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
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

-(IBAction)leftButtonBarPress:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}


-(IBAction)rightButtonBarPress:(id)sender{
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionTransitionNone|UIViewAnimationOptionCurveEaseInOut animations:^(){
        _searchView.center=CGPointMake(self.view.bounds.size.width/2, _searchView.center.y);
    }completion:^(BOOL fn){
        
    }];
}
-(IBAction)closeSearch:(id)sender{
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionTransitionNone|UIViewAnimationOptionCurveEaseInOut animations:^(){
        _searchView.center=CGPointMake(3*self.view.bounds.size.width/2, _searchView.center.y);
    }completion:^(BOOL fn){
        
    }];
}

@end
