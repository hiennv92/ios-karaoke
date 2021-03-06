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

- (void)createNavigationBarWithTitle:(NSString *)title backgroundImage:(NSString *)bgImage leftButton:(NSString *)leftButton leftButtonPress:(NSString *)leftPress rightButton:(NSString *)rightButton rightButtonPress:(NSString *)rightPress andType:(int)type
{
    self.navibarView = [NavibarView createWithTitle:title backgroundImage:bgImage leftNormal:leftButton leftHightlight:leftPress rightNormal:rightButton rightHightlight:rightPress target:self leftSelector:@selector(leftButtonBarPress:) rightSelector:@selector(rightButtonBarPress:)];
    if(type == 1){
        self.navibarView.frame = CGRectMake(0, 0, 320, 44);

        CGRect frame = self.navibarView.leftButton.frame;
        frame.origin.y = 6;
        self.navibarView.leftButton.frame = frame;
        
        frame = self.navibarView.rightButton.frame;
        frame.origin.y = 6;
        self.navibarView.rightButton.frame = frame;
        
        frame = self.navibarView.titleLabel.frame;
        frame.origin.y = 0;
        self.navibarView.titleLabel.frame = frame;
    }    
    else{
        self.navibarView.frame = CGRectMake(0, 0, 320, 88);
        CGRect frame = self.navibarView.leftButton.frame;
        frame.origin.y = 6;
        self.navibarView.leftButton.frame = frame;
        
        frame = self.navibarView.rightButton.frame;
        frame.origin.y = 6;
        self.navibarView.rightButton.frame = frame;

        frame = self.navibarView.titleLabel.frame;
        frame.origin.y = 0;
        self.navibarView.titleLabel.frame = frame;

        frame = self.navibarView.backgroundImage.frame;
        frame.size.height = 88;
        self.navibarView.backgroundImage.frame = frame;
    }
    
    [self.view addSubview:_navibarView];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    [self createSearchBar:type];
}

- (void)createSearchBar:(int)type{
    //Create search bar
    self.searchBarView = [NavibarView searchBarWithTarget:self closeBarAction:@selector(closeSearchBarPress:)];
    if(type == 1)
        [self.searchBarView setFrame:CGRectMake(320,0,320,44)];
    else
        [self.searchBarView setFrame:CGRectMake(320,0,320,88)];
    
    [self.searchBarView setHidden: YES];
    [self.view addSubview:self.searchBarView];
    
    ((NavibarView*)self.searchBarView)._searchBar.delegate = self;
}

//
- (void)setBottomBarViewHidden:(BOOL)hidden
{
    self.bottomBarView.hidden = hidden;
}

//
- (void)setSearchBarViewHidden:(BOOL)hidden{
    self.searchBarView.hidden = hidden;
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
    self.navibarView.titleLabel.text = stringTitle;
    self.navibarView.titleLabel.textAlignment = UITextAlignmentCenter;
    self.navibarView.titleLabel.textColor = [UIColor whiteColor];
    [self.navibarView.titleLabel setFont:[UIFont boldSystemFontOfSize:size]];
}

//Show search bar
-(void)showSearchBar:(BOOL)hidden{
    if(hidden){
        self.navibarView.hidden = !hidden;
        [UIView animateWithDuration:0.5 animations:^{
            CGRect frame = self.navibarView.frame;
            frame.origin.x = 0;
            [self.navibarView setFrame: frame];
            frame = self.searchBarView.frame;
            frame.origin.x = 320;
            [self.searchBarView setFrame:frame];
        } completion:^(BOOL finished) {
            [self setSearchBarViewHidden:hidden];
        }];
    }
    else{
        [self setSearchBarViewHidden:hidden];
        [UIView animateWithDuration:0.5 animations:^{
            CGRect frame = self.navibarView.frame;
            frame.origin.x = -320;
            [self.navibarView setFrame: frame];
            frame = self.searchBarView.frame;
            frame.origin.x = 0;
            [self.searchBarView setFrame:frame];
        } completion:^(BOOL finished) {
            self.navibarView.hidden = !hidden;
        }];
    }
    
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
    NSLog(@"Record");
}

- (void)kindMusicButtonPress:(id)button
{
    NSLog(@"Kind music");
}

- (void)songButtonPress:(id)button
{
    NSLog(@"List song");
}

- (void)favoriteButtonPress:(id)button
{
    NSLog(@"Favorite");
}

- (void)closeSearchBarPress:(id)button{
    NSLog(@"Close search bar");
}



@end
