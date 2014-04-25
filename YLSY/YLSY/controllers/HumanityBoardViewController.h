//
//  HumanityBoardViewController.h
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-4-24.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HumanityBoardViewController : UIViewController
{
    IBOutlet UIImageView *firstimg;
    IBOutlet UIImageView *secondImg;
    IBOutlet UIImageView *thirdImg;
    IBOutlet UIImageView *fourImg;
    
    
    IBOutlet UIView *firstView;
    IBOutlet UIView *secondView;
    IBOutlet UIView *threeView;
    IBOutlet UIView *fourView;
    
    
    IBOutlet UILabel *firstLabel1;
    IBOutlet UILabel *firstLabel2;
    IBOutlet UILabel *firstLabel3;
    
    IBOutlet UILabel *secondLabel1;
    IBOutlet UILabel *secondLabel3;
    IBOutlet UILabel *secondLabel2;
    
    IBOutlet UILabel *threeLabel1;
    IBOutlet UILabel *threeLabel2;
    IBOutlet UILabel *threeLabel3;
    
    IBOutlet UILabel *fourLabel1;
    IBOutlet UILabel *fourLabel3;
    IBOutlet UILabel *fourLabel2;
}
@property (strong, nonatomic) IBOutlet UIImageView *firstimg;
@property (strong, nonatomic) IBOutlet UIImageView *secondImg;
@property (strong, nonatomic) IBOutlet UIImageView *thirdImg;
@property (strong, nonatomic) IBOutlet UIImageView *fourImg;
@property (strong, nonatomic) IBOutlet UIView *firstView;
@property (strong, nonatomic) IBOutlet UIView *secondView;
@property (strong, nonatomic) IBOutlet UIView *threeView;
@property (strong, nonatomic) IBOutlet UIView *fourView;

@property (strong, nonatomic) IBOutlet UILabel *firstLabel1;
@property (strong, nonatomic) IBOutlet UILabel *firstLabel2;
@property (strong, nonatomic) IBOutlet UILabel *firstLabel3;

@property (strong, nonatomic) IBOutlet UILabel *secondLabel1;
@property (strong, nonatomic) IBOutlet UILabel *secondLabel3;
@property (strong, nonatomic) IBOutlet UILabel *secondLabel2;

@property (strong, nonatomic) IBOutlet UILabel *threeLabel1;
@property (strong, nonatomic) IBOutlet UILabel *threeLabel2;
@property (strong, nonatomic) IBOutlet UILabel *threeLabel3;

@property (strong, nonatomic) IBOutlet UILabel *fourLabel1;
@property (strong, nonatomic) IBOutlet UILabel *fourLabel3;
@property (strong, nonatomic) IBOutlet UILabel *fourLabel2;
@end
