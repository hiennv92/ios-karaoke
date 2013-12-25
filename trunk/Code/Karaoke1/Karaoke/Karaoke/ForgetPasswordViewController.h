//
//  ForgetPasswordViewController.h
//  Karaoke
//
//  Created by Trinh Van Duong on 12/25/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavibarViewController.h"

@interface ForgetPasswordViewController : NavibarViewController<UITextFieldDelegate>{
    
}
- (IBAction)getPassWordController:(id)sender;
- (IBAction)LoginReturn:(id)sender;
@end
