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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
- (IBAction)back:(id)sender {
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
