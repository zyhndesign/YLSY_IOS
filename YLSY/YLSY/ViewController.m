//
//  ViewController.m
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-4-16.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize btnHistory, btnHumanity, btnLandscape, btnStory, imgAppLogo;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%@",NSLocalizedString(@"TopMenuHistory", @""));
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
