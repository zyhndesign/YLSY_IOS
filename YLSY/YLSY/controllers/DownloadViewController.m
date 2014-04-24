//
//  DownloadViewController.m
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-4-24.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import "DownloadViewController.h"

@interface DownloadViewController ()

@end

@implementation DownloadViewController
@synthesize downloadBg, downloadCloseBtn, downloadTitle;
@synthesize videoLabel, historyLabel, landscapeLabel, humanityLabel, storyLabel;
@synthesize videoDwnResult, historyDwnResult, landscapeDwnResult, humanityDwnResult, storyDwnResult;
@synthesize videoProgress, historyProgress, storyProgress,landscapeProgress,humanityProgress;
@synthesize delegate;

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
    // Do any additional setup after loading the view.
    downloadBg.backgroundColor = [UIColor clearColor];
    [downloadTitle setText:NSLocalizedString(@"OfflineCache", @"")];
    [downloadCloseBtn setTitle:NSLocalizedString(@"Close", @"") forState:UIControlStateNormal];
    
    [videoLabel setText:NSLocalizedString(@"Video", @"Video")];
    [historyLabel setText:NSLocalizedString(@"TopMenuHistory", @"History")];
    [landscapeLabel setText:NSLocalizedString(@"TopMenuLandscape", @"Landscape")];
    [humanityLabel setText:NSLocalizedString(@"TopMenuHumanity", @"Humanity")];
    [storyLabel setText:NSLocalizedString(@"TopMenuStory", @"Story")];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)closeWin:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(closeButtonClicked)])
    {
        [self.delegate closeButtonClicked];
    }
}
@end
