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
    
    // create bottom bar
    self.bottomBarView = [NavibarView bottomBarWithTarget:self singerAction:@selector(singerButtonPress:) recordAction:@selector(recordButtonPress:) songAction:@selector(songButtonPress:) kindMusicAction:@selector(kindMusicButtonPress:) favoriteAction:@selector(favoriteButtonPress:)];
    [self.bottomBarView setFrame:CGRectMake(0, self.view.frame.size.height - self.bottomBarView.frame.size.height, self.bottomBarView.frame.size.width, self.bottomBarView.frame.size.height)];
    [self.bottomBarView setHidden:YES];
    [self.view addSubview:_bottomBarView];
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

//
- (void)setBottomBarViewHidden:(BOOL)hidden
{
    self.bottomBarView.hidden = hidden;
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

//Set title text for navigationbar
-(void)addTitleNavibar:(NSString*)stringTitle andSize:(int)size{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    label.text = stringTitle;
    label.textAlignment = UITextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    [label setFont:[UIFont systemFontOfSize:size]];

    [self.view addSubview:label];
}


- (void)leftButtonBarPress:(id)button
{
    NSLog(@"should override this method");
}

- (void)rightButtonBarPress:(id)button
{
    NSLog(@"should override this method");
}

- (void)singerButtonPress:(id)button
{
    NSLog(@"singer button press");
}

- (void)recordButtonPress:(id)button
{
    
}

- (void)kindMusicButtonPress:(id)button
{
    
}

- (void)songButtonPress:(id)button
{
    
}

- (void)favoriteButtonPress:(id)button
{
    
}
@end
