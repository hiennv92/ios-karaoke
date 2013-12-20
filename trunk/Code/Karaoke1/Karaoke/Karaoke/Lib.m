//
//  Lib.m
//  Karaoke
//
//  Created by papo on 12/20/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import "Lib.h"

@implementation Lib

+ (BOOL)isIpad
{
    return ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad);
}

+ (BOOL)isIphone
{
    return ![Lib isIpad];
}

+ (BOOL)isIos7
{
    return ([Lib getIosVersion] >= 7.0);
}

+ (float)getIosVersion
{
    return [Lib getIosVersionString].floatValue;
}

+ (NSString*)getIosVersionString
{
    return [[UIDevice currentDevice] systemVersion];
}
@end

