//
//  dangnhapViewController.h
//  Karaoke
//
//  Created by datkq on 12/23/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavibarViewController.h"

@interface dangnhapViewController : NavibarViewController<UITextFieldDelegate>{
    
}
@property (strong, nonatomic) IBOutlet UILabel *_labelNumberPhone;
@property (strong, nonatomic) IBOutlet UILabel *_labelPass;

@property (strong, nonatomic) IBOutlet UITextField *_fieldSDT;
@property (strong, nonatomic) IBOutlet UITextField *_fieldPassword;

- (IBAction)luuMk:(id)sender;
- (IBAction)quenMk:(id)sender;
- (IBAction)dangNhap:(id)sender;
- (IBAction)dangky:(id)sender;

@end
