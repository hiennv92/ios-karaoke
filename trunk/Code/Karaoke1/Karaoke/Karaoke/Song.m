//
//  Song.m
//  Karaoke
//
//  Created by Trinh Van Duong on 1/9/14.
//  Copyright (c) 2014 banana. All rights reserved.
//

#import "Song.h"
#import "Lib.h"

@implementation Song

+ (Song*)songFromDictionary:(NSDictionary *)dict
{
    return [[Song alloc] initFromDictionary:dict];
}

/*

"modifiedDate": null
*/

- (id)initFromDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        self.authorId = [dict objectForKey:@"authors"];
        self.isFavorite = [dict objectForKey:@"isFavorite"];
        self.songId = [dict objectForKey:@"id"];
        self.name =  [dict objectForKey:@"name"];
        self.startLetter = [dict objectForKey: @"startLetter"];
        self.summary = [dict objectForKey:@"summary"];
        self.details = [dict objectForKey:@"details"];
        self.lyric = [dict objectForKey:@"lyric"];
        self.createDate = [dict objectForKey:@"createdDate"];
        self.albumId = [dict objectForKey:@"albumId"];
        self.dataFile = [dict objectForKey:@"dataFile"];
        self.mainSingerId = [dict objectForKey:@"mainSingerId"];
        self.code = [dict objectForKey:@"code"];
        self.voteCount = [dict objectForKey:@"voteCount"];
        self.voteScore = [dict objectForKey:@"voteScore"];
        self.mp3File = [dict objectForKey:@"mp3File"];
        self.is5Digits = [dict objectForKey:@"is5Digits"];
        self.keyWords = [dict objectForKey:@"keyWords"];
        self.largeImage = [dict objectForKey:@"largeImage"];

        if([dict objectForKey:@"largeImage"] != [NSNull null]){
            self.largeImage = [self.largeImage stringByReplacingOccurrencesOfString:@"~" withString:@""];
        }
        else
            self.largeImage = @"notImage";
        
        self.price = [dict objectForKey:@"price"];
        self.metadataFile = [dict objectForKey:@"metadataFile"];
        self.isFree = [[dict objectForKey:@"isFree"] boolValue];
        self.isHit = [[dict objectForKey:@"isHit"] boolValue];
        self.isNewSong = [[dict objectForKey:@"isNewSong"] boolValue];
        self.duration = [dict objectForKey:@"duration"];
        self.scope = [dict objectForKey:@"scope"];
        self.mp4VocalFile = [dict objectForKey:@"mp4VocalFile"];
        if([dict objectForKey:@"mp4VocalFile"] != [NSNull null])
            self.mp4VocalFile = [self.mp4VocalFile stringByReplacingOccurrencesOfString:@"~" withString:@""];
        else
            self.mp4VocalFile = @"notLink";
        
        self.mp4NoVocalFile = [dict objectForKey:@"mp4NoVocalFile"];
        if([dict objectForKey:@"mp4NoVocalFile"] != [NSNull null])
            self.mp4NoVocalFile = [self.mp4NoVocalFile stringByReplacingOccurrencesOfString:@"~" withString:@""];
        else
            self.mp4NoVocalFile = @"notLink";
        
        self.mediaType = [dict objectForKey:@"mediaType"];
        self.modifiedDate = [dict objectForKey:@"modifiedDate"];
    }
    return self;
}


- (NSString*)getLargeImageUrl
{
    NSLog(@"media url: %@", [Lib getMediaUrl:self.largeImage]);
    return [Lib getMediaUrl:self.largeImage];
}
@end
