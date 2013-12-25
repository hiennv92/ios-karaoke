//
//  PlayKaraClipViewController.m
//  Karaoke
//
//  Created by datkq on 12/25/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import "PlayKaraClipViewController.h"

@interface PlayKaraClipViewController ()

@end

@implementation PlayKaraClipViewController

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
    [self createNavigationBarWithTitle:Nil backgroundImage:@"bg-top-home.png" leftButton:@"menu.png" leftButtonPress:Nil rightButton:nil rightButtonPress:Nil];
    
    [self addTitleNavibar:@"EM SẼ HẠNH PHÚC" andSize:22];
    [self setBottomBarViewHidden:NO];
    [self setSearchBarViewHidden:NO];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)leftButtonBarPress:(id)button{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
