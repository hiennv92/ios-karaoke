//
//  Sentence.h
//  Karaoke
//
//  Created by papo on 12/26/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GDataXMLElement;

enum CompareResult {
    CompareResultDecc = 1,
    CompareResultAcc = 2,
    CompareResultSame
    };

@interface Sentence : NSObject

@property (nonatomic, retain) NSString* type;
@property (nonatomic, retain) NSMutableArray*   wordsArray;
@property (nonatomic, assign) float   timeLength;

+ (Sentence*)sentenceWithData:(GDataXMLElement*)data;
- (BOOL)initWithData:(GDataXMLElement*)data;
- (float)firstTime;
- (float)lastTime;
- (BOOL)isTimeInSentence:(float)currTime;
- (int)compareWithTime:(float)time;
@end