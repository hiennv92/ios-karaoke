//
//  ListSongsOfKindViewController.m
//  Karaoke
//
//  Created by Trinh Van Duong on 12/25/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import "ListSongsOfKindViewController.h"
#import "Cell.h"

@interface ListSongsOfKindViewController (){
    NSMutableArray *_arraySongs;
}

@end

@implementation ListSongsOfKindViewController
@synthesize title;

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
    [self createNavigationBarWithTitle:Nil backgroundImage:@"bg-top-home.png" leftButton:@"back-btn.png" leftButtonPress:Nil rightButton:@"btn-search-top.png" rightButtonPress:Nil];
    [self setBottomBarViewHidden:YES];
    [self addTitleNavibar:self.title andSize:22];
    
    [self._tableViewSongs registerNib:[UINib nibWithNibName:@"Cell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"Cell"];
    CGRect frame = self._tableViewSongs.frame;
    frame.origin.y += 44;
    [self._tableViewSongs setFrame:frame];
}



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
    //return [_arraySongs count];
    return 20;
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
    
//    cell._nameSong.text = (NSString*)[(NSArray*)[_arraySongs objectAtIndex:[indexPath item]] objectAtIndex:0];
//    cell._lyricExample.text = (NSString*)[(NSArray*)[_arraySongs objectAtIndex:[indexPath item]] objectAtIndex:1];
//    cell._numberLikes.text = (NSString*)[(NSArray*)[_arraySongs objectAtIndex:[indexPath item]] objectAtIndex:2];
//    cell._numberPlay.text = (NSString*)[(NSArray*)[_arraySongs objectAtIndex:[indexPath item]] objectAtIndex:3];
    
    return cell;
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"type: %d",[indexPath item]);
}

-(void)leftButtonBarPress:(id)button{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)rightButtonBarPress:(id)button{
    [self showSearchBar:NO];
}

//Close search bar
-(void)closeSearchBarPress:(id)button{
    [self showSearchBar:YES];
}

@end
