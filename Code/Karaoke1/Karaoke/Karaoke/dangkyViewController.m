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
    [self setBottomBarViewHidden:YES];
    
    [self.sdt setTag:0];
    [self.matkhau setTag:1];
    [self.matkhauRE setTag:2];
}

- (IBAction)dangky:(id)sender {
}

- (IBAction)dangnhaptrolai:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)leftButtonBarPress:(id)button{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if(textField.tag == 0){
        
    }
    else if(textField.tag == 1){
        self._labelPassword.hidden = YES;
    }
    else if (textField.tag == 2){
        self._labelRepassword.hidden = YES;
    }
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    if(textField.tag == 1){
        if([textField.text isEqualToString:@""])
            self._labelPassword.hidden = NO;
    }
    else if(textField.tag == 2){
        if([textField.text isEqualToString:@""])
            self._labelRepassword.hidden = NO;
    }
}

@end
