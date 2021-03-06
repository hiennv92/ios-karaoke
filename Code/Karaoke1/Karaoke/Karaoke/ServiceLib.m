
//
//  ServiceLib.m
//  SOS
//
//  Created by Toan M. Ha on 2/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ServiceLib.h"
#import "Lib.h"

static ServiceLib* serviceLib;
@implementation ServiceLib

+(ServiceLib*)shareInstance {
	if (!serviceLib) {
		serviceLib = [[ServiceLib alloc] init];
	}
	return serviceLib;
}

+(NSString*)sendGetRequest:(NSString*)strURL {
	NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[strURL stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]] ];
	[theRequest setHTTPMethod:@"GET"];
//    [theRequest setCachePolicy:NSURLCacheStorageAllowed];
    NSError* error;
	NSData* responeData = [NSURLConnection sendSynchronousRequest:theRequest returningResponse:nil error:&error];		
	NSString *string = [[NSString alloc] initWithData:responeData encoding:NSUTF8StringEncoding];	
	return string;	
}

+(NSString*)sendPostRequest:(NSMutableDictionary*)params andUrl:(NSString*)strURL {
	NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[strURL stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]]];
	
	[theRequest setHTTPMethod:@"POST"];
	
	NSString* paramStr = @"";
	
	if (params) {
		NSEnumerator *keys = [params keyEnumerator];
		
		for (int i = 0; i < [params count]; i++) {
			NSString *key = [keys nextObject];
			NSString *val = [params objectForKey:key];
			paramStr = [NSString stringWithFormat:@"%@&%@=%@",paramStr,key,val];
//            NSLog(@"%@", paramStr);
		}
	}
	
	if (paramStr.length > 0) {
		NSData* requestData = [paramStr dataUsingEncoding:NSUTF8StringEncoding];
		NSString* requestDataLengthString = [NSString stringWithFormat:@"%d", [requestData length]];
		[theRequest setHTTPBody: requestData];
		[theRequest setValue:requestDataLengthString forHTTPHeaderField:@"Content-Length"];		
	}
	
	NSData* responeData = [NSURLConnection sendSynchronousRequest:theRequest returningResponse:nil error:nil];	
	
	NSString *string = [[NSString alloc] initWithData:responeData encoding:NSUTF8StringEncoding];
//	NSLog(@"%@",string);
	return string;
}

+ (BOOL)sendVerifyRequest {
    
}

+ (NSString*)sendLoginRequest {
    
}

+ (NSString*)sendLogoutRequest {
    
}

@end
