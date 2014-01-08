//
//  SentenceView.m
//  Karaoke
//
//  Created by papo on 12/27/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import "SentenceView.h"
#import "Sentence.h"
#import "WordLabel.h"
#import "Word.h"

@interface SentenceView()
{
    BOOL    _isBoy; // yes --> boy, no --> girl
    Sentence*   _sentence;
    int         _currentWord;
}

@end

@implementation SentenceView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithSentence:(Sentence *)sentence atPos:(CGPoint)position
{
    self = [super init];
    if (self) {
        [self setFrame:CGRectMake(position.x, position.y, 0, 0)];
        [self setSentence:sentence];
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

- (float)lastWidth
{
    NSArray* views = self.subviews;
    if (views && views.count > 0) {
        UIView* view = views.lastObject;
        return view.frame.origin.x + view.frame.size.width;
    }
    return 0;
}

// select word
- (void)selectWord:(int)index
{
    if (index < self.subviews.count) {
        WordLabel* word = self.subviews[index];
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        
        [UIView setAnimationDuration:1];
//        [word setTextColor:[UIColor yellowColor]];
        word.layer.backgroundColor = [UIColor yellowColor].CGColor;
        //also call this before commit animations......
        [UIView commitAnimations];
    }
}

- (void)setSentence:(Sentence *)sentence
{
    // remove all children
    [self clearAllText];
    
    if (sentence == nil) {
        return;
    }
    
    
    // select sentence
    _sentence = sentence;
    [sentence setSelected:YES];
    
    
    // recount word
    _currentWord = 0;
    
    
    // check if boy or girl
    _isBoy = [sentence.type.lowercaseString isEqualToString:@"b"];
    
    
    // add new words
    for (Word* word in sentence.wordsArray) {
        WordLabel* wb = [[WordLabel alloc] initWithText:word.value];
        [wb setTextColor:_isBoy?[UIColor blueColor]:[UIColor redColor]];
        [wb setFrame:CGRectMake([self lastWidth], 0, wb.frame.size.width, wb.frame.size.height)];
        [self addSubview:wb];
    }
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, [self lastWidth], 20)];
}


// clear all the text in sentence
- (void)clearAllText
{
    for (WordLabel* v in self.subviews) {
        if (v) {
            [v removeFromSuperview];
        }
    }
}

// step method
- (void)step:(float)currentTime
{
    // do nothing if is not setup or sentence is not selected
    if (!_sentence || !_isSetUp) {
        return;
    }
    
    // find the current word
    int compare = [_sentence compareWithTime:currentTime];
    if (compare == CompareResultSame) {
        for (int i = _currentWord; i < _sentence.wordsArray.count; i++) {
            Word* w = _sentence.wordsArray[i];
            if ([w isWordInTime:currentTime]) {
                ++_currentWord;
                [self selectWord:i];
                break;
            }
        }
    }
    else if (compare == CompareResultAsc)
    {
        _currentWord = 0;
        [self setUp:NO];
        [self performSelector:@selector(hideWord) withObject:nil afterDelay:2];
    }
}

- (void)hideWord
{
    if (!_isSetUp) {
        [self clearAllText];
    }
}

@end
