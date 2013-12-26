//
//  SingerListViewController.m
//  Karaoke
//
//  Created by papo on 12/26/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import "SingerListViewController.h"
#import "SingerCell.h"

@interface SingerListViewController ()

@end

@implementation SingerListViewController

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
    [self createNavigationBarWithTitle:Nil backgroundImage:@"bg-top-home.png" leftButton:@"menu.png" leftButtonPress:Nil rightButton:@"setting.png" rightButtonPress:Nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollection Source
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 0;
    return self.singerList.count;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SingerCell* cell = (SingerCell*)[collectionView dequeueReusableSupplementaryViewOfKind:@"SingerCell" withReuseIdentifier:@"SingerCell" forIndexPath:indexPath];
                                     
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SingerCell" owner:self options:Nil] objectAtIndex:0];
    }
//    cell.icon.image = [UIImage imageNamed:@"abc"];
//    cell.name.text = @"name";
    
    return cell;
}

#pragma mark - UICollection Delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}


- (void)leftButtonBarPress:(id)button
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
