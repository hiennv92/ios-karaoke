//
//  RecordManagerViewController.m
//  Karaoke
//
//  Created by Trinh Van Duong on 1/5/14.
//  Copyright (c) 2014 banana. All rights reserved.
//

#import "RecordManagerViewController.h"
#import "Cell.h"

@interface RecordManagerViewController ()

@end

@implementation RecordManagerViewController

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
    [self createNavigationBarWithTitle:Nil backgroundImage:@"bg-top-home.png" leftButton:@"menu.png" leftButtonPress:Nil rightButton:Nil rightButtonPress:Nil];
    [self addTitleNavibar:@"Ghi âm" andSize:22];
    [self setBottomBarViewHidden:YES];
    
    [self._tableView registerNib:[UINib nibWithNibName:@"CellRecord" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"CellRecord"];
    CGRect frame = self._tableView.frame;
    frame.origin.y += 44;
    [self._tableView setFrame:frame];
    
    //Get list files recorded
    _dataRecords = [[NSMutableArray alloc] initWithArray:[self getListFileRecorded]];   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataRecords count];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell setBackgroundColor:[UIColor clearColor]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellRecord";
    Cell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[Cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    cell._nameRecord.text = [_dataRecords objectAtIndex:[indexPath row]];
    cell._infoRecord.text = [self getTimeModified:cell._nameRecord.text];
    
    return cell;
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0]; // Get documents folder
    NSString * documentsPath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"/RecordedFiles/%@",[_dataRecords objectAtIndex:[indexPath row]]]];
    _pathFileRecord = [NSURL fileURLWithPath:documentsPath];
}

-(void)leftButtonBarPress:(id)button{
    [self.navigationController popToRootViewControllerAnimated:YES];
    [((AppDelegate*)[[UIApplication sharedApplication]delegate]).viewController showCenterPanelAnimated:NO];
}

//Get list of files were saved
- (NSArray*)getListFileRecorded{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0]; // Get documents folder
    NSString * documentsPath = [documentsDirectory stringByAppendingPathComponent:@"/RecordedFiles"];

    NSError * error;
    NSArray * directoryContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:documentsPath error:&error];
    
    return directoryContents;
}

//Get time file create
- (NSString*)getTimeModified:(NSString*)nameFile{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0]; // Get documents folder
    NSString * documentsPath = [documentsDirectory stringByAppendingPathComponent:@"/RecordedFiles"];
    
    NSString *filestring = [documentsPath stringByAppendingFormat:@"/%@",nameFile];
    NSDictionary *filePathsArray1 = [[NSFileManager defaultManager] attributesOfItemAtPath:filestring error:nil];
    
    NSString *tmp = [NSString stringWithFormat:@"%@",[filePathsArray1 objectForKey:NSFileCreationDate]];
    return tmp;
}

- (IBAction)playRecordController:(id)sender {
//    NSLog(@"%@",_pathFileRecord);
    if(!player.isPlaying){
        AVAudioPlayer *avAudioObj = [[AVAudioPlayer alloc] initWithContentsOfURL:_pathFileRecord error:nil];
        player = avAudioObj;
        [player setDelegate:self];
        [avAudioObj prepareToPlay];
        [avAudioObj play];
    }
}

- (IBAction)stopPlayRecordController:(id)sender {
    [player stop];
}

- (IBAction)shareFaceBookController:(id)sender {
}

- (IBAction)sentEmailController:(id)sender {
}

- (IBAction)smsController:(id)sender {
}

- (IBAction)addToTopRecordsController:(id)sender {
}
@end
