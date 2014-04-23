//
//  HumanityViewController.h
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-4-21.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HumanityViewController : UIViewController<UIScrollViewDelegate>
{
    IBOutlet UIScrollView *humanityScrollView;

    IBOutlet UIPageControl *humanityPageControll;
    
    IBOutlet UIImageView *humanityLeftImg;
    
    IBOutlet UIImageView *humanityRightImg;
    
    int currentPage;
    int countPage;
    BOOL pageControlBeingUsed;
    
    NSMutableDictionary *muDistionary;
}
@property (strong, nonatomic) IBOutlet UIScrollView *humanityScrollView;

@property (strong, nonatomic) IBOutlet UIPageControl *humanityPageControll;

@property (strong, nonatomic) IBOutlet UIImageView *humanityLeftImg;

@property (strong, nonatomic) IBOutlet UIImageView *humanityRightImg;

-(void) addNewModelInScrollView:(int) pageNum;

-(void) removeOldModelInScrollView:(int)pageNum;

- (IBAction)changepage:(id)sender;

@end
