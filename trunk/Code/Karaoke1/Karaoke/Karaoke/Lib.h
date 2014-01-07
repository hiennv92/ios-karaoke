//
//  Lib.h
//  Karaoke
//
//  Created by papo on 12/20/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

#define kServerUrl  @"http://mkara.vn/"
#define kMediaUrl   @"media"
#define kServiceSingerUrl @"searchsinger"


@interface Lib : NSObject

+ (BOOL)isIpad;
+ (BOOL)isIphone;
+ (BOOL)isIos7;
+ (float)getIosVersion;
+ (NSString*)getIosVersionString;
+ (CGFloat)widthForLabel:(UILabel*)label;
+ (BOOL)isHeadsetPluggedIn;
+ (NSString*)getServiceUrl:(NSString*)url;
+ (NSString*)getMediaUrl:(NSString*)url;
+ (void)showLoadingOnView:(UIView*)aView withText:(NSString*)text;
+ (void)removeLoadingOnView:(UIView*)superView;
+ (void)updateLoadingViewOn:(UIView *)superView withText:(NSString*)text;
@end
