//
//  Song.h
//  Karaoke
//
//  Created by papo on 12/25/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Sentence;

@interface Lyric : NSObject

@property (nonatomic, retain) NSString* songName;
@property (nonatomic, retain) NSMutableArray*   sentencesArray;


+ (Lyric*)lyricWithFile: (NSString*) fileName;
- (BOOL)initWithFile:(NSString*) fileName;
- (Sentence*)sentenceAtIndex:(int)index;
@end
