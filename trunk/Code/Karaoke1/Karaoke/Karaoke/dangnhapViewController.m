//
//  dangnhapViewController.m
//  Karaoke
//
//  Created by datkq on 12/23/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import "dangnhapViewController.h"
#import "dangkyViewController.h"
#import "ForgetPasswordViewController.h"

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
    
    [self._fieldSDT setTag:0];
    [self._fieldPassword setTag:1];
    [self._fieldPassword setSecureTextEntry:YES];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if(textField.tag == 0){
        self._labelNumberPhone.hidden = YES;
    }
    else if(textField.tag == 1){
        self._labelPass.hidden = YES;
    }
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    if(textField.tag == 0){
        if([textField.text isEqualToString:@""])
            self._labelNumberPhone.hidden = NO;
    }
    else if(textField.tag == 1){
        if([textField.text isEqualToString:@""])
            self._labelPass.hidden = NO;
    }
}


//Back to menu
-(void)leftButtonBarPress:(id)button{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)luuMk:(id)sender {
}

- (IBAction)quenMk:(id)sender {
    ForgetPasswordViewController *forgetPasswordView = [[ForgetPasswordViewController alloc] initWithNibName:@"ForgetPasswordViewController" bundle:nil];
    [self.navigationController pushViewController:forgetPasswordView animated:YES];
}

- (IBAction)dangNhap:(id)sender {
}

- (IBAction)dangky:(id)sender {
    dangkyViewController *dk=[[dangkyViewController alloc] init];
    [self.navigationController pushViewController:dk animated:YES];
}
@end
