//
//  ViewController.h
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-4-16.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"

@class HistoryViewController;
@class LandscapeViewController;
@class HumanityViewController;
@class StoryViewController;
@class FooterViewController;

@interface ViewController : GAITrackedViewController<UIScrollViewDelegate>
{
    IBOutlet UIButton *btnHistory;
    
    IBOutlet UIButton *btnLandscape;
    
    IBOutlet UIButton *btnHumanity;
    
    IBOutlet UIButton *btnStory;
    
    IBOutlet UIImageView *imgAppLogo;
    
    HistoryViewController *historyViewController;
    LandscapeViewController *landscapeViewController;
    HumanityViewController *humanityViewController;
    StoryViewController *storyViewController;
    FooterViewController *footerViewController;
    
    IBOutlet UIScrollView *mainScrollView;
}

@property (nonatomic,strong) IBOutlet UIButton *btnHistory;
@property (nonatomic,strong) IBOutlet UIButton *btnLandscape;
@property (nonatomic,strong) IBOutlet UIButton *btnHumanity;
@property (nonatomic,strong) IBOutlet UIButton *btnStory;
@property (nonatomic,strong) IBOutlet UIImageView *imgAppLogo;
@property (nonatomic,strong) IBOutlet UIScrollView *mainScrollView;
@end
