//
//  VideoViewController.m
//  TestTableView
//
//  Created by wangjingru on 2020/1/4.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import "VideoViewController.h"
#import "VideoViewCell.h"

@interface VideoViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation VideoViewController

-(instancetype) init{
    self = [super init];
    if(self){
        self.view.backgroundColor = [UIColor whiteColor];
        self.tabBarItem.title = @"视频";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
    flowlayout.minimumLineSpacing = 10;
    flowlayout.minimumInteritemSpacing = 10;
    flowlayout.itemSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.width/16*9);
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowlayout];
    
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    [collectionView registerClass:[VideoViewCell class] forCellWithReuseIdentifier:@"VideoViewCell"];
    [self.view addSubview:collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"VideoViewCell" forIndexPath:indexPath];
    if([cell isKindOfClass:[VideoViewCell class]]){
        [(VideoViewCell *)cell layoutWithVideoCoverUrl:@"Video.png" videoUrl:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
    }
    return cell;
}



@end
