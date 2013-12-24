//
//  AppDelegate.h
//  Karaoke
//
//  Created by papo on 12/20/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) RootViewController* viewController;
@property (strong,nonatomic) UINavigationController *navController;

+ (AppDelegate*)shareApplication;
- (void)showLeftPanelWithAnimated:(BOOL)animated;
- (void)showRightPanelWithAnimated:(BOOL)animated;

@end
