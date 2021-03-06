//
//  SingerListViewController.m
//  Karaoke
//
//  Created by papo on 12/26/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import "SingerListViewController.h"
#import "SingerCell.h"
#import "Lib.h"
#import "ServiceLib.h"
#import "Singer.h"
#import "UIImageView+AFNetworking.h"
#import "SingerDetailViewController.h"

NSString *CollectionViewCellIdentifier = @"SingerCell";

@interface SingerListViewController ()
{
    NSMutableArray*     _data;
}

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
    [self createNavigationBarWithTitle:Nil backgroundImage:@"bg-top-home.png" leftButton:@"menu.png" leftButtonPress:Nil rightButton:@"setting.png" rightButtonPress:Nil andType:1];
    
    // create collection view
    PSTCollectionViewFlowLayout* layout = [[PSTCollectionViewFlowLayout alloc] init];
    self.collectionView = [[PSTCollectionView alloc] initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height - 44) collectionViewLayout:layout];
    [_collectionView setDataSource:self];
    [_collectionView setDelegate:self];
    _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [_collectionView registerNib:[UINib nibWithNibName:CollectionViewCellIdentifier bundle:Nil] forCellWithReuseIdentifier:CollectionViewCellIdentifier];
    
    [self.view addSubview:_collectionView];
    
    _data = [[NSMutableArray alloc] init];

    // load data
    [self loadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void)leftButtonBarPress:(id)button
{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark -
#pragma mark Collection View Data Source

- (NSString *)formatIndexPath:(NSIndexPath *)indexPath {
    return [NSString stringWithFormat:@"{%ld,%ld}", (long)indexPath.row, (long)indexPath.section];
}

- (PSUICollectionViewCell *)collectionView:(PSUICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SingerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionViewCellIdentifier forIndexPath:indexPath];
    Singer* singer = _data[indexPath.row];
    cell.name.text = singer.name;
    [cell.icon setImageWithURL:[NSURL URLWithString:[singer getLargeImageUrl]] placeholderImage:[UIImage imageNamed:@"ca-si.png"]];
     
    return cell;
}

- (CGSize)collectionView:(PSUICollectionView *)collectionView layout:(PSUICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(100, 140);
}

- (NSInteger)collectionView:(PSUICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return _data.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(PSTCollectionView *)collectionView
{
    return 1;
}
#pragma mark -
#pragma mark Collection View Delegate

- (void)collectionView:(PSTCollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Delegate cell %@ : HIGHLIGHTED", [self formatIndexPath:indexPath]);
}

- (void)collectionView:(PSTCollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Delegate cell %@ : UNHIGHLIGHTED", [self formatIndexPath:indexPath]);
}

- (void)collectionView:(PSTCollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Delegate cell %@ : SELECTED", [self formatIndexPath:indexPath]);
    SingerDetailViewController* vc = [[SingerDetailViewController alloc] initWithNibName:@"SingerDetailViewController" bundle:nil];
    [vc setSinger:_data[indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)collectionView:(PSTCollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Delegate cell %@ : DESELECTED", [self formatIndexPath:indexPath]);
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Check delegate: should cell %@ highlight?", [self formatIndexPath:indexPath]);
    return YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Check delegate: should cell %@ be selected?", [self formatIndexPath:indexPath]);
    return YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Check delegate: should cell %@ be deselected?", [self formatIndexPath:indexPath]);
    return YES;
}


#pragma mark - Load data
- (void)loadData
{
    [Lib showLoadingOnView:self.view withText:@"Đang tải..."];
    [NSThread detachNewThreadSelector:@selector(getSingerListFromService) toTarget:self withObject:nil];
}

- (void)getSingerListFromService
{
    NSString* retVal = [ServiceLib sendGetRequest:[Lib getServiceUrl:kServiceSingerUrl]];
    SBJsonParser* parser = [[SBJsonParser alloc] init];
    id data = [parser objectWithString:retVal];
    if (data && [data isKindOfClass:[NSDictionary class]]) {
        NSString* message = [data objectForKey:@"message"];
        NSString* error = [data objectForKey:@"error"];
        id result = [data objectForKey:@"result"];
        if (error.integerValue == 0) { // success!
            int total = [[result objectForKey:@"total"] integerValue];
            NSArray* items = [result objectForKey:@"items"];
            if (items) {
                for (id singer in items) {
                    if (singer && [singer isKindOfClass:[NSDictionary class]]) {
                        Singer* s = [Singer singerFromDictionary:singer];
                        [_data addObject:s];
                    }
                }
            }
        }
        else{
            NSLog(@"error: %@ message: %@", error, message);
        }
    }
    [self performSelectorOnMainThread:@selector(getDataFinish) withObject:nil waitUntilDone:YES];
}

- (void)getDataFinish
{
    [Lib removeLoadingOnView:self.view];
    [_collectionView reloadData];
}

@end
