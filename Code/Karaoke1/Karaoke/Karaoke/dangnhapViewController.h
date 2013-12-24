//
//  dangnhapViewController.h
//  Karaoke
//
//  Created by datkq on 12/23/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavibarViewController.h"

@interface dangnhapViewController : NavibarViewController{
    
}
@property (weak, nonatomic) IBOutlet UITextField *sdt;
@property (weak, nonatomic) IBOutlet UITextField *matkhau;
- (IBAction)luuMk:(id)sender;
- (IBAction)quenMk:(id)sender;
- (IBAction)dangNhap:(id)sender;
- (IBAction)dangky:(id)sender;

@end
