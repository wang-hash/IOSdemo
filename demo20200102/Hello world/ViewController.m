//
//  ViewController.m
//  Hello world
//
//  Created by wangjingru on 2019/12/30.
//  Copyright © 2019 wangjingru. All rights reserved.
//

#import "ViewController.h"
#import "GTNormalTableViewCell.h"
#import "GTDetailViewController.h"
#import "GTDeleteCellView.h"



@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, GTNormalTableViewCellDelegate>

@property(nonatomic, strong, readwrite) UITableView *tableView;
@property(nonatomic, strong, readwrite) NSMutableArray *dataArray;

@end

@implementation ViewController

-(id)init{
    self = [super self];
    if(self){
        _dataArray =@[].mutableCopy;
        for(int i=0; i<20; i++){
            [_dataArray addObject:@(i)];
        }
    }
    
    return self;
}


-(void) pushController{
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.navigationItem.title = @"内容";
    
    viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"右侧标题" style:UIBarButtonItemStyleDone target:self action:nil];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GTNormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];

    if(!cell){
        cell = [[GTNormalTableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
        cell.delegate = self;
    }
    [cell layoutTableView];
    
    return cell;
}

-(void) tableViewCell: (UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *) deleteButton{
    GTDeleteCellView* deleteCellView = [[GTDeleteCellView alloc] initWithFrame:self.view.bounds];
  
    CGRect rect = [tableViewCell convertRect:deleteButton.frame toView:nil];
    
    __weak typeof(self) wself = self;
    [deleteCellView showDeleteViewFromPoint:rect.origin clickButton:^{
        NSLog(@"");
        __strong typeof(self) StrongSelf = wself;
        [StrongSelf.dataArray removeLastObject];
        [self.tableView deleteRowsAtIndexPaths:@[[self.tableView indexPathForCell:tableViewCell]]
                            withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GTDetailViewController *controller = [[GTDetailViewController alloc] init];
    controller.title = [NSString stringWithFormat: @"%@", @(indexPath.row)];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor greenColor];
    //[self test1];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableView = [[UITableView alloc] initWithFrame: self.view.bounds];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}


@end
