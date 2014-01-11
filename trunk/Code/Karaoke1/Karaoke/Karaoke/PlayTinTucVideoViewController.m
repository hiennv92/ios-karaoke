//
//  PlayTinTucVideoViewController.m
//  Karaoke
//
//  Created by datkq on 1/11/14.
//  Copyright (c) 2014 banana. All rights reserved.
//

#import "PlayTinTucVideoViewController.h"

@interface PlayTinTucVideoViewController ()

@end

@implementation PlayTinTucVideoViewController

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
    
    [self addTitleNavibar:@"CAMERA 360˚" andSize:20];
    [self setBottomBarViewHidden:YES];
    [self setSearchBarViewHidden:YES];
    // Do any additional setup after loading the view from its nib.
    
    
    NSURL*theurl=[[NSBundle mainBundle] URLForResource:@"anh_khong_doi_qua" withExtension:@"mp4"];
    player=[[MPMoviePlayerController alloc] initWithContentURL:theurl];
    [player.view setFrame:CGRectMake(0, 0, 320,210)];
    [player prepareToPlay];
    [player setShouldAutoplay:NO]; // And other options you can look through the documentation.
    [self.playerView addSubview:player.view];
    [self.playerView setUserInteractionEnabled:YES];
    
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
    
    return 180;
    
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"Header"];
//    if (!view) {
    
            view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
            [view setBackgroundColor:[UIColor lightGrayColor]];
            UILabel* title = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, 280, 20)];
            [title setText:@"Nhiều người quan tâm"];
            [title setFont:[UIFont systemFontOfSize:13]];
            [title setTextColor:[UIColor blueColor]];
            [title setBackgroundColor:[UIColor clearColor]];
            [view addSubview:title];
            
            UIImage* image = [UIImage imageNamed:@"logo-trai-tim.png"];
            UIImageView* icon = [[UIImageView alloc] initWithImage:image];
            [icon setFrame:CGRectMake(10, 0, 20, 20)];
            [view addSubview:icon];
        
//    }
    
    return view;
}

- (float)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return 20;
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
    
}
-(void)leftButtonBarPress:(id)button{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
