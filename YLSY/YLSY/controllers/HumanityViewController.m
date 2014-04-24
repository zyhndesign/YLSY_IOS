//
//  HumanityViewController.m
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-4-21.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import "HumanityViewController.h"
#import "HumanityBoardViewController.h"

@interface HumanityViewController ()

@end

@implementation HumanityViewController

@synthesize  bgHumanityView, humanityLeftImg, humanityPageControll, humanityRightImg, humanityScrollView;

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
    
    [bgHumanityView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"humanitybackground.png"]]];
    
    humanityScrollView.delegate = self;
    
    muDistionary = [NSMutableDictionary dictionaryWithCapacity:4];
    countPage = 10;
    currentPage = 0;
    self.humanityScrollView.contentSize = CGSizeMake(self.humanityScrollView.frame.size.width * countPage, self.humanityScrollView.frame.size.height);
    humanityScrollView.backgroundColor = [UIColor clearColor];
    
    for (int i = 0; i < 2; i++)
    {
        if (i <= countPage)
        {
            [self assemblePanel:i];
        }
    }   
    
    humanityPageControll.currentPage = 0;
    humanityPageControll.numberOfPages = countPage;
    
    pageControlBeingUsed = NO;

}

-(void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (!pageControlBeingUsed)
    {
        CGFloat pageWidth = self.humanityScrollView.frame.size.width;
        currentPage = floor((humanityScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
        humanityPageControll.currentPage = currentPage;
    }
}

-(void) scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self addNewModelInScrollView:currentPage];
    pageControlBeingUsed = NO;
}

-(void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self removeOldModelInScrollView:currentPage];
    pageControlBeingUsed = NO;
}

-(void) addNewModelInScrollView:(int)pageNum
{
    if (nil != humanityScrollView)
    {
        NSLog(@"currentPage : %i",currentPage);
        
        UIView* subview3 = [muDistionary objectForKey:[NSNumber numberWithInt:(pageNum + 1)]];
        if (nil == subview3 && (pageNum + 1 < countPage))
        {
            [self assemblePanel:(pageNum + 1)];
        }
        
        UIView* subview4 = [muDistionary objectForKey:[NSNumber numberWithInt:(pageNum - 1)]];
        if (nil == subview4 && (pageNum - 1 >= 0))
        {
            
            [self assemblePanel:(pageNum - 1)];
        }
    }
}

-(void) assemblePanel:(int) pageNum
{
    NSLog(@"humanity add view with ID: %i",(pageNum));
    
    CGRect frame;
    HumanityBoardViewController *humanityBoardViewController = [[HumanityBoardViewController new] initWithNibName:@"HumanityBoard" bundle:nil];
    
    [self addChildViewController:humanityBoardViewController];
    
    humanityBoardViewController.view.backgroundColor = [UIColor clearColor];
    
    frame.origin.x = self.humanityScrollView.frame.size.width * (pageNum);
    frame.origin.y = 20;
    frame.size.width = self.humanityScrollView.frame.size.width;
    frame.size.height = humanityBoardViewController.view.frame.size.height;
    
    humanityBoardViewController.view.frame = frame;
    [self.humanityScrollView addSubview:humanityBoardViewController.view];
    [muDistionary setObject:humanityBoardViewController.view forKey:[NSNumber  numberWithInt:(pageNum)]];
}

-(void) removeOldModelInScrollView:(int)pageNum
{
    UIView* subview1 = [muDistionary objectForKey:[NSNumber numberWithInt:(pageNum + 2)]];
    if (nil != subview1 && (pageNum + 2) < countPage)
    {
        NSLog(@"remove view with ID: %i",(pageNum + 2));
        [subview1 removeFromSuperview];
        [muDistionary removeObjectForKey:[NSNumber numberWithInt:(pageNum + 2)]];
    }
    
    UIView* subview2 = [muDistionary objectForKey:[NSNumber numberWithInt:(pageNum - 2)]];
    if (nil != subview2 && (pageNum - 2 >= 0))
    {
        NSLog(@"remove view with ID: %i",(pageNum - 2));
        [subview2 removeFromSuperview];
        [muDistionary removeObjectForKey:[NSNumber numberWithInt:(pageNum - 2)]];
    }
}

- (IBAction)changepage:(id)sender
{
    pageControlBeingUsed = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
