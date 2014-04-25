//
//  LandscapeBoardViewController.h
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-4-24.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LandscapeBoardViewController : UIViewController
{
    IBOutlet UIView *firstView;
    IBOutlet UIImageView *firstImg;
    IBOutlet UILabel *firstLabel;
    
    IBOutlet UIView *secondView;
    IBOutlet UIImageView *secondImg;
    IBOutlet UILabel *secondLabel;
    
    IBOutlet UIView *threeView;
    IBOutlet UIImageView *threeImg;
    IBOutlet UILabel *threeLabel;
    
    IBOutlet UIView *fourView;
    IBOutlet UIImageView *fourImg;
    IBOutlet UILabel *fourLabel;
    
    IBOutlet UIView *fiveView;
    IBOutlet UIImageView *fiveImg;
    IBOutlet UILabel *fiveLabel;
}
@property (strong, nonatomic) IBOutlet UIView *firstView;
@property (strong, nonatomic) IBOutlet UIImageView *firstImg;
@property (strong, nonatomic) IBOutlet UILabel *firstLabel;

@property (strong, nonatomic) IBOutlet UIView *secondView;
@property (strong, nonatomic) IBOutlet UIImageView *secondImg;
@property (strong, nonatomic) IBOutlet UILabel *secondLabel;

@property (strong, nonatomic) IBOutlet UIView *threeView;
@property (strong, nonatomic) IBOutlet UIImageView *threeImg;
@property (strong, nonatomic) IBOutlet UILabel *threeLabel;

@property (strong, nonatomic) IBOutlet UIView *fourView;
@property (strong, nonatomic) IBOutlet UIImageView *fourImg;
@property (strong, nonatomic) IBOutlet UILabel *fourLabel;

@property (strong, nonatomic) IBOutlet UIView *fiveView;
@property (strong, nonatomic) IBOutlet UIImageView *fiveImg;
@property (strong, nonatomic) IBOutlet UILabel *fiveLabel;

@end
