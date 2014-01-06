//
//  KindOfMusicViewController.m
//  Karaoke
//
//  Created by Trinh Van Duong on 12/24/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import "KindOfMusicViewController.h"
#import "ListSongsOfKindViewController.h"
#import "AppDelegate.h"
#import "Cell.h"
#import "CellOfKind.h"

@interface KindOfMusicViewController (){
    NSMutableArray* _dataKinds;
}

@end

@implementation KindOfMusicViewController

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
    [self createNavigationBarWithTitle:Nil backgroundImage:@"bg-top-home.png" leftButton:@"menu.png" leftButtonPress:Nil rightButton:Nil rightButtonPress:Nil andType:1];
    [self addTitleNavibar:@"Thể loại" andSize:22];
    [self setBottomBarViewHidden:YES];
    
    [self._tableView registerNib:[UINib nibWithNibName:@"CellOfKind" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"CellOfKind"];
    CGRect frame = self._tableView.frame;
    frame.origin.y += 44;
    [self._tableView setFrame:frame];
  
    NSArray *kind1 = [[NSArray alloc] initWithObjects:@"Pop music",@"1000", nil];
    NSArray *kind2 = [[NSArray alloc] initWithObjects:@"Acoustic music",@"2000", nil];
    NSArray *kind3 = [[NSArray alloc] initWithObjects:@"Ballad music",@"3000", nil];
    NSArray *kind4 = [[NSArray alloc] initWithObjects:@"Classical music",@"4000", nil];
    NSArray *kind5 = [[NSArray alloc] initWithObjects:@"Rock music",@"5000", nil];
    
    _dataKinds = [[NSMutableArray alloc] initWithObjects:kind1,kind2,kind3,kind4,kind5, nil];
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
    return [_dataKinds count];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell setBackgroundColor:[UIColor clearColor]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellOfKind";
    CellOfKind *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[CellOfKind alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    cell._nameOfKind.text = (NSString*)[(NSArray*)[_dataKinds objectAtIndex:[indexPath item]] objectAtIndex:0];

    cell._numberSongOfKind.text = [NSString stringWithFormat:@"%@ bài",(NSString*)[(NSArray*)[_dataKinds objectAtIndex:[indexPath item]] objectAtIndex:1]];
    return cell;
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"type: %d",[indexPath item]);
    ListSongsOfKindViewController *listSongs = [[ListSongsOfKindViewController alloc]initWithNibName:@"ListSongsOfKindViewController" bundle:Nil];
    [self.navigationController pushViewController:listSongs animated:YES];
    listSongs.title = (NSString*)[(NSArray*)[_dataKinds objectAtIndex:[indexPath item]] objectAtIndex:0];
}

- (void)leftButtonBarPress:(id)button{
    [self.navigationController popToRootViewControllerAnimated:YES];
    [((AppDelegate*)[[UIApplication sharedApplication]delegate]).viewController showCenterPanelAnimated:NO];
}

@end
