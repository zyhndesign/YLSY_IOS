//
//  FooterViewController.m
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-4-21.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import "FooterViewController.h"
#import "DownloadViewController.h"
#import "../libs/Reachability/Reachability.h"

@interface FooterViewController ()

@end

@implementation FooterViewController

@synthesize coRightLabel, developerLabel, downloadImage;

DownloadViewController *downloadViewController;

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
    [coRightLabel setText:NSLocalizedString(@"CopyRight", @"")];
    [developerLabel setText:NSLocalizedString(@"DeveloperCorporation", @"")];
    
    downloadImage.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(launchDownLoadPanel)];
    [downloadImage addGestureRecognizer:singleTap];
    
}

- (void)launchDownLoadPanel
{
    //弹出下载面板
    if (downloadViewController == nil)
    {
        Reachability *reacheNet = [Reachability reachabilityWithHostname:@"www.baidu.com"];
        switch ([reacheNet currentReachabilityStatus]) {
            case NotReachable: //not network reach
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Remind", @"Remind") message:NSLocalizedString(@"NetworkUnreachable", @"") delegate:nil cancelButtonTitle:NSLocalizedString(@"Confirm", @"")otherButtonTitles:nil, nil];
                [alert show];
                break;
            }
            case ReachableViaWWAN: //use 3g network
            {
                NSLog(@"3g network....");
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Remind", @"Remind") message:NSLocalizedString(@"3gwarn", @"") delegate:nil cancelButtonTitle:NSLocalizedString(@"Confirm", @"") otherButtonTitles:nil, nil];
                [alert show];
                break;
            }
            case ReachableViaWiFi: //use wifi network
            {
                downloadViewController = [[DownloadViewController alloc] initWithNibName:@"DownloadPanel" bundle:nil];
                downloadViewController.delegate = self;
                
                [[[self parentViewController] view] addSubview:downloadViewController.view];
                [downloadViewController.view setFrame:CGRectMake(0, 768, downloadViewController.view.frame.size.width, downloadViewController.view.frame.size.height)];
                
                [UIView animateWithDuration:1.0 animations:^{
                    NSLog(@"Animation start....");
                    [downloadViewController.view setFrame:CGRectMake(0, 0, downloadViewController.view.frame.size.width, downloadViewController.view.frame.size.height)];
                } completion:^(BOOL finished) {
                    NSLog(@"Animation done....");
                }];
                
                break;
            }
            default:
                break;
        }
        
    }
    
}

-(void)closeButtonClicked
{
    if (downloadViewController != nil)
    {
        [UIView animateWithDuration:1.0 animations:^{
            NSLog(@"remove Animation start....");
            [downloadViewController.view setFrame:CGRectMake(0, 768, downloadViewController.view.frame.size.width, downloadViewController.view.frame.size.height)];
        } completion:^(BOOL finished) {
            NSLog(@"remove Animation done....");
        }];
        [downloadViewController removeFromParentViewController];
        downloadViewController = nil;
    }

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
