//
//  ViewController.h
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-4-16.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"

@interface ViewController : GAITrackedViewController
{
    IBOutlet UIButton *btnHistory;
    
    IBOutlet UIButton *btnLandscape;
    
    IBOutlet UIButton *btnHumanity;
    
    IBOutlet UIButton *btnStory;
    
    IBOutlet UIImageView *imgAppLogo;
}

@property (nonatomic,strong) IBOutlet UIButton *btnHistory;
@property (nonatomic,strong) IBOutlet UIButton *btnLandscape;
@property (nonatomic,strong) IBOutlet UIButton *btnHumanity;
@property (nonatomic,strong) IBOutlet UIButton *btnStory;
@property (nonatomic,strong) IBOutlet UIImageView *imgAppLogo;
@end
