//
//  SingerListViewController.h
//  Karaoke
//
//  Created by papo on 12/26/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavibarViewController.h"
#import "PSTCollectionView.h"

@interface SingerListViewController : NavibarViewController<PSTCollectionViewDataSource, PSTCollectionViewDelegate>


@property (nonatomic, retain) NSArray*  singerList;
@property (nonatomic, retain) PSTCollectionView* collectionView;

@end
