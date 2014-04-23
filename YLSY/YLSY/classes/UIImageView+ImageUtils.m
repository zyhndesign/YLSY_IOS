//
//  UIImageView+ImageUtils.m
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-4-23.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import "UIImageView+ImageUtils.h"

@implementation UIImageView (ImageUtils)

-(void) addFrameWithImage
{
    
    CALayer *layer = [self layer];
    layer.borderColor = [[UIColor whiteColor] CGColor];
    
    layer.borderWidth = 5.0f;
    
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 0);
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowRadius = 10.0;
}

@end
