//
//  StoryBoardViewController.m
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-4-24.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import "StoryBoardViewController.h"
#import "UIImageView+ImageUtils.h"
#import "DetailViewController.h"
#import "../libs/MJPopup/UIViewController+MJPopupViewController.h"

@interface StoryBoardViewController ()<MJPopupDelegate>

@end

@implementation StoryBoardViewController

@synthesize firstImg,secondImg,thirdImg,fourImg;
@synthesize fiveImg,sixImg,sevenImg,eightImg;

@synthesize firstView, secondView, threeView, fourView;
@synthesize fiveView, sixView, sevenView, eightView;

extern DetailViewController *detailViewController;

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
    [firstImg addFrameWithImage];
    [sevenImg addFrameWithImage];
    [thirdImg addFrameWithImage];
    [fiveImg addFrameWithImage];
    [secondImg addFrameWithImage];
    [fourImg addFrameWithImage];
    [sixImg addFrameWithImage];
    [eightImg addFrameWithImage];
}

- (void)panelClick:(id)sender
{
    if (detailViewController == nil)
    {
        detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailPanel" bundle:nil articleId:[sender accessibilityLabel]];
        detailViewController.delegate = self;
        [self presentPopupViewController:detailViewController animationType:MJPopupViewAnimationSlideRightLeft];
    }
}

- (void) closeButtonClicked
{
    [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationSlideLeftRight];
    detailViewController = nil;
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

@end
