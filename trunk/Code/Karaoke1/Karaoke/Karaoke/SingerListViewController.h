//
//  SingerListViewController.h
//  Karaoke
//
//  Created by papo on 12/26/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavibarViewController.h"

@interface SingerListViewController : NavibarViewController <UICollectionViewDataSource, UICollectionViewDelegate>


@property (nonatomic, retain) NSArray*  singerList;
@property (nonatomic, weak) IBOutlet UICollectionView* singerCollection;
@end
