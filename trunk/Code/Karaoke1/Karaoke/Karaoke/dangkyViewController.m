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
    [self createNavigationBarWithTitle:Nil backgroundImage:@"bg-top-home.png" leftButton:@"back-btn.png" leftButtonPress:Nil rightButton:nil rightButtonPress:Nil];
  
    [self addTitleNavibar:@"Đăng ký" andSize:22];
    
    [self setBottomBarViewHidden:NO];
    //    [self.view setBackgroundColor:[UIColor lightGrayColor]];    
}

- (IBAction)dangky:(id)sender {
}

- (IBAction)dangnhaptrolai:(id)sender {
}

-(void)leftButtonBarPress:(id)button{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
