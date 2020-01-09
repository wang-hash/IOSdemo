//
//  ImageCollectionView.m
//  Player
//
//  Created by wangjingru on 2020/1/8.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import "ImageCollectionView.h"
#import "ImageCell.h"
#import <Masonry/Masonry.h>

@interface ImageCollectionView()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong, readwrite) UICollectionView* collectionView;

@end

@implementation ImageCollectionView

-(instancetype) init{
    self = [super init];
    if(self){
        [self setUp];
    }
    return self;
}

-(void) setUp{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    layout.itemSize = CGSizeMake(self.view.bounds.size.width, 300);
//    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, (self.view.bounds.size.height-300)/2, self.view.bounds.size.width, 300) collectionViewLayout:layout];
     _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
//    _collectionView.backgroundColor = [UIColor whiteColor];
//    _collectionView.backgroundColor = [UIColor redColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
//    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    [_collectionView registerClass:[ImageCell class] forCellWithReuseIdentifier:@"ImageCell"];
    [self.view addSubview:_collectionView];
    
//    NSInteger top = (self.view.bounds.size.height-300) /2;
//    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(@(top));
//    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 1;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImageCell" forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor redColor];
    return cell;
}

@end
