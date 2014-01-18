//
//  WapKaraViewController.m
//  Karaoke
//
//  Created by papo on 1/18/14.
//  Copyright (c) 2014 banana. All rights reserved.
//

#import "WapKaraViewController.h"

@interface WapKaraViewController ()

@end

@implementation WapKaraViewController

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
    [self createNavigationBarWithTitle:Nil backgroundImage:@"bg-top-home.png" leftButton:@"menu.png" leftButtonPress:Nil rightButton:@"setting.png" rightButtonPress:Nil andType:1];
    
    NSString* mkaraLink = @"http://mkara.vn";
    NSURLRequest* request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:mkaraLink]];
    [self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)leftButtonBarPress:(id)button {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
