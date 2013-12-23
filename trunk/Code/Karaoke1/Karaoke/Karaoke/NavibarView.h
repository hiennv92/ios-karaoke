//
//  NavibarView.h
//  Karaoke
//
//  Created by papo on 12/20/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface NavibarView : UIView
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


+ (NavibarView*)viewFromNib;
+ (NavibarView*)createWithTitle:(NSString*)title backgroundImage:(NSString*)backgroundImgae leftNormal:(NSString*)leftNormal leftHightlight:(NSString*)leftHightlight rightNormal:(NSString*)rightNormal rightHightlight:(NSString*)rightHightlight target:(NSObject*)target leftSelector:(SEL)leftSelector rightSelector:(SEL)rightSelector;
@end
