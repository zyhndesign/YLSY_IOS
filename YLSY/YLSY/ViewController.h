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
    /**
     *  five button on the top banner,include app logo
     */
    IBOutlet UIButton *btnHistory;
    IBOutlet UIButton *btnLandscape;
    IBOutlet UIButton *btnHumanity;
    IBOutlet UIButton *btnStory;
    IBOutlet UIImageView *imgAppLogo;
    
    
    /**
     *  underline for four programa
     */
    IBOutlet UIImageView *historyUnderline;
    IBOutlet UIImageView *landscapeUnderline;
    IBOutlet UIImageView *humanityUnderline;
    IBOutlet UIImageView *storyUnderline;
    
    
    /**
     *  five controller for the five view
     */
    HistoryViewController *historyViewController;
    LandscapeViewController *landscapeViewController;
    HumanityViewController *humanityViewController;
    StoryViewController *storyViewController;
    FooterViewController *footerViewController;
    
    IBOutlet UIScrollView *mainScrollView;
    
    /**
     *  save four programa y-axis value to use for scroll appoint value
     */
    int landscapeYValue;
    int humanityYValue;
    int storyYValue;
    int historyYValue;
}

@property (nonatomic,strong) IBOutlet UIButton *btnHistory;
@property (nonatomic,strong) IBOutlet UIButton *btnLandscape;
@property (nonatomic,strong) IBOutlet UIButton *btnHumanity;
@property (nonatomic,strong) IBOutlet UIButton *btnStory;
@property (nonatomic,strong) IBOutlet UIImageView *imgAppLogo;
@property (nonatomic,strong) IBOutlet UIScrollView *mainScrollView;
@property (nonatomic,strong) IBOutlet UIImageView *historyUnderline;
@property (nonatomic,strong) IBOutlet UIImageView *landscapeUnderline;
@property (nonatomic,strong) IBOutlet UIImageView *humanityUnderline;
@property (nonatomic,strong) IBOutlet UIImageView *storyUnderline;

/**
 *  history button click event
 *  automic scroll mainScrollView to appoint y-axis value
 *  @param sender <#sender description#>
 */
- (IBAction)btnHistoryClick:(id)sender;

/**
 *  landscape button click event
 *  automic scroll mainScrollView to appoint y-axis value
 *  @param sender <#sender description#>
 */
- (IBAction)btnLandscapeClick:(id)sender;

/**
 *  humanity button click event
 * automic scroll mainScrollView to appoint y-axis value
 *  @param sender <#sender description#>
 */
- (IBAction)btnHumanityClick:(id)sender;

/**
 *  story button click event
 * automic scroll mainScrollView to appoint y-axis value
 *  @param sender <#sender description#>
 */
- (IBAction)btnStoryClick:(id)sender;

/**
 *  logo image click event
 *  automic scroll mainScrollView to appoint y-axis value
 */
-(void)logoOnClick;

/**
 *  according to four programa status. hidden or display the underline
 */
-(void)programaUnderlineOperation:(UIButton *) btn;

/**
 *  according to state, set underline image hidden or display
 *
 *  @param historyUnderlineState   history button underline state
 *  @param landscapeUnderlineState landscape button underline state
 *  @param humanityUnderlineState  humanity button underline state
 *  @param storyUnderlineState     story button underline state
 */
- (void) setUnderLineSelectState:(BOOL)historyUnderlineState
                       Landscape:(BOOL)landscapeUnderlineState
                        Humanity:(BOOL)humanityUnderlineState
                           Story:(BOOL)storyUnderlineState;
@end
