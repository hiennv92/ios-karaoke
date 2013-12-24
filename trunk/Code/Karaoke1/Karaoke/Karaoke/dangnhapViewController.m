//
//  dangnhapViewController.m
//  Karaoke
//
//  Created by datkq on 12/23/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import "dangnhapViewController.h"

@interface dangnhapViewController ()

@end

@implementation dangnhapViewController

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
    [self createNavigationBarWithTitle:Nil backgroundImage:@"bg-top-home.png" leftButton:@"back-btn.png" leftButtonPress:Nil rightButton:Nil rightButtonPress:Nil];
    [self addTitleNavibar:@"Đăng nhập" andSize:22];
    [self setBottomBarViewHidden:YES];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

//Back to menu
-(void)leftButtonBarPress:(id)button{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)luuMk:(id)sender {
}

- (IBAction)quenMk:(id)sender {
}

- (IBAction)dangNhap:(id)sender {
}

- (IBAction)dangky:(id)sender {
    
}
@end
