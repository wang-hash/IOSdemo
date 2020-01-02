//
//  CGRecommendViewController.m
//  Hello world
//
//  Created by wangjingru on 2019/12/31.
//  Copyright © 2019 wangjingru. All rights reserved.
//

#import "CGRecommendViewController.h"

@interface CGRecommendViewController ()<UIScrollViewDelegate>

@end

@implementation CGRecommendViewController

-(id) init{
    self = [super init];
    if(self){
        self.tabBarItem.title = @"推荐";
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
//    NSLog(@"bounds x %f y %f, width %f, height %@",self.view.bounds.origin.x,self.view.bounds.origin.y,self.view.bounds.size.height,@(self.view.bounds.size.width));
//    NSLog(@"frame x %f, Y %f, height %f, width %f",self.view.frame.origin.x,self.view.frame.origin.y,self.view.frame.size.height,self.view.frame.size.width);
    scrollView.backgroundColor = [UIColor lightGrayColor];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width*5, self.view.bounds.size.height);
    scrollView.delegate = self;
    NSArray *colorArray = @[[UIColor redColor], [UIColor blueColor], [UIColor yellowColor],
                            [UIColor lightGrayColor],[UIColor grayColor]];
    
    for(int i=0; i<5; i++){
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(scrollView.bounds.size.width*i,
                                                                0, scrollView.bounds.size.width, scrollView.bounds.size.height)];
        
        view.backgroundColor = [colorArray objectAtIndex:i];
        [scrollView addSubview:view];
    }
    
//    scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    NSLog(@"scrollViewDidScroll ----> %@", @(scrollView.contentOffset.x));
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
//    NSLog(@"begin dragging");
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerat{
//    NSLog(@"end dragging");
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
//    NSLog(@"begin decelerating");
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//    NSLog(@"end decelerating");
}


@end
