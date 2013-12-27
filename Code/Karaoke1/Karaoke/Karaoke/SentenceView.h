//
//  SentenceView.h
//  Karaoke
//
//  Created by papo on 12/27/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Sentence;

@interface SentenceView : UIView

- (id)initWithSentence:(Sentence*)sentence atPos:(CGPoint)position;

- (void)selectWord:(int)index;
@end