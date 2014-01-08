//
//  Song.h
//  Karaoke
//
//  Created by Trinh Van Duong on 1/9/14.
//  Copyright (c) 2014 banana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Song : NSObject{
    
}

@property (nonatomic, retain) NSString *authorId;
@property (nonatomic, retain) NSString *isFavorite;
@property (nonatomic, retain) NSString *songId;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *startLetter;
@property (nonatomic, retain) NSString *lyric;
@property (nonatomic, retain) NSString *summary;
@property (nonatomic, retain) NSString *details;
@property (nonatomic, retain) NSString *createDate;
@property (nonatomic, retain) NSString *albumId;
@property (nonatomic, retain) NSString *dataFile;
@property (nonatomic, retain) NSString *mainSingerId;
@property (nonatomic, retain) NSString *code;
@property (nonatomic, retain) NSNumber *voteCount;
@property (nonatomic, retain) NSNumber *voteScore;
@property (nonatomic, retain) NSString *mp3File;
@property (nonatomic, retain) NSString *is5Digits;
@property (nonatomic, retain) NSString *keyWords;
@property (nonatomic, retain) NSString *largeImage;
@property (nonatomic, retain) NSString *price;
@property (nonatomic, retain) NSString *metadataFile;
@property (nonatomic, retain) NSString *isFree;
@property (nonatomic, retain) NSString *isHit;
@property (nonatomic, retain) NSString *isNewSong;
@property (nonatomic, retain) NSString *duration;
@property (nonatomic, retain) NSString *scope;
@property (nonatomic, retain) NSString *mp4VocalFile;
@property (nonatomic, retain) NSString *mp4NoVocalFile;
@property (nonatomic, retain) NSString *mediaType;
@property (nonatomic, retain) NSString *modifiedDate;


+ (Song*)songFromDictionary:(NSDictionary *)dict;
- (id)initFromDictionary:(NSDictionary *)dict;
- (NSString*)getLargeImageUrl;
@end
