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

- (void)selectWord:(int)index
{
    if (index < self.subviews.count) {
        WordLabel* word = self.subviews[index];
        [word setTextColor:[UIColor yellowColor]];
    }
}

- (void)setSentence:(Sentence *)sentence
{
    // remove all children
    [self clearAllText];
    
    if (sentence == nil) {
        return;
    }
    
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

- (void)clearAllText
{
    for (WordLabel* v in self.subviews) {
        if (v) {
            [v removeFromSuperview];
        }
    }
}

@end
