//
//  Singer.h
//  Karaoke
//
//  Created by papo on 1/7/14.
//  Copyright (c) 2014 banana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singer : NSObject
/**
 "id": "7782f391-7185-4528-bd65-d00c81d3dc70",
 "name": "365 Band",
 "summary": null,
 "details": null,
 "createdDate": "2013-12-13 14:12",
 "birthDay": "2010-10-01 00:00",
 "largeImage": "~/image/6014ce95-9b14-47c1-a345-cf2e54c39d7a.jpg",
 "country": "Việt Nam",
 "fullName": "365 Band",
 "homeIndex": 0
 */
@property (nonatomic, retain) NSString* singerId;
@property (nonatomic, retain) NSString* name;
@property (nonatomic, retain) NSString* summary;
@property (nonatomic, retain) NSString* details;
@property (nonatomic, retain) NSString* createDate;
@property (nonatomic, retain) NSString* birthDay;
@property (nonatomic, retain) NSString* largerImage;
@property (nonatomic, retain) NSString* country;
@property (nonatomic, retain) NSString* fullName;
@property (nonatomic, retain) NSString* homeIndex;

+ (Singer*)singerFromDictionary:(NSDictionary*)dict;
- (id)initFromDictionary:(NSDictionary*)dict;
- (NSString*)getLargeImageUrl;

@end
