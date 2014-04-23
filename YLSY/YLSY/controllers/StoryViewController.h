//
//  StoryViewController.h
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-4-21.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoryViewController : UIViewController
{
    IBOutlet UIView *storyBgView;
    IBOutlet UIScrollView *storyScrollView;
    IBOutlet UIPageControl *storyPageControll;
}
@property (strong, nonatomic) IBOutlet UIView *storyBgView;
@property (strong, nonatomic) IBOutlet UIScrollView *storyScrollView;
@property (strong, nonatomic) IBOutlet UIPageControl *storyPageControll;

@end
