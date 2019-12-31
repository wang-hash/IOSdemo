//
//  ViewController.m
//  Hello world
//
//  Created by wangjingru on 2019/12/30.
//  Copyright © 2019 wangjingru. All rights reserved.
//

#import "ViewController.h"


//观察UIView的生命周期
@interface TestView : UIView

@end

@implementation TestView

- (void)willMoveToSuperview:(nullable UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
}
- (void)didMoveToSuperview{
    [super didMoveToSuperview];
}
- (void)willMoveToWindow:(nullable UIWindow *)newWindow{
    [super willMoveToSuperview:newWindow];
}
- (void)didMoveToWindow{
    [super didMoveToSuperview];
}

@end

//UIViewController


@interface ViewController ()

@end

@implementation ViewController

//-(id) init{
//    self = [super init];
//    if(self){
//        NSLog(@"ViewController init");
//    }
//    return self;
//}

-(void) test{
    UILabel *label = [[UILabel alloc] init];
    label.text = @"hello world";
    [label sizeToFit];//自动e根据文本大小改变自身的宽度
    label.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    
    [self.view addSubview:label];
    // Do any additional setup after loading the view.
    
    /*
    [self.view addSubview: ({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"hello world";
        [label sizeToFit];
        label.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
        label;
    })];
     */
}
//UIView的生命周期，UIViewController的声明周期

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear: animated];
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear: animated];
    
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear: animated];
    
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear: animated];
}


-(void) test1{
    //UIView  渲染内容
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    view.frame = CGRectMake(100,100,100,100);
    [self.view addSubview: view];
 /*
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor greenColor];
    view1.frame = CGRectMake(150,150,100,100);
    [self.view addSubview: view1];
    //对于子UIViewa来说,最上层的永远是最后添加的View;
  */
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    //[self test1];
}


@end
