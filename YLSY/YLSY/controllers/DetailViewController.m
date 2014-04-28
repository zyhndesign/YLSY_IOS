//
//  DetailViewController.m
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-4-28.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize articleId, webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil articleId:(NSString *)_articleId
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    self.articleId = _articleId;
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)closeBtnClick:(id)sender
{
    if ([webView canGoBack])
    {
        [webView goBack];
    }
    else
    {
        if (self.delegate && [self.delegate respondsToSelector:@selector(closeButtonClicked)])
        {
            [self.delegate closeButtonClicked];
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)webView:(UIWebView *)_webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"webview loading file is error...%@",[error localizedFailureReason]);
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"404" ofType:@"html"];
    NSURL *url = [NSURL URLWithString:filePath relativeToURL:[NSURL fileURLWithPath:[filePath stringByDeletingLastPathComponent] isDirectory:YES]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}

-(void)webViewDidStartLoad:(UIWebView *)_webView
{
    
}

-(void)webViewDidFinishLoad:(UIWebView *)_webView
{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
