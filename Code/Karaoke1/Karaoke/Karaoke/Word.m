//
//  Word.m
//  Karaoke
//
//  Created by papo on 12/26/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import "Word.h"
#import "GDataXMLNode.h"

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
    self.value = [data stringValue];
    
    NSLog(@"word: %@ time: %@", _value, time);
    
    return YES;
}
@end
