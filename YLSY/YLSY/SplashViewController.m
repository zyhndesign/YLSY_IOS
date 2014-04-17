//
//  SplashViewController.m
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-4-16.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import "SplashViewController.h"
#import "ViewController.h"

@interface SplashViewController ()

@end

@implementation SplashViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIActivityIndicatorView* aiv = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(482, 643, 80, 80)];
    aiv.activityIndicatorViewStyle= UIActivityIndicatorViewStyleWhiteLarge;
    [aiv startAnimating];
    [self.view addSubview:aiv];
}

-(void) viewDidAppear:(BOOL)animated
{
    [self performSelector:@selector(launchMainPage) withObject:nil afterDelay:3.0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) launchMainPage
{
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *viewController = [mainStoryBoard instantiateViewControllerWithIdentifier:@"ViewController"];
    [self presentViewController:viewController animated:YES completion:nil];
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
