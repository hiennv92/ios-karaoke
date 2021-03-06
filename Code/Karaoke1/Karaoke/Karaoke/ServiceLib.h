//
//  ServiceLib.h
//  SOS
//
//  Created by Toan M. Ha on 2/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBJson.h"

@interface ServiceLib : NSObject {
    
}

+ (NSString*)sendPostRequest:(NSMutableDictionary*)params andUrl:(NSString*)strURL;
+ (NSString*)sendGetRequest:(NSString*)strURL;
+ (NSString*)sendLoginRequest;
+ (BOOL)sendVerifyRequest;
+ (NSString*)sendLogoutRequest;

+(ServiceLib*)shareInstance;
@end
