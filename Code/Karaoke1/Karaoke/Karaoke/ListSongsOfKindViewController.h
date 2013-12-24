//
//  ListSongsOfKindViewController.h
//  Karaoke
//
//  Created by Trinh Van Duong on 12/25/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavibarViewController.h"

@interface ListSongsOfKindViewController : NavibarViewController{
    
}
@property (strong, nonatomic) IBOutlet UITableView *_tableViewSongs;
@property (strong, nonatomic) NSString *title;

@end
