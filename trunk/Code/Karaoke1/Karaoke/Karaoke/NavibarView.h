//
//  NavibarView.h
//  Karaoke
//
//  Created by papo on 12/20/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface NavibarView : UIView <UISearchDisplayDelegate,UISearchBarDelegate>{
    
}

@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


// bottom bar
@property (strong, nonatomic) IBOutlet UIButton*  singerButton;
@property (strong, nonatomic) IBOutlet UIButton*  recordButton;
@property (strong, nonatomic) IBOutlet UIButton*  songButton;
@property (strong, nonatomic) IBOutlet UIButton*  kindMusicButton;
@property (strong, nonatomic) IBOutlet UIButton*  favoriteButton;
//Search bar
@property (strong, nonatomic) IBOutlet UISearchBar *_searchBar;
@property (strong, nonatomic) IBOutlet UIButton *_btnCloseSearchBar;


+ (NavibarView*)viewFromNib;
+ (NavibarView*)createWithTitle:(NSString*)title backgroundImage:(NSString*)backgroundImgae leftNormal:(NSString*)leftNormal leftHightlight:(NSString*)leftHightlight rightNormal:(NSString*)rightNormal rightHightlight:(NSString*)rightHightlight target:(NSObject*)target leftSelector:(SEL)leftSelector rightSelector:(SEL)rightSelector;

+ (NavibarView*)bottomBarWithTarget:(id)target singerAction:(SEL)singerSelector recordAction:(SEL)recordSelector songAction:(SEL)songSelector kindMusicAction:(SEL)kindMusicSelector favoriteAction:(SEL)favoriteSelector;

+(NavibarView *)searchBarWithTarget:(id)target closeBarAction:(SEL)closeSelector;


@end
