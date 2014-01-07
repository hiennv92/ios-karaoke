//
//  Singer.m
//  Karaoke
//
//  Created by papo on 1/7/14.
//  Copyright (c) 2014 banana. All rights reserved.
//

#import "Singer.h"
#import "Lib.h"

@implementation Singer

+ (Singer*)singerFromDictionary:(NSDictionary *)dict
{
    return [[Singer alloc] initFromDictionary:dict];
}

- (id)initFromDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        self.name = [dict objectForKey:@"name"];
        self.singerId = [dict objectForKey:@"id"];
        self.summary = [dict objectForKey:@"summary"];
        self.details = [dict objectForKey:@"details"];
        self.createDate = [dict objectForKey:@"createdDate"];
        self.birthDay = [dict objectForKey:@"birthDay"];
        self.largerImage = [dict objectForKey:@"largeImage"];
        self.largerImage = [self.largerImage stringByReplacingOccurrencesOfString:@"~" withString:@""];
        self.country = [dict objectForKey:@"country"];
        self.fullName = [dict objectForKey:@"fullName"];
        self.homeIndex = [dict objectForKey:@"homeIndex"];
    }
    return self;
}

- (NSString*)getLargeImageUrl
{
    NSLog(@"media url: %@", [Lib getMediaUrl:self.largerImage]);
    return [Lib getMediaUrl:self.largerImage];
}
@end
