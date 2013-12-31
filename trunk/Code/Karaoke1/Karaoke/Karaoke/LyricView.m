//
//  LyricView.m
//  Karaoke
//
//  Created by papo on 12/28/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import "LyricView.h"

#import "Lyric.h"
#import "Sentence.h"
#import "Word.h"
#import "SentenceView.h"


@interface LyricView(){
    int         _currentSentence;
    
    SentenceView*   _senView1;
    SentenceView*   _senView2;
}

@end

@implementation LyricView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _senView1 = [[SentenceView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 30)];
        [self addSubview:_senView1];
        
        _senView2 = [[SentenceView alloc] initWithFrame:CGRectMake(50, 50, self.frame.size.width - 50, 30)];
        [self addSubview:_senView2];
        
        [self setBackgroundColor:[UIColor colorWithRed:255 green:255 blue:255 alpha:0.5]];
    }
    return self;
}

- (id)init
{
    return [self initWithFrame:CGRectZero];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)start
{
    _currentSentence = 0;
}

- (void)step:(float)currentTime
{
    if (!_lyric) {
        return;
    }
    
    Sentence* sentence = [_lyric sentenceAtIndex:_currentSentence];
    
    if ([sentence isComing:currentTime]) {
        if (!_senView1.isSetUp && (_currentSentence % 2) == 0) {
            [_senView1 setSentence:sentence];
            _senView1.isSetUp = YES;
            ++_currentSentence;
        }else if (!_senView2.isSetUp && (_currentSentence % 2) == 1)
        {
            [_senView2 setSentence:sentence];
            _senView2.isSetUp = YES;
            _currentSentence++;
        }
    }
    [_senView1 step:currentTime];
    [_senView2 step:currentTime];
}


- (void)setLyricFile:(NSString *)fileName
{
    _lyric = [Lyric lyricWithFile:fileName];
}

- (void)stop
{
    [self clearAllText];
    [_senView1 setUp:NO];
    [_senView2 setUp:NO];
}

- (void)clearAllText
{
    [_senView1 clearAllText];
    [_senView2 clearAllText];
}
@end
