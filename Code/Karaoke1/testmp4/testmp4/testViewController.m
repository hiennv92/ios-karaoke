//
//  testViewController.m
//  testmp4
//
//  Created by datkq on 1/9/14.
//  Copyright (c) 2014 datkq. All rights reserved.
//

#import "testViewController.h"

@interface testViewController ()

@end

@implementation testViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL*theurl=[[NSBundle mainBundle] URLForResource:@"anh_khong_doi_qua" withExtension:@"mp4"];
    player=[[MPMoviePlayerController alloc] initWithContentURL:theurl];
    [player.view setFrame:CGRectMake(0, 0, 200,100)];
    [player prepareToPlay];
    [player setShouldAutoplay:NO]; // And other options you can look through the documentation.
    [self.playerView addSubview:player.view];
    [self.playerView setUserInteractionEnabled:NO];
    // Do any additional setup after loading the view from its nib.

    NSArray *pathComponents = [NSArray arrayWithObjects:
                               [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject],
                               @"converted.mp3",
                               nil];
    NSLog(@"url=%@",pathComponents);
    [self convert:theurl to: pathComponents];
}

-(void)convert:(NSURL*)srcURL to :(NSArray*)dstPath
{
    NSURL*      dstURL = [NSURL fileURLWithPathComponents:dstPath];
    [[NSFileManager defaultManager] removeItemAtURL:dstURL error:nil];
    
    AVMutableComposition*   newAudioAsset = [AVMutableComposition composition];
    
    AVMutableCompositionTrack*  dstCompositionTrack;
    dstCompositionTrack = [newAudioAsset addMutableTrackWithMediaType:AVMediaTypeAudio preferredTrackID:kCMPersistentTrackID_Invalid];
    
    
    AVAsset*    srcAsset = [AVURLAsset URLAssetWithURL:srcURL options:nil];
    AVAssetTrack*   srcTrack = [[srcAsset tracksWithMediaType:AVMediaTypeAudio] objectAtIndex:0];
    
    
    CMTimeRange timeRange = srcTrack.timeRange;
    
    NSError*    error;
    
    if(NO == [dstCompositionTrack insertTimeRange:timeRange ofTrack:srcTrack atTime:kCMTimeZero error:&error]) {
        NSLog(@"track insert failed: %@\n", error);
        return;
    }
    
    
    AVAssetExportSession*   exportSesh = [[AVAssetExportSession alloc] initWithAsset:newAudioAsset presetName:AVAssetExportPresetPassthrough];
    
    exportSesh.outputFileType = AVFileTypeMPEGLayer3;
    exportSesh.outputURL = dstURL;
    
    [exportSesh exportAsynchronouslyWithCompletionHandler:^{
        AVAssetExportSessionStatus  status = exportSesh.status;
        NSLog(@"exportAsynchronouslyWithCompletionHandler: %i\n", status);
        
        if(AVAssetExportSessionStatusFailed == status) {
            NSLog(@"FAILURE: %@\n", exportSesh.error);
        } else if(AVAssetExportSessionStatusCompleted == status) {
            NSLog(@"SUCCESS!\n");
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)play:(id)sender {
    [player play];
}
@end
