//
//  dangkyViewController.m
//  Karaoke
//
//  Created by datkq on 12/22/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import "dangkyViewController.h"

@interface dangkyViewController ()

@end

@implementation dangkyViewController

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
    [self createNavigationBarWithTitle:Nil backgroundImage:@"bg-top-home.png" leftButton:@"menu.png" leftButtonPress:Nil rightButton:@"setting.png" rightButtonPress:Nil];
    [self addImageTitle:@"logo-banner.png"];
    
    [self setBottomBarViewHidden:NO];
    //    [self.view setBackgroundColor:[UIColor lightGrayColor]];    
}

- (IBAction)dangky:(id)sender {
}

- (IBAction)dangnhaptrolai:(id)sender {
}

- (IBAction)back:(id)sender {
}
@end
