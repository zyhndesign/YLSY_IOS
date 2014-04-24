//
//  LandscapeViewController.m
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-4-21.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import "LandscapeViewController.h"
#import "LandscapeBoardViewController.h"

@interface LandscapeViewController ()

@end

@implementation LandscapeViewController

@synthesize bgView, landscapePageControll, landscapeScrollView;

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
    
    bgView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"landscapsbackground.png"]];
    
    landscapeScrollView.delegate = self;
    
    muDistionary = [NSMutableDictionary dictionaryWithCapacity:4];
    countPage = 10;
    currentPage = 0;
    
    self.landscapeScrollView.contentSize = CGSizeMake(self.landscapeScrollView.frame.size.width * countPage, self.landscapeScrollView.frame.size.height);
    
    for (int i = 0; i < 2; i++)
    {
        if (i <= countPage)
        {
            [self assemblePanel:i];
        }
    }    
    
    landscapeScrollView.backgroundColor = [UIColor clearColor];
    landscapePageControll.currentPage = 0;
    landscapePageControll.numberOfPages = countPage;
    
    pageControlBeingUsed = NO;
}

-(void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (!pageControlBeingUsed)
    {
        CGFloat pageWidth = self.landscapeScrollView.frame.size.width;
        currentPage = floor((landscapeScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
        landscapePageControll.currentPage = currentPage;
    }
}

-(void) scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"Begin Dragging.....");
    [self addNewModelInScrollView:currentPage];
    pageControlBeingUsed = NO;
}

-(void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"End Dragging.....");
    [self removeOldModelInScrollView:currentPage];
    pageControlBeingUsed = NO;
}

-(void) addNewModelInScrollView:(int)pageNum
{
    if (nil != landscapeScrollView)
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
    NSLog(@"landscape add view with ID: %i",(pageNum));
    
    //NSBundle *bundle = [NSBundle mainBundle];
    //NSMutableArray * muArray = [db getLandscapeDataByPage:pageNum];
    
    CGRect frame;
    LandscapeBoardViewController *landscapeBoardViewController = [[LandscapeBoardViewController new] initWithNibName:@"LandscapeBoard" bundle:nil];
    
    [self addChildViewController:landscapeBoardViewController];
    
    landscapeBoardViewController.view.backgroundColor = [UIColor clearColor];
    
    frame.origin.x = self.landscapeScrollView.frame.size.width * (pageNum);
    frame.origin.y = 20;
    frame.size.width = self.landscapeScrollView.frame.size.width;
    frame.size.height = landscapeBoardViewController.view.frame.size.height;
    
    landscapeBoardViewController.view.frame = frame;
    [self.landscapeScrollView addSubview:landscapeBoardViewController.view];
    [muDistionary setObject:landscapeBoardViewController.view forKey:[NSNumber  numberWithInt:(pageNum)]];
    
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

- (IBAction)changePage:(id)sender
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
