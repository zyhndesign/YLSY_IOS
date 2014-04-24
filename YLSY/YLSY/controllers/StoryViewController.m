//
//  StoryViewController.m
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-4-21.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import "StoryViewController.h"
#import "UIImageView+ImageUtils.h"

@interface StoryViewController ()

@end

@implementation StoryViewController

@synthesize storyBgView, storyPageControll, storyScrollView;

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
    
    storyBgView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"artifactsbackground.png"]];
   
    storyScrollView.delegate = self;
    storyScrollView.backgroundColor = [UIColor clearColor];
    
    muDistionary = [NSMutableDictionary dictionaryWithCapacity:4];
    countPage = 10;
    currentPage = 0;
    
    self.storyScrollView.contentSize = CGSizeMake(self.storyScrollView.frame.size.width * countPage, self.storyScrollView.frame.size.height);
    
    for (int i = 0; i < 2; i++)
    {
        if (i <= countPage)
        {
            [self assemblePanel:i];
        }
    }
    
    storyPageControll.currentPage = 0;
    storyPageControll.numberOfPages = countPage;
    
    pageControlBeingUsed = NO;

}

-(void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (!pageControlBeingUsed)
    {
        CGFloat pageWidth = self.storyScrollView.frame.size.width;
        currentPage = floor((storyScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
        storyPageControll.currentPage = currentPage;
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
    if (nil != storyScrollView)
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

-(void) assemblePanel:(int) pageNum
{
    NSLog(@"story add view with ID: %i",(pageNum));
    
    NSBundle *bundle = [NSBundle mainBundle];
    //NSMutableArray * muArray = [db getLandscapeDataByPage:pageNum];
    
    CGRect frame;
    UIView *subview = [[bundle loadNibNamed:@"StoryBoard" owner:self options:nil] lastObject];
    subview.backgroundColor = [UIColor clearColor];
    
    frame.origin.x = self.storyScrollView.frame.size.width * (pageNum);
    frame.origin.y = 0;
    frame.size.width = self.storyScrollView.frame.size.width;
    frame.size.height = subview.frame.size.height;
    if (subview != nil)
    {
        //UIControl *firstPanel = (UIControl*)[subview viewWithTag:318];
        //UIControl *secondPanel = (UIControl*)[subview viewWithTag:319];
        //UIControl *thirdPanel = (UIControl*)[subview viewWithTag:320];
        //UIControl *fourPanel = (UIControl*)[subview viewWithTag:321];
        subview.frame = frame;
        
        UIImageView *firstImg = (UIImageView *)[subview viewWithTag:501];
        UIImageView *secondImg = (UIImageView *)[subview viewWithTag:505];
        UIImageView *thirdImg = (UIImageView *)[subview viewWithTag:510];
        UIImageView *fourImg = (UIImageView *)[subview viewWithTag:515];
        UIImageView *fiveImg = (UIImageView *)[subview viewWithTag:520];
        UIImageView *sixImg = (UIImageView *)[subview viewWithTag:525];
        UIImageView *sevenImg = (UIImageView *)[subview viewWithTag:530];
        UIImageView *eightImg = (UIImageView *)[subview viewWithTag:535];
        [firstImg addFrameWithImage];
        [secondImg addFrameWithImage];
        [thirdImg addFrameWithImage];
        [fourImg addFrameWithImage];
        [fiveImg addFrameWithImage];
        [sixImg addFrameWithImage];
        [sevenImg addFrameWithImage];
        [eightImg addFrameWithImage];
        
        [self.storyScrollView addSubview:subview];
        
        [muDistionary setObject:subview forKey:[NSNumber  numberWithInt:(pageNum)]];
    }
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
