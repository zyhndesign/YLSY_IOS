//
//  FooterViewController.h
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-4-21.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DownloadViewController.h"

@interface FooterViewController : UIViewController<DownloadProtocol>
{
    
    IBOutlet UILabel *coRightLabel;
    IBOutlet UILabel *developerLabel;
    IBOutlet UIImageView *downloadImage;
}

@property (strong, nonatomic) IBOutlet UILabel *developerLabel;
@property (strong, nonatomic) IBOutlet UILabel *coRightLabel;
@property (strong, nonatomic) IBOutlet UIImageView *downloadImage;
@end
