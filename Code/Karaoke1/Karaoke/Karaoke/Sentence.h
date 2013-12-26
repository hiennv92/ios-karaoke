//
//  Sentence.h
//  Karaoke
//
//  Created by papo on 12/26/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GDataXMLElement;

@interface Sentence : NSObject

@property (nonatomic, retain) NSString* type;
@property (nonatomic, retain) NSMutableArray*   wordsArray;

+ (Sentence*)sentenceWithData:(GDataXMLElement*)data;
- (BOOL)initWithData:(GDataXMLElement*)data;
@end
