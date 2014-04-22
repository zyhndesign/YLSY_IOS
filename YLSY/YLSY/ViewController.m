//
//  ViewController.m
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-4-16.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import "ViewController.h"
#import "controllers/HistoryViewController.h"
#import "controllers/LandscapeViewController.h"
#import "controllers/HumanityViewController.h"
#import "controllers/StoryViewController.h"
#import "controllers/FooterViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize btnHistory, btnHumanity, btnLandscape, btnStory, imgAppLogo,mainScrollView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [btnHistory setTitle:NSLocalizedString(@"TopMenuHistory", @"") forState:UIControlStateNormal];
    [btnLandscape setTitle:NSLocalizedString(@"TopMenuLandscape", @"") forState:UIControlStateNormal];
    [btnHumanity setTitle:NSLocalizedString(@"TopMenuHumanity", @"") forState:UIControlStateNormal];
    [btnStory setTitle:NSLocalizedString(@"TopMenuStory", @"") forState:UIControlStateNormal];
    
    NSArray *language = [NSLocale preferredLanguages];
    NSString *currentLanguage = [language objectAtIndex:0];
    if ([currentLanguage isEqualToString:@"en"])
    {
    
    }
    else
    {
        
    }
    
    CGFloat originHeight = 0.0;
    CGRect screenBounds = [[UIScreen mainScreen]bounds];
    
    historyViewController = [[HistoryViewController new] initWithNibName:@"History" bundle:nil];
    CGSize historyViewCGSize = historyViewController.view.frame.size;
    [mainScrollView addSubview:historyViewController.view];
    [self addChildViewController:historyViewController];

    landscapeViewController = [[LandscapeViewController new] initWithNibName:@"Landscape" bundle:nil];
    CGSize landscapeViewCGSize = landscapeViewController.view.frame.size;
    originHeight = originHeight + historyViewCGSize.height;
    landscapeViewController.view.frame = CGRectMake(0, originHeight,landscapeViewCGSize.width,landscapeViewCGSize.height);
    [mainScrollView addSubview:landscapeViewController.view];
    [self addChildViewController:landscapeViewController];
    
    humanityViewController = [[HumanityViewController new]initWithNibName:@"Humanity" bundle:nil];
    CGSize humanityViewCGSize = landscapeViewController.view.frame.size;
    originHeight = originHeight + landscapeViewCGSize.height;
    humanityViewController.view.frame = CGRectMake(0, originHeight,humanityViewCGSize.width,humanityViewCGSize.height);
    [mainScrollView addSubview:humanityViewController.view];
    [self addChildViewController:humanityViewController];
    
    storyViewController = [[StoryViewController new] initWithNibName:@"Story" bundle:nil];
    CGSize storyViewCGSize = storyViewController.view.frame.size;
    originHeight = originHeight + humanityViewCGSize.height;
    storyViewController.view.frame = CGRectMake(0, originHeight,storyViewCGSize.width,storyViewCGSize.height);
    [mainScrollView addSubview:storyViewController.view];
    [self addChildViewController:storyViewController];
    
    footerViewController = [[FooterViewController new] initWithNibName:@"Footer" bundle:nil];
    CGSize footerViewCGSize = footerViewController.view.frame.size;
    originHeight = originHeight + storyViewCGSize.height;
    footerViewController.view.frame = CGRectMake(0, originHeight,footerViewCGSize.width,footerViewCGSize.height);
    [mainScrollView addSubview:footerViewController.view];
    [self addChildViewController:footerViewController];
    
    CGFloat contentSizeHeight = originHeight + footerViewCGSize.height;
    
    mainScrollView.contentSize = CGSizeMake(screenBounds.size.width, contentSizeHeight);
    mainScrollView.bounces = YES;
    mainScrollView.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.screenName = @"Home Screen";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
