//
//  DetailViewController.h
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-4-28.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../libs/googleAnalytics/GAI.h"

@protocol MJPopupDelegate <NSObject>
@required
-(void)closeButtonClicked;
@end

@interface DetailViewController : GAITrackedViewController
{
    NSString *articleId;
    IBOutlet UIWebView *webView;
}
@property (strong, nonatomic) NSString *articleId;
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) id<MJPopupDelegate> delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil articleId:(NSString *)articleId;

- (IBAction)closeBtnClick:(id)sender;
@end
