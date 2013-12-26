//
//  Song.m
//  Karaoke
//
//  Created by papo on 12/25/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import "Lyric.h"
#import "GDataXMLNode.h"
#import "Sentence.h"

@implementation Lyric

+ (Lyric*)lyricWithFile:(NSString *)fileName
{
    Lyric* lyric = [[Lyric alloc] init];
    if ([lyric initWithFile:fileName]) {
        return lyric;
    }
    lyric = nil;
    return Nil;
}

- (BOOL)initWithFile:(NSString *)fileName
{
    self.sentencesArray = [[NSMutableArray alloc] init];
    
    // get the path of file
    NSString* path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"xml"];
    
    NSData* data = [[NSMutableData alloc] initWithContentsOfFile:path];
    NSError* error;
    GDataXMLDocument* doc = [[GDataXMLDocument alloc] initWithData:data options:0 error:&error];
    if (doc) {
        NSArray* params = [doc.rootElement elementsForName:@"param"];
        for (id param in params) {
            if (param && [param isKindOfClass:[GDataXMLElement class]]) {
                Sentence* s = [Sentence sentenceWithData:param];
                [self.sentencesArray addObject:s];
            }
        }
        return YES;
    }
    if (error) {
        NSLog(@"XML parse error: %@", error.description);
    }
    
    return NO;
}

- (Sentence*)sentenceAtIndex:(int)index
{
    if (index < 0 || index >= self.sentencesArray.count) {
        return nil;
    }
    return self.sentencesArray[index];
}
@end
