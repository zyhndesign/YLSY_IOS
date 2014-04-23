//
//  LandscapeViewController.h
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-4-21.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LandscapeViewController : UIViewController<UIScrollViewDelegate>
{
    IBOutlet UIView *bgView;
    IBOutlet UIScrollView *landscapeScrollView;
    IBOutlet UIPageControl *landscapePageControll;
    
    int currentPage;
    int countPage;
    BOOL pageControlBeingUsed;
    
    NSMutableDictionary *muDistionary;
}
@property (strong, nonatomic) IBOutlet UIView *bgView;
@property (strong, nonatomic) IBOutlet UIScrollView *landscapeScrollView;
@property (strong, nonatomic) IBOutlet UIPageControl *landscapePageControll;

-(void) addNewModelInScrollView:(int) pageNum;

-(void) removeOldModelInScrollView:(int)pageNum;

- (IBAction)changePage:(id)sender;

@end
