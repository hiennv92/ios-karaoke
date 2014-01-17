//
//  DankyGoiCuocViewController.m
//  Karaoke
//
//  Created by Trinh Van Duong on 1/17/14.
//  Copyright (c) 2014 banana. All rights reserved.
//

#import "DankyGoiCuocViewController.h"

@interface DankyGoiCuocViewController ()

@end

@implementation DankyGoiCuocViewController

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
    // Do any additional setup after loading the view from its nib.
    [self createNavigationBarWithTitle:Nil backgroundImage:@"bg-top-home.png" leftButton:nil leftButtonPress:Nil rightButton:nil rightButtonPress:Nil andType:1];
    
    [self addTitleNavibar:@"Đăng ký gói cước" andSize:22];
    [self setBottomBarViewHidden:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
