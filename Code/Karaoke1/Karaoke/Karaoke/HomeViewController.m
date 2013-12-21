//
//  HomeViewController.m
//  Karaoke
//
//  Created by papo on 12/20/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController
@synthesize __bottomBarView;
@synthesize __scrollViewContent;

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
    [self createNavigationBarWithTitle:Nil backgroundImage:@"bg-top-home.png" leftButton:Nil leftButtonPress:Nil rightButton:Nil rightButtonPress:Nil];
    [self addImageTitle:@"logo-banner.png"];
    self.__bottomBarView.frame = CGRectMake(0, self.view.frame.size.height-44, 320, 44);
//    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    
    [self loadViewContent];
}

-(void)loadViewContent{
    [self.__scrollViewContent setFrame:CGRectMake(0, 44, 320, self.view.frame.size.height- 2*44)];
    [self.__scrollViewContent setContentSize:CGSizeMake(320, 1300)];
    [self.view addSubview:self.__scrollViewContent];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)leftButtonBarPress:(id)button
{
    
}

- (void)rightButtonBarPress:(id)button
{
    
}
- (IBAction)singerButtonController:(id)sender {
}

- (IBAction)songButtonController:(id)sender {
}

- (IBAction)kindMusicButtonController:(id)sender {
}

- (IBAction)favoriteButtonController:(id)sender {
}

- (IBAction)recordButtonController:(id)sender {
}
@end
