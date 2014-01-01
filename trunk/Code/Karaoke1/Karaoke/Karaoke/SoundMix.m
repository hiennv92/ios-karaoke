//
//  SoundMix.m
//  Karaoke
//
//  Created by papo on 12/30/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import "SoundMix.h"
#import <CoreMedia/CoreMedia.h>

@implementation SoundMix
+ (BOOL)trimSoundFile:(NSString *)fileInput withTime:(float)time
{
    float vocalStartMarker = 0.0f;
    float vocalEndMarker = 2.0;
    
    NSURL *audioFileInput = [NSURL URLWithString:fileInput]; // give your audio file path
    
    NSString *docsDirs;
    NSArray *dirPath;
    dirPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDirs = [dirPath objectAtIndex:0];
    NSString *destinationURLs = [docsDirs stringByAppendingPathComponent:@"trim.caf"];
    NSURL* audioFileOutput = [NSURL fileURLWithPath:destinationURLs];
    
    if (!audioFileInput || !audioFileOutput)
    {
        return NO;
    }
    [[NSFileManager defaultManager] removeItemAtURL:audioFileOutput error:NULL];
    AVAsset *asset = [AVURLAsset URLAssetWithURL:audioFileInput options:nil];
    AVAssetExportSession *exportSession = [AVAssetExportSession exportSessionWithAsset:asset
                                                                            presetName:AVAssetExportPresetAppleM4A];
    if (exportSession == nil)
    {
        return NO;
    }
    CMTime startTime = CMTimeMake((int)(floor(vocalStartMarker * 100)), 100);
    CMTime stopTime = CMTimeMake((int)(ceil(vocalEndMarker * 100)), 100);
    CMTimeRange exportTimeRange = CMTimeRangeFromTimeToTime(startTime, stopTime);
    exportSession.outputURL = audioFileOutput;
    exportSession.outputFileType = AVFileTypeAppleM4A;
    exportSession.timeRange = exportTimeRange;
    
    [exportSession exportAsynchronouslyWithCompletionHandler:^
     {
         if (AVAssetExportSessionStatusCompleted == exportSession.status)
         {
             // It worked!
             NSLog(@"DONE TRIMMING.....");
             NSLog(@"ouput audio trim file %@",audioFileOutput);
         }
         else if (AVAssetExportSessionStatusFailed == exportSession.status)
         {
             // It failed...
             NSLog(@"FAILED TRIMMING.....");
         }
     }];
    return YES;
}

+ (double)getSoundLength:(NSString *)file
{
    AVAudioPlayer * sound = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:file] error:nil];
    double durationInSeconds = sound.duration;
    return durationInSeconds;
}
@end
