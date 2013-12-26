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
    return YES;
}
@end
