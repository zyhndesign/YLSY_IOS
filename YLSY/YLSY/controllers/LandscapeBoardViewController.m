//
//  LandscapeBoardViewController.m
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-4-24.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import "LandscapeBoardViewController.h"
#import "DetailViewController.h"
#import "../libs/MJPopup/UIViewController+MJPopupViewController.h"

@interface LandscapeBoardViewController ()<MJPopupDelegate>

@end

@implementation LandscapeBoardViewController

@synthesize firstImg, firstLabel, firstView;
@synthesize secondImg, secondLabel, secondView;
@synthesize threeImg, threeLabel, threeView;
@synthesize fourImg, fourLabel, fourView;
@synthesize fiveImg, fiveLabel, fiveView;

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
@end
