//
//  DownloadViewController.h
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-4-24.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DownloadProtocol <NSObject>

- (void) closeButtonClicked;

@end

@interface DownloadViewController : UIViewController
{
    IBOutlet UIView *downloadBg;
    IBOutlet UILabel *downloadTitle;
    IBOutlet UIButton *downloadCloseBtn;
    
    /**
     *  first column title
     */
    IBOutlet UILabel *videoLabel;
    IBOutlet UILabel *historyLabel;
    IBOutlet UILabel *landscapeLabel;
    IBOutlet UILabel *humanityLabel;
    IBOutlet UILabel *storyLabel;
    
    /**
     *  second column download result
     */
    IBOutlet UILabel *videoDwnResult;
    IBOutlet UILabel *historyDwnResult;
    IBOutlet UILabel *landscapeDwnResult;
    IBOutlet UILabel *humanityDwnResult;
    IBOutlet UILabel *storyDwnResult;
    
    /**
     *  third column progress
     */
    IBOutlet UILabel *videoProgress;
    IBOutlet UILabel *historyProgress;
    IBOutlet UILabel *storyProgress;
    IBOutlet UILabel *humanityProgress;
    IBOutlet UILabel *landscapeProgress;
    
    id delegate;
}
@property (strong, nonatomic) IBOutlet UIView *downloadBg;
@property (strong, nonatomic) IBOutlet UILabel *downloadTitle;
@property (strong, nonatomic) IBOutlet UIButton *downloadCloseBtn;

@property (strong, nonatomic) IBOutlet UILabel *videoLabel;
@property (strong, nonatomic) IBOutlet UILabel *historyLabel;
@property (strong, nonatomic) IBOutlet UILabel *landscapeLabel;
@property (strong, nonatomic) IBOutlet UILabel *humanityLabel;
@property (strong, nonatomic) IBOutlet UILabel *storyLabel;

@property (strong, nonatomic) IBOutlet UILabel *videoDwnResult;
@property (strong, nonatomic) IBOutlet UILabel *historyDwnResult;
@property (strong, nonatomic) IBOutlet UILabel *landscapeDwnResult;
@property (strong, nonatomic) IBOutlet UILabel *humanityDwnResult;
@property (strong, nonatomic) IBOutlet UILabel *storyDwnResult;

@property (strong, nonatomic) IBOutlet UILabel *videoProgress;
@property (strong, nonatomic) IBOutlet UILabel *historyProgress;
@property (strong, nonatomic) IBOutlet UILabel *storyProgress;
@property (strong, nonatomic) IBOutlet UILabel *humanityProgress;
@property (strong, nonatomic) IBOutlet UILabel *landscapeProgress;
@property (strong, nonatomic) id delegate;

- (IBAction)closeWin:(id)sender;

@end
