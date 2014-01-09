//
//  SingerDetailViewController.m
//  Karaoke
//
//  Created by papo on 1/10/14.
//  Copyright (c) 2014 banana. All rights reserved.
//

#import "SingerDetailViewController.h"
#import "Singer.h"
#import "Cell.h"
#import "UIImageView+AFNetworking.h"

@interface SingerDetailViewController ()

@end

@implementation SingerDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self.tableView registerNib:[UINib nibWithNibName:@"Cell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self updateData];
    [self createNavigationBarWithTitle:Nil backgroundImage:@"bg-top-home.png" leftButton:@"menu.png" leftButtonPress:Nil rightButton:@"setting.png" rightButtonPress:Nil andType:1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateData {
    self.singerName.text = _singer.name;
    self.singerRealName.text = _singer.fullName;
    self.birthdayLb.text = _singer.birthDay;
    self.countryLb.text = _singer.country;
    [self.singerImage setImageWithURL:[NSURL URLWithString:[_singer getLargeImageUrl]]];
}

- (void)leftButtonBarPress:(id)button {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITableViewSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return self.sectionSinger;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Cell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"Cell" owner:self options:nil] objectAtIndex:0];
    }

    return cell;
}
#pragma mark - UITableViewDelegate

@end
