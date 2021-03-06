//
//  MenuSlideControllerViewController.m
//  Karaoke
//
//  Created by papo on 12/20/13.
//  Copyright (c) 2013 banana. All rights reserved.
//

#import "MenuSlideControllerViewController.h"
#import "KindOfMusicViewController.h"
#import "RecordManagerViewController.h"
#import "MenuCell.h"
#import "NhacDJTinTucViewController.h"
#import "AppDelegate.h"
#import "SingerListViewController.h"
#import "TinTucVideoViewController.h"
#import "DankyGoiCuocViewController.h"
#import "WapKaraViewController.h"
#import "SettingViewController.h"
#import "InfoViewController.h"

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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
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
            [title setBackgroundColor:[UIColor clearColor]];
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.section) {
                                                    // Section 0
        case 0:
            if (indexPath.row == 0) {
                dangnhapViewController *loginView = [[dangnhapViewController alloc] initWithNibName:@"dangnhapViewController" bundle:Nil];
                [[AppDelegate shareApplication] showViewController:loginView];
            }
            else if (indexPath.row == 1 ) {         // dich vu
                DankyGoiCuocViewController *dangky = [[DankyGoiCuocViewController alloc] initWithNibName:@"DankyGoiCuocViewController" bundle:nil];
                [[AppDelegate shareApplication] showViewController:dangky];
            }
            break;
                                                        // DANH MUC
        case 1:
        {
            switch (indexPath.row) {
                case 0:                                 // trang chu
                {
                    NSLog(@"Trang chu");
                    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication]delegate];
                    [app.viewController showCenterPanelAnimated:YES];
                }
                    break;
                case 1:                                 // tim kiem karaoke 5 so
                {
                    
                }
                    break;
                case 2:                                 // karaoke clip
                {
                    
                }
                    break;
                case 3:                                 // karaoke moi nhat
                {
                    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication]delegate];
                    [app.viewController showCenterPanelAnimated:YES];
                    karaokeListViewController *listKaraView =[[karaokeListViewController alloc] initWithNibName:@"karaokeListViewController" bundle:nil];
                    [self.navigationController pushViewController:listKaraView animated:YES];
                }
                    break;
                case 4:                                 // karaoke hit
                {
                    
                }
                    break;
                case 5:                                 // ca khuc da ghi am
                {
                    NSLog(@"Record manager");
                    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication]delegate];
                    [app.viewController showCenterPanelAnimated:YES];
                    RecordManagerViewController *recordManagerView =[[RecordManagerViewController alloc] initWithNibName:@"RecordManagerViewController" bundle:nil];
                    [self.navigationController pushViewController:recordManagerView animated:YES];
                }
                    break;
                case 6:                                 // karaoke yeu thich
                {
                    
                }
                    break;
                case 7:                                 // thu am binh chon nhieu nhat
                {
                    
                }
                    break;
                case 8:                                 // ca khuc noi bat
                {
                    
                }
                    break;
                case 9:                                 // ca sy
                {
                    SingerListViewController* vc = [[SingerListViewController alloc] initWithNibName:@"SingerListViewController" bundle:nil];
                    [self.navigationController pushViewController:vc animated:YES];
                }
                    break;
                case 10:                                // the loai
                {
                    NSLog(@"The loai");
                    KindOfMusicViewController *kindMusic = [[KindOfMusicViewController alloc] initWithNibName:@"KindOfMusicViewController" bundle:Nil];
                    [self.navigationController pushViewController:kindMusic animated:YES];
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 2:                                     // NHAC DJ
            switch (indexPath.row) {
                case 0:                             // moi nhat
                {
                    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication]delegate];
                    [app.viewController showCenterPanelAnimated:YES];
                    NhacDJTinTucViewController *recordManagerView =[[NhacDJTinTucViewController alloc] initWithNibName:nil bundle:nil];
                    [self.navigationController pushViewController:recordManagerView animated:YES];
                }
                    break;
                case 1:                             // hot nhat
                {
                    
                }
                    break;
                case 2:                             // su kien noi bat
                {
                    
                }
                    break;
                default:
                    break;
            }
            break;
        case 3:                                     // TIN TUC VIDEO
            switch (indexPath.row) {
                case 0:                             // camera 360
                {
                    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication]delegate];
                    [app.viewController showCenterPanelAnimated:YES];
                    TinTucVideoViewController *TinTucVideo =[[TinTucVideoViewController alloc] initWithNibName:nil bundle:nil];
                    [self.navigationController pushViewController:TinTucVideo animated:YES];
                }
                    break;
                case 1:                             // clip gay bao
                {
                    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication]delegate];
                    [app.viewController showCenterPanelAnimated:YES];
                    TinTucVideoViewController *TinTucVideo =[[TinTucVideoViewController alloc] initWithNibName:nil bundle:nil];
                    [self.navigationController pushViewController:TinTucVideo animated:YES];
                }
                    break;
                default:
                    break;
            }
            break;
        case 4:                                         // THEM
        {
            switch (indexPath.row) {
                case 0:                                 // cai dat
                {
                    SettingViewController* vc = [[SettingViewController alloc] initWithNibName:@"SettingViewController" bundle:nil];
                    [[AppDelegate shareApplication] showViewController:vc];
                }
                    break;
                case 1:                                 // huong dan
                {
                    
                }
                    break;
                case 2:                                 // thong tin
                {
                    InfoViewController* vc = [[InfoViewController alloc] initWithNibName:@"InfoViewController" bundle:nil];
                    [[AppDelegate shareApplication] showViewController:vc];
                }
                    break;
                case 3:                                 // wap karaoke
                {
                    WapKaraViewController* vc = [[WapKaraViewController alloc] initWithNibName:@"WapKaraViewController" bundle:nil];
                    [[AppDelegate shareApplication] showViewController:vc];
                }
                    break;
                default:
                    break;
            }
        }
            break;
        default:
            break;
    }
    
}


- (IBAction)loginFacebook:(id)sender {
    
}
@end
