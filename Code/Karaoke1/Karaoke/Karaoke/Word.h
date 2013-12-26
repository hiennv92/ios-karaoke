//
//  Word.h
//  Karaoke
//
//  Created by papo on 12/26/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GDataXMLElement;

@interface Word : NSObject

    // properties
@property (nonatomic, assign) float time;
@property (nonatomic, retain) NSString* value;


+ (Word*)wordWithData:(GDataXMLElement*)data;
- (BOOL)initWithData:(GDataXMLElement*)data;
- (BOOL)isWordInTime:(float)time;
@end
