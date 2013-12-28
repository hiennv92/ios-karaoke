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
    int         _currentWord;
    SentenceView*   _senView1;
    SentenceView*   _senView2;
    
    float       _lastTime;
    int         _senIndex;
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
    }
    return self;
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
    _currentWord = 0;
    _lastTime = 0.0f;
    _senIndex = 0;
}

- (void)step:(float)currentTime
{
    if (!_lyric) {
        return;
    }
    if (_lastTime > 3.0) {
        _senIndex = 0;
        [_senView1 clearAllText];
        [_senView2 clearAllText];
    }
    
    Sentence* sentence = [_lyric sentenceAtIndex:_currentSentence];
    int compare = [sentence compareWithTime:currentTime];
    if (!_senView1.isSetUp && [sentence isComing:currentTime]) {
        [_senView1 setSentence:sentence];
        _senView1.isSetUp = YES;
        _lastTime = 0;
        _senIndex = 1 - _senIndex;
    }
    if (compare == CompareResultSame) {
        for (int i = _currentWord; i < sentence.wordsArray.count; i++) {
            Word* w = sentence.wordsArray[i];
            if ([w isWordInTime:currentTime]) {
                ++_currentWord;
                [_senView1 selectWord:i];
                break;
            }
        }
    }
    else if (compare == CompareResultAsc)
    {
        _lastTime = currentTime;
        ++_currentSentence;
        _currentWord = 0;
        [_senView1 setUp:NO];
    }
}


- (void)setLyricFile:(NSString *)fileName
{
    _lyric = [Lyric lyricWithFile:fileName];
}

@end
