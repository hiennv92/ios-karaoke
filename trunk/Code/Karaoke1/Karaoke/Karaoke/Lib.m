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

+ (float)widthForLabel:(UILabel *)label
{
    CGFloat strikeWidth;
    if ([Lib isIos7]) {
        CGSize textSize = [[label text] sizeWithAttributes:@{NSFontAttributeName:[label font]}];
        
        strikeWidth  = textSize.width;
    }
    else
    {
        CGSize textSize = [[label text] sizeWithFont:[label font]];
        
        strikeWidth = textSize.width;
    }
    return strikeWidth;
}

+(BOOL)isHeadsetPluggedIn {
    UInt32 routeSize = sizeof (CFStringRef); CFStringRef route;
    AudioSessionGetProperty (kAudioSessionProperty_AudioRoute, &routeSize, &route);
    
    NSString* routeStr = (NSString*)CFBridgingRelease(route);
    
    NSRange headsetRange = [routeStr rangeOfString : @"Headset"];
    NSRange receiverRange = [routeStr rangeOfString : @"Receiver"];
    
    if(headsetRange.location != NSNotFound) {
        // Don't change the route if the headset is plugged in.
        NSLog(@"headphone is plugged in ");
        return YES;
    }
    else if (receiverRange.location != NSNotFound) {
        // Change to play on the speaker
        NSLog(@"play on the speaker");
        
        UInt32 audioRouteOverride = kAudioSessionOverrideAudioRoute_Speaker;
        AudioSessionSetProperty (kAudioSessionProperty_OverrideAudioRoute,sizeof (audioRouteOverride),&audioRouteOverride);
        return NO;
    } else {
        NSLog(@"Unknown audio route.");
        UInt32 audioRouteOverride = kAudioSessionOverrideAudioRoute_Speaker;
        AudioSessionSetProperty (kAudioSessionProperty_OverrideAudioRoute,sizeof (audioRouteOverride),&audioRouteOverride);
        return NO;
    }
}


+ (NSString*)getServiceUrl:(NSString *)url
{
    return [NSString stringWithFormat:@"%@%@", kServerUrl, url];
}
@end

