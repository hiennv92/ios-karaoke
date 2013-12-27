//
//  RecordViewController.m
//  Karaoke
//
//  Created by Trinh Van Duong on 12/27/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import "RecordViewController.h"

@interface RecordViewController ()

@end

@implementation RecordViewController

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
    // Do any additional setup after loading the view from its nib.
    [self setIsPlay:NO];
    [self setIsRecording:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    //@"Ghi âm"
    //@"Đang ghi âm"
}

- (IBAction)recordController:(id)sender {

}

- (IBAction)playController:(id)sender {

}

- (IBAction)sameSongController:(id)sender {

}

- (IBAction)likeController:(id)sender {
    
}

- (IBAction)backController:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
