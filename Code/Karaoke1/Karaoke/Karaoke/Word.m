//
//  Word.m
//  Karaoke
//
//  Created by papo on 12/26/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import "Word.h"
#import "GDataXMLNode.h"

#define timeDelta   0.01

@implementation Word

+ (Word*)wordWithData:(GDataXMLElement *)data
{
    Word* w = [[Word alloc] init];
    if ([w initWithData:data]) {
        return w;
    }
    w = nil;
    return nil;
}

- (BOOL)initWithData:(GDataXMLElement *)data
{
    NSString* time = [data attributeForName:@"va"].stringValue;
    NSArray* array = [time componentsSeparatedByString:@":"];
    float totalTime = [array[0] floatValue] * 60 + [array[1] floatValue] + [array[2] floatValue] / 1000;
    self.time = totalTime;
    self.value = [data stringValue];
    
    return YES;
}

- (BOOL)isWordInTime:(float)time
{
    if (time <= self.time + timeDelta && time >= self.time - timeDelta) {
        return YES;
    }
    return NO;
}
@end
