//
//  Lib.h
//  Karaoke
//
//  Created by papo on 12/20/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "ServiceLib.h"

#define kServerUrl  @"http://mkara.vn/"
#define kMediaUrl   @"media"

// API url
#define kServiceSingerUrl @"searchsinger"
#define kServiceSongUrl @"searchsong"

// key
#define kTokenKey   @"token"


@interface Lib : NSObject

+ (BOOL)isIpad;
+ (BOOL)isIphone;
+ (BOOL)isIos7;
+ (float)getIosVersion;
+ (NSString*)getIosVersionString;
+ (CGSize)sizeForLabel:(UILabel*)label;
+ (BOOL)isHeadsetPluggedIn;
+ (NSString*)getServiceUrl:(NSString*)url;
+ (NSString*)getMediaUrl:(NSString*)url;
+ (void)showLoadingOnView:(UIView*)aView withText:(NSString*)text;
+ (void)removeLoadingOnView:(UIView*)superView;
+ (void)updateLoadingViewOn:(UIView *)superView withText:(NSString*)text;

+ (void)setValue:(NSString*)value forKey:(NSString *)key;
+ (NSString*)getValueForKey:(NSString*)key;
+ (NSDate*)dateFromString:(NSString*)date withFormat:(NSString*)format;
+ (NSString*)stringFromDate:(NSDate*)date withFormat:(NSString*)format;
+ (NSString*)convertDateString:(NSString*)date old:(NSString*)oldFormat withNewFormat:(NSString*)newFormat;

+ (NSMutableArray *)getAllSongs;

@end
