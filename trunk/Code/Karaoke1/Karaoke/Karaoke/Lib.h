//
//  Lib.h
//  Karaoke
//
//  Created by papo on 12/20/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Lib : NSObject

+ (BOOL)isIpad;
+ (BOOL)isIphone;
+ (BOOL)isIos7;
+ (float)getIosVersion;
+ (NSString*)getIosVersionString;
@end
