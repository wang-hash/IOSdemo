//
//  CGRecommendViewController.m
//  Hello world
//
//  Created by wangjingru on 2019/12/31.
//  Copyright © 2019 wangjingru. All rights reserved.
//

#import "CGRecommendViewController.h"

@interface CGRecommendViewController ()<UIScrollViewDelegate, UIGestureRecognizerDelegate>

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
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(scrollView.bounds.size.width/3, scrollView.bounds.size.height/3,scrollView.bounds.size.width/5,scrollView.bounds.size.height/5)];
    view1.backgroundColor = [UIColor whiteColor];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClick)];
    [view1 addGestureRecognizer: tapGesture];
    tapGesture.delegate = self;
    //    scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
    [self.view addSubview:view1];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return YES;
}

-(void) viewClick{
    NSLog(@"view click");
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
