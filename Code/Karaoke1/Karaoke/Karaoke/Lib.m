//
//  Lib.m
//  Karaoke
//
//  Created by papo on 12/20/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import "Lib.h"
#import "Song.h"

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

+ (CGSize)sizeForLabel:(UILabel *)label
{
    CGSize textSize;
    if ([Lib isIos7]) {
         textSize = [[label text] sizeWithAttributes:@{NSFontAttributeName:[label font]}];
    }
    else
    {
        textSize = [[label text] sizeWithFont:[label font]];
    }
    return textSize;
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
    return [NSString stringWithFormat:@"%@%@%@", kServerUrl, @"mapi/", url];
}

+ (NSString*)getMediaUrl:(NSString *)url
{
    return [NSString stringWithFormat:@"%@%@%@", kServerUrl, kMediaUrl, url];
}

+ (void)showLoadingOnView:(UIView *)aView withText:(NSString *)text
{
    UIView *loadingView = [[UIView alloc] init];
	loadingView.frame = CGRectMake(0, 0, aView.bounds.size.width, aView.bounds.size.height + 40);
	loadingView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.3];
	loadingView.tag = 1011;
	UILabel *loadingLabel = [[UILabel alloc ] init];
	
	UIView* roundedView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 80)];
	roundedView.center = CGPointMake(loadingView.frame.size.width/2, loadingView.frame.size.height/2);
	roundedView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
	roundedView.layer.borderColor = [UIColor clearColor].CGColor;
	roundedView.layer.borderWidth = 1.0;
	roundedView.layer.cornerRadius = 10.0;
	[loadingView addSubview:roundedView];
	
	loadingLabel.text = text;
	loadingLabel.frame = CGRectMake(roundedView.frame.origin.x, roundedView.frame.origin.y + 50, 200, 30);
	//loadingLabel.adjustsFontSizeToFitWidth = YES;
	loadingLabel.textAlignment = NSTextAlignmentCenter;
	loadingLabel.font = [UIFont boldSystemFontOfSize:14];
	loadingLabel.backgroundColor = [UIColor clearColor];
	loadingLabel.textColor = [UIColor whiteColor];
    loadingLabel.tag = 1012;
	[loadingView addSubview:loadingLabel];
	
	UIActivityIndicatorView *activityIndication = [[UIActivityIndicatorView alloc] init];
	activityIndication.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
	activityIndication.frame = CGRectMake((loadingView.frame.size.width - 30)/2,
										  roundedView.frame.origin.y + 15,
										  30,
										  30);
	
	//	NSLog(@"%@",activityIndication);
	[activityIndication startAnimating];
	[loadingView addSubview:activityIndication];
	
	//	[activityIndication release];
	[aView addSubview:loadingView];
}

+ (void)removeLoadingOnView:(UIView *)superView
{
    for (UIView *aView in superView.subviews) {
		if ((aView.tag == 1011)  && [aView isKindOfClass:[UIView class]]) {
			[aView removeFromSuperview];
		}
	}
}

+ (void)updateLoadingViewOn:(UIView *)superView withText:(NSString*)text{
	for (UIView *aView in superView.subviews) {
		if ((aView.tag == 1012)  && [aView isKindOfClass:[UILabel class]]) {
			[(UILabel*)aView setText:text];
		}
	}
}

+ (void)setValue:(NSString *)value forKey:(NSString *)key
{
    NSUserDefaults* user = [NSUserDefaults standardUserDefaults];
    [user setValue:value forKey:key];
    [user synchronize];
}

+ (NSString*)getValueForKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] stringForKey:key];
}

+ (NSDate*)dateFromString:(NSString *)date withFormat:(NSString *)format {
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:format];
    NSLog(@"date: %@ format: %@ date: %@", [formater dateFromString:date], format, date);
    return [formater dateFromString:date];
}

+ (NSString*)stringFromDate:(NSDate *)date withFormat:(NSString *)format {
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:format];
    NSLog(@"datestrinG: %@", [formater stringFromDate:date]);
    return [formater stringFromDate:date];
}

+ (NSString*)convertDateString:(NSString *)date old:(NSString *)oldFormat withNewFormat:(NSString *)newFormat {
    return [Lib stringFromDate:[Lib dateFromString:date withFormat:oldFormat] withFormat:newFormat];
}


//Get all song
+ (NSMutableArray *)getAllSongs{
    NSMutableArray *arraySongs;
    arraySongs = [[NSMutableArray alloc] init];
    
    NSString *retValSong= [ServiceLib sendGetRequest:[Lib getServiceUrl:kServiceSongUrl]];
    SBJsonParser* parserSong = [[SBJsonParser alloc] init];
    id dataSong = [parserSong objectWithString:retValSong];
    if (dataSong && [dataSong isKindOfClass:[NSDictionary class]]) {
        NSString* message = [dataSong objectForKey:@"message"];
        NSString* error = [dataSong objectForKey:@"error"];
        id result = [dataSong objectForKey:@"result"];
        if (error.integerValue == 0) { // success!
            NSArray* items = [result objectForKey:@"items"];
            if (items) {
                for (id song in items) {
                    Song *s = [Song songFromDictionary:song];
                    [arraySongs addObject:s];
                }
            }
        }
        else{
            NSLog(@"error: %@ message: %@", error, message);
        }
    }
    
    return arraySongs;
}

@end

