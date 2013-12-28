//
//  LyricView.h
//  Karaoke
//
//  Created by papo on 12/28/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Lyric;
@interface LyricView : UIView
@property (nonatomic, retain) Lyric* lyric;

- (void)start;
- (void)setLyricFile:(NSString*)fileName;
- (void)step:(float)currentTime;

- (void)stop;
- (void)clearAllText;
@end
