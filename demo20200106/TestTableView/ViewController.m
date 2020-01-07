//
//  ViewController.m
//  TestTableView
//
//  Created by wangjingru on 2020/1/2.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import "ViewController.h"
#import "NormalViewCell.h"
#import "DetailViewController.h"
#import "LoaderObject.h"
#import "ListItem.h"
#import "MySearchBar.h"
#import "CommentManager.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, strong, readwrite) UITableView *tableView;
@property(nonatomic, strong, readwrite) NSArray *dataArray;
@property(nonatomic, strong, readwrite) LoaderObject *loader;

@end

@implementation ViewController

-(id)init{
    self = [super init];
    if(self){
        
    }
    return self;
}


- (void)viewDidLoad1 {
    [super viewDidLoad];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString: @"http://01imgmini.eastday.com/mobile/20190724/20190724143009_6c2cd7f18367124d5d8cc6b4fe9a1916_3_mwpm_03200403.jpg"]];
    UIImage *image = [UIImage imageWithData:data];
    UIImageView *imageView = [[UIImageView alloc] initWithImage: image];
//    imageView.backgroundColor = [UIColor redColor];
    [self.view addSubview: imageView];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.allowsSelection = YES;
    [self.view addSubview:_tableView];


    _loader = [[LoaderObject alloc] init];

    __weak typeof(self) wself = self;
    [_loader LoadDataWithFinishBlock:^(BOOL success, NSArray<ListItem *> * _Nonnull dataArray) {
        __strong typeof(wself) strongSelf = wself;
        strongSelf.dataArray = dataArray;
        [strongSelf.tableView reloadData];
        NSLog(@"");
    }];
    
//
}


-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear: animated];
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    [self.tabBarController.navigationItem setTitleView: ({
        MySearchBar *searchBar = [[MySearchBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width-20, self.navigationController.navigationBar.bounds.size.height)];
        searchBar;
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.navigationController.navigationBar.bounds.size.height)];
        button.backgroundColor = [UIColor lightGrayColor];
        [button addTarget:self action:@selector(showView) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
}

-(void) showView{
    [[CommentManager shareManager] showCommentView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NormalViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"id"];

    if(!cell){
        cell =  [[NormalViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
        
    }
    [cell showViewWithItem:[_dataArray objectAtIndex:indexPath.row]];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ListItem *item = [_dataArray objectAtIndex:indexPath.row];
    
    DetailViewController *viewController = [[DetailViewController alloc] initWithString:item.articleUrl];
    
    viewController.view.backgroundColor = [UIColor redColor];
    viewController.title = [NSString stringWithFormat: @"%@", @(indexPath.row)];
    [self.navigationController pushViewController:viewController animated:YES];
//    self.navigationController.navigationItem
//    self.tabBarController.navigationItem
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:item.unqiueKey];//
}

@end
