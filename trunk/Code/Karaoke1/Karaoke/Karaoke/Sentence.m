//
//  Sentence.m
//  Karaoke
//
//  Created by papo on 12/26/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import "Sentence.h"
#import "GDataXMLNode.h"
#import "Word.h"

#define kComingTime     3.0

@interface Sentence(){
}

@end

@implementation Sentence

+ (Sentence*)sentenceWithData:(GDataXMLElement *)data
{
    Sentence* s = [[Sentence alloc] init];
    if ([s initWithData:data]) {
        return s;
    }
    s = nil;
    return nil;
}

- (BOOL)initWithData:(GDataXMLElement *)data
{
    self.wordsArray = [[NSMutableArray alloc] init];
    
    
    self.type = [data attributeForName:@"s"].stringValue;
    
    NSArray* params = [data elementsForName:@"i"];
    for (id p in params) {
        if (p && [p isKindOfClass:[GDataXMLElement class]]) {
            Word* w = [Word wordWithData:p];
            [self.wordsArray addObject:w];
        }
    }
    
    self.timeLength = ((Word*)self.wordsArray.lastObject).time - ((Word*)self.wordsArray[0]).time;
    return YES;
}

- (float)firstTime
{
    return ((Word*)self.wordsArray[0]).time;
}

- (float)lastTime
{
    return ((Word*)self.wordsArray.lastObject).time;
}

- (BOOL)isTimeInSentence:(float)currTime
{
    return [self compareWithTime:currTime] == CompareResultSame;
}

- (int)compareWithTime:(float)time
{
    if (time > [self lastTime]) {
        return CompareResultAsc;
    }
    if (time < [self firstTime]) {
        return CompareResultDesc;
    }
    return CompareResultSame;
}

- (BOOL)isComing:(float)currentTime
{
    if ([self isSelected]) {
        return NO;
    }
    return (currentTime >= ([self firstTime] - kComingTime));
}
@end
