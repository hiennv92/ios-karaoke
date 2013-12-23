//
//  MenuSlideControllerViewController.m
//  Karaoke
//
//  Created by papo on 12/20/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import "MenuSlideControllerViewController.h"
#import "MenuCell.h"


@interface MenuSlideControllerViewController ()
{
    NSArray* _headerArray;
    NSArray* _headerImages;
    NSArray* _data;
    NSArray* _dataIcon;
}

@end

@implementation MenuSlideControllerViewController

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
    _headerArray = @[@"", @"DANH MỤC", @"NHẠC DJ", @"TIN TỨC VIDEO", @"THÊM"];
    _headerImages = @[@"", @"secsion-danh-muc.png", @"secsion-nhacDJ.png", @"secsion-tin-tuc-video.png", @"secsion-them.png"];
    
    
    _data = @[@[@"Tài Khoản" , @"Dịch Vụ" ],
              @[@"Trang chủ", @"Tìm kiếm karaoke 5 số", @"Karaoke Clip", @"Karaoke mới nhất",
                @"Karaoke hits", @"Ca khúc đã ghi âm", @"Karaoke yêu thích", @"Thu âm bình chọn nhiều nhất",
                @"Ca khúc nổi bật", @"Ca sỹ", @"Thể Loại"],
              @[@"Mới nhất", @"Hot nhất", @"Sự kiện nổi bật"],
              @[@"Camera 360 độ", @"Clip gây bão"],
              @[@"Cài đặt", @"Hướng dẫn", @"Thông tin", @"Wap karaoke"]];
    _dataIcon = @[@[@"tai-khoan.png", @"dich-vu.png",],
                  @[@"trang-chu.png", @"search.png", @"karaoke-clip.png", @"karaoke-moi-nhat.png", @"karaoke-hit.png", @"ca-khuc-da-ghi-am.png", @"karaoke-yeuthich.png", @"thu-am-binh-chon-nhieu-nhat.png", @"ca-khuc-noi-bat.png", @"ca-si.png", @"the-loai.png"],
                  @[@"newest.png", @"hot-nhat-icon.png", @"su-kien-noi-bat.png"],
                  @[@"camera360.png", @"clip-gay-bao.png"],
                  @[@"cai-dat.png", @"huong-dan.png", @"thong-tin.png", @"wap-kara.png"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table View Delegate

#pragma mark - Table View Source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _headerArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ((NSArray*)_data[section]).count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MenuCell* cell = (MenuCell*)[tableView dequeueReusableCellWithIdentifier:@"MenuCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MenuCell" owner:self options:Nil] objectAtIndex:0];
    }
    cell.title.text = _data[indexPath.section][indexPath.row];
    cell.icon.image = [UIImage imageNamed:_dataIcon[indexPath.section][indexPath.row]];
    
    return cell;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"Header"];
    if (!view) {
        if (section == 0) {
            view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 5)];
            [view setBackgroundColor:[UIColor clearColor]];
        }
        else
        {
            view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
            [view setBackgroundColor:[UIColor lightGrayColor]];
            UILabel* title = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, 280, 20)];
            [title setText:_headerArray[section]];
            [title setFont:[UIFont systemFontOfSize:13]];
            [title setTextColor:[UIColor blueColor]];
            [view addSubview:title];
            
            UIImage* image = [UIImage imageNamed:_headerImages[section]];
            UIImageView* icon = [[UIImageView alloc] initWithImage:image];
            [icon setFrame:CGRectMake(10, 0, 20, 20)];
            [view addSubview:icon];
        }
    }
    
    return view;
}

- (float)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return 20;
}

- (IBAction)loginFacebook:(id)sender {
}
@end
