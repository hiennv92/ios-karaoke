//
//  NavibarViewController.h
//  Karaoke
//
//  Created by papo on 12/20/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavibarView.h"


@interface NavibarViewController : UIViewController
@property (nonatomic, strong) NavibarView* navibarView;
@property (nonatomic, strong) UIView*       bottomBarView;

- (void)createNavigationBarWithTitle: (NSString*)title backgroundImage:(NSString*)bgImage leftButton:(NSString*)leftButton leftButtonPress:(NSString*)leftPress rightButton:(NSString*)rightButton rightButtonPress:(NSString*)rightPress;


- (void)setBottomBarViewHidden:(BOOL)hidden;


// action
- (void)leftButtonBarPress:(id)button;
- (void)rightButtonBarPress:(id)button;
- (void)addImageTitle:(NSString*)imageTitleName;

// bottom action
- (void)singerButtonPress:(id)button;
- (void)recordButtonPress:(id)button;
- (void)songButtonPress:(id)button;
- (void)kindMusicButtonPress:(id)button;
- (void)favoriteButtonPress:(id)button;

@end
