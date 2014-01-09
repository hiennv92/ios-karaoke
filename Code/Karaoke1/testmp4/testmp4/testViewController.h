//
//  testViewController.h
//  testmp4
//
//  Created by datkq on 1/9/14.
//  Copyright (c) 2014 datkq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface testViewController : UIViewController<AVAssetResourceLoaderDelegate,MPMediaPickerControllerDelegate>{
    MPMoviePlayerController* player;
}
@property (weak, nonatomic) IBOutlet UIView *playerView;
- (IBAction)play:(id)sender;

@end
