//
//  NavibarViewController.m
//  Karaoke
//
//  Created by papo on 12/20/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import "NavibarViewController.h"

@interface NavibarViewController ()

@end

@implementation NavibarViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



// create navigation bar

- (void)createNavigationBarWithTitle:(NSString *)title backgroundImage:(NSString *)bgImage leftButton:(NSString *)leftButton leftButtonPress:(NSString *)leftPress rightButton:(NSString *)rightButton rightButtonPress:(NSString *)rightPress
{
    _navibarView = [[[NSBundle mainBundle] loadNibNamed:@"NavibarView" owner:self options:nil] objectAtIndex:0];
    _navibarView.titleLabel.text = title;
    _navibarView.backgroundImage.image = [UIImage imageNamed:bgImage];
    [_navibarView.leftButton setBackgroundImage:[UIImage imageNamed:leftButton] forState:UIControlStateNormal];
    [_navibarView.leftButton setBackgroundImage:[UIImage imageNamed:leftPress] forState:UIControlStateHighlighted];
    
    [_navibarView.rightButton setBackgroundImage:[UIImage imageNamed:rightButton] forState:UIControlStateNormal];
    [_navibarView.rightButton setBackgroundImage:[UIImage imageNamed:rightPress] forState:UIControlStateHighlighted];
}
@end
