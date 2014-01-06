//
//  ForgetPasswordViewController.m
//  Karaoke
//
//  Created by Trinh Van Duong on 12/25/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import "ForgetPasswordViewController.h"

@interface ForgetPasswordViewController ()

@end

@implementation ForgetPasswordViewController

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
    [self createNavigationBarWithTitle:Nil backgroundImage:@"bg-top-home.png" leftButton:@"back-btn.png" leftButtonPress:Nil rightButton:nil rightButtonPress:Nil andType:1];
    [self addTitleNavibar:@"Quên mật khẩu" andSize:22];
    [self setBottomBarViewHidden:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

-(void)leftButtonBarPress:(id)button{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)getPassWordController:(id)sender {
}

- (IBAction)LoginReturn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
