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
    self.navibarView = [NavibarView createWithTitle:title backgroundImage:bgImage leftNormal:leftButton leftHightlight:leftPress rightNormal:rightButton rightHightlight:rightPress target:self leftSelector:@selector(leftButtonBarPress:) rightSelector:@selector(rightButtonBarPress:)];
    self.navibarView.frame = CGRectMake(0, 0, 320, 44);
    [self.view addSubview:_navibarView];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

//Set title image for navigationbar
-(void)addImageTitle:(NSString *)imageTitleName{
    UIImage *img = [UIImage imageNamed:imageTitleName];
    UIImageView *titleImg = [[UIImageView alloc] initWithImage:img];
    titleImg.contentMode = UIViewContentModeCenter;
    titleImg.contentMode = UIViewContentModeScaleAspectFit;
    titleImg.frame = CGRectMake(0, 0, 320, 44);
    [self.view addSubview:titleImg];
}


- (void)leftButtonBarPress:(id)button
{
    NSLog(@"should override this method");
}

- (void)rightButtonBarPress:(id)button
{
    NSLog(@"should override this method");
}


                        

@end
