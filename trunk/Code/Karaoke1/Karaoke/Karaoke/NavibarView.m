//
//  NavibarView.m
//  Karaoke
//
//  Created by papo on 12/20/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import "NavibarView.h"

@implementation NavibarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

+ (NavibarView*)viewFromNib
{
    return [[[NSBundle mainBundle] loadNibNamed:@"NavibarView" owner:self options:nil] objectAtIndex:0];
}

+ (NavibarView*)createWithTitle:(NSString *)title backgroundImage:(NSString *)backgroundImgae leftNormal:(NSString *)leftNormal leftHightlight:(NSString *)leftHightlight rightNormal:(NSString *)rightNormal rightHightlight:(NSString *)rightHightlight target:(NSObject *)target leftSelector:(SEL)leftSelector rightSelector:(SEL)rightSelector
{
    NavibarView* navi = [NavibarView viewFromNib];
    if (backgroundImgae && backgroundImgae.length > 0) {
        navi.backgroundImage.image = [UIImage imageNamed:backgroundImgae];
    }
    
    if (title) {
        [navi.titleLabel setText:title];
    }
    
    if (leftNormal && leftNormal.length > 0) {
        [navi.leftButton setBackgroundImage:[UIImage imageNamed:leftNormal] forState:UIControlStateNormal];
        [navi.leftButton setHidden:NO];
        
        if (leftHightlight && leftHightlight.length > 0) {
            [navi.leftButton setBackgroundImage:[UIImage imageNamed:leftHightlight] forState:UIControlStateHighlighted];
        }
        
        if (target && leftSelector) {
            [navi.leftButton addTarget:target action:leftSelector forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
    if (rightNormal && rightNormal.length > 0) {
        [navi.rightButton setBackgroundImage:[UIImage imageNamed:rightNormal] forState:UIControlStateNormal];
        [navi.rightButton setHidden:NO];
        
        if (rightHightlight && rightHightlight.length > 0) {
            [navi.rightButton setBackgroundImage:[UIImage imageNamed:rightHightlight] forState:UIControlStateHighlighted];
        }
        
        if (target && rightSelector) {
            [navi.rightButton addTarget:target action:rightSelector forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
    return navi;
}

+ (NavibarView*)bottomBarWithTarget:(id)target singerAction:(SEL)singerSelector recordAction:(SEL)recordSelector songAction:(SEL)songSelector kindMusicAction:(SEL)kindMusicSelector favoriteAction:(SEL)favoriteSelector
{
    NavibarView* bottom = (NavibarView*)[[[NSBundle mainBundle] loadNibNamed:@"NavibarView" owner:self options:Nil] objectAtIndex:1];
    [bottom.singerButton addTarget:target action:singerSelector forControlEvents:UIControlEventTouchUpInside];
    [bottom.recordButton addTarget:target action:recordSelector forControlEvents:UIControlEventTouchUpInside];
    [bottom.songButton addTarget:target action:songSelector forControlEvents:UIControlEventTouchUpInside];
    [bottom.kindMusicButton addTarget:target action:kindMusicSelector forControlEvents:UIControlEventTouchUpInside];
    [bottom.favoriteButton addTarget:target action:favoriteSelector forControlEvents:UIControlEventTouchUpInside];
    
    
    return bottom;
}

+ (NavibarView*)searchBarWithTarget:(id)target closeBarAction:(SEL)closeSelector{
    NavibarView* search= (NavibarView*)[[[NSBundle mainBundle] loadNibNamed:@"NavibarView" owner:self options:Nil] objectAtIndex:2];
    [search.searchButton addTarget:target action:closeSelector forControlEvents:UIControlEventTouchUpInside];
    return  search;
}

@end
