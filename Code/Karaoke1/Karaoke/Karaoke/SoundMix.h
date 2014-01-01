//
//  SoundMix.h
//  Karaoke
//
//  Created by papo on 12/30/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface SoundMix : NSObject

+ (BOOL)trimSoundFile:(NSString*)fileInput withTime:(float)time;
+ (double)getSoundLength:(NSString*)file;
@end
