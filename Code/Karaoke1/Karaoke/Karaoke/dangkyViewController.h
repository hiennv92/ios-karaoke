//
//  dangkyViewController.h
//  Karaoke
//
//  Created by datkq on 12/22/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavibarViewController.h"

@interface dangkyViewController : NavibarViewController<UITextFieldDelegate>{
    
}
@property (weak, nonatomic) IBOutlet UITextField *sdt;
@property (weak, nonatomic) IBOutlet UITextField *matkhau;
@property (weak, nonatomic) IBOutlet UITextField *matkhauRE;
- (IBAction)dangky:(id)sender;
- (IBAction)dangnhaptrolai:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *_labelPassword;
@property (strong, nonatomic) IBOutlet UILabel *_labelRepassword;
@end
