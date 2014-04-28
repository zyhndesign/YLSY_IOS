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
#import "libs/MJPopup/UIViewController+MJPopupViewController.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize btnHistory, btnHumanity, btnLandscape, btnStory, imgAppLogo,mainScrollView;
@synthesize landscapeUnderline, historyUnderline, humanityUnderline, storyUnderline;

DetailViewController *detailViewController;

- (void)viewDidLoad
{
    NSLog(@"View did load");
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
    historyYValue = mainScrollView.frame.size.height;
    
    [mainScrollView addSubview:historyViewController.view];
    [self addChildViewController:historyViewController];

    landscapeViewController = [[LandscapeViewController new] initWithNibName:@"Landscape" bundle:nil];
    CGSize landscapeViewCGSize = landscapeViewController.view.frame.size;
    originHeight = originHeight + historyViewCGSize.height;
    landscapeYValue = originHeight;
    
    landscapeViewController.view.frame = CGRectMake(0, originHeight,landscapeViewCGSize.width,landscapeViewCGSize.height);
    [mainScrollView addSubview:landscapeViewController.view];
    [self addChildViewController:landscapeViewController];
    
    humanityViewController = [[HumanityViewController new]initWithNibName:@"Humanity" bundle:nil];
    CGSize humanityViewCGSize = landscapeViewController.view.frame.size;
    originHeight = originHeight + landscapeViewCGSize.height;
    humanityYValue = originHeight;
    
    humanityViewController.view.frame = CGRectMake(0, originHeight,humanityViewCGSize.width,humanityViewCGSize.height);
    [mainScrollView addSubview:humanityViewController.view];
    [self addChildViewController:humanityViewController];
    
    storyViewController = [[StoryViewController new] initWithNibName:@"Story" bundle:nil];
    CGSize storyViewCGSize = storyViewController.view.frame.size;
    originHeight = originHeight + humanityViewCGSize.height;
    storyYValue = originHeight;
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
    
    imgAppLogo.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(logoOnClick)];
    [imgAppLogo addGestureRecognizer:singleTap];
    
    [landscapeUnderline setHidden:YES];
    [humanityUnderline setHidden:YES];
    [storyUnderline setHidden:YES];
    
    scrollSign = NO;
}

-(void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"view did disappear");
    [super viewDidDisappear:animated];
}

-(void)viewDidAppear:(BOOL)animated
{
    NSLog(@"view did appear");
    [super viewDidAppear:animated];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.screenName = @"Home Screen";
    NSLog(@"view will appear");
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"view will disappear");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnHistoryClick:(id)sender
{
    [mainScrollView setContentOffset:CGPointMake(mainScrollView.frame.origin.x, historyYValue) animated:YES];
    
    [self programaUnderlineOperation:sender];
}

- (IBAction)btnLandscapeClick:(id)sender
{
    [mainScrollView setContentOffset:CGPointMake(mainScrollView.frame.origin.x, landscapeYValue) animated:YES];
    [self programaUnderlineOperation:sender];
}

- (IBAction)btnHumanityClick:(id)sender
{
    [mainScrollView setContentOffset:CGPointMake(mainScrollView.frame.origin.x, humanityYValue) animated:YES];
    
    [self programaUnderlineOperation:sender];
}

- (IBAction)btnStoryClick:(id)sender
{
    [mainScrollView setContentOffset:CGPointMake(mainScrollView.frame.origin.x, storyYValue) animated:YES];
    [self programaUnderlineOperation:sender];
}

-(void)logoOnClick
{
    [mainScrollView setContentOffset:CGPointMake(mainScrollView.frame.origin.x, 0) animated:YES];
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    scrollSign = YES;
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    scrollSign = NO;
}

-(void)programaUnderlineOperation:(UIButton *) btn
{
    if ([historyUnderline isHidden] && [btn isEqual:btnHistory])
    {
        [self setUnderLineSelectState:YES Landscape:NO Humanity:NO Story:NO];
    }
    else if ([landscapeUnderline isHidden] && [btn isEqual:btnLandscape])
    {
        [self setUnderLineSelectState:NO Landscape:YES Humanity:NO Story:NO];
    }
    else if ([humanityUnderline isHidden] && [btn isEqual:btnHumanity])
    {
        [self setUnderLineSelectState:NO Landscape:NO Humanity:YES Story:NO];
    }
    else if ([storyUnderline isHidden] && [btn isEqual:btnStory])
    {
        [self setUnderLineSelectState:NO Landscape:NO Humanity:NO Story:YES];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)_scrollView
{
    if (scrollSign)
    {
        CGFloat offsetY = _scrollView.contentOffset.y;
        
        if (offsetY >= historyYValue && offsetY < landscapeYValue)
        {
            [self setUnderLineSelectState:YES Landscape:NO Humanity:NO Story:NO];
        }
        else if (offsetY >= landscapeYValue && offsetY < humanityYValue)
        {
            [self setUnderLineSelectState:NO Landscape:YES Humanity:NO Story:NO];
        }
        else if (offsetY >= humanityYValue && offsetY < storyYValue)
        {
            [self setUnderLineSelectState:NO Landscape:NO Humanity:YES Story:NO];
        }
        else if (offsetY >= storyYValue)
        {
            [self setUnderLineSelectState:NO Landscape:NO Humanity:NO Story:YES];
        }

    }
    
}

- (void) setUnderLineSelectState:(BOOL)historyUnderlineState
                       Landscape:(BOOL)landscapeUnderlineState
                        Humanity:(BOOL)humanityUnderlineState
                           Story:(BOOL)storyUnderlineState
{
    if (historyUnderlineState && historyUnderline != nil)
    {
        [historyUnderline setHidden:NO];
        [landscapeUnderline setHidden:YES];
        [humanityUnderline setHidden:YES];
        [storyUnderline setHidden:YES];
    }
    else if (landscapeUnderlineState && landscapeUnderline != nil)
    {
        [historyUnderline setHidden:YES];
        [landscapeUnderline setHidden:NO];
        [humanityUnderline setHidden:YES];
        [storyUnderline setHidden:YES];
    }
    else if (humanityUnderlineState && humanityUnderline != nil)
    {
        [historyUnderline setHidden:YES];
        [landscapeUnderline setHidden:YES];
        [humanityUnderline setHidden:NO];
        [storyUnderline setHidden:YES];
    }
    else if (storyUnderlineState && storyUnderline != nil)
    {
        [historyUnderline setHidden:YES];
        [landscapeUnderline setHidden:YES];
        [humanityUnderline setHidden:YES];
        [storyUnderline setHidden:NO];
    }
   
}
@end
