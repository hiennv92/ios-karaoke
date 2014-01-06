//
//  NavibarViewController.h
//  Karaoke
//
//  Created by papo on 12/20/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavibarView.h"


@interface NavibarViewController : UIViewController <UISearchBarDelegate,UISearchDisplayDelegate>{
    
}
@property (nonatomic, strong) NavibarView* navibarView;
@property (nonatomic, strong) UIView*       bottomBarView;
@property (nonatomic, strong) UIView*   searchBarView;

- (void)createNavigationBarWithTitle: (NSString*)title backgroundImage:(NSString*)bgImage leftButton:(NSString*)leftButton leftButtonPress:(NSString*)leftPress rightButton:(NSString*)rightButton rightButtonPress:(NSString*)rightPress andType:(int)type;

- (void)setBottomBarViewHidden:(BOOL)hidden;
- (void)setSearchBarViewHidden:(BOOL)hidden;
- (void)addImageTitle:(NSString*)imageTitleName;
- (void)addTitleNavibar:(NSString*)stringTitle andSize:(int)size;
- (void)showSearchBar:(BOOL)hidden;

// action
- (void)leftButtonBarPress:(id)button;
- (void)rightButtonBarPress:(id)button;

// bottom action
- (void)singerButtonPress:(id)button;
- (void)recordButtonPress:(id)button;
- (void)songButtonPress:(id)button;
- (void)kindMusicButtonPress:(id)button;
- (void)favoriteButtonPress:(id)button;

// Search action
- (void)closeSearchBarPress:(id)button;

@end
