//
//  CardViewController.m
//  Player
//
//  Created by wangjingru on 2020/1/8.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import "CardViewController.h"
#import "CardViewLayout.h"
#import <Masonry/Masonry.h>

@interface CardViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property(nonatomic, strong, readwrite) UICollectionView *collectionView;
@property(nonatomic, strong, readwrite) NSMutableArray *array;
@end

@implementation CardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.collectionView];
    
}

-(UICollectionView *) collectionView{
    if(!_collectionView){
//        CardViewLayout *layout = [[CardViewLayout alloc] init];
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        layout.itemSize = CGSizeMake((self.view.bounds.size.width-10)/2, 300);
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor redColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
        //sectiomHeader、sectionFooter
        
    }
    return _collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;//
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor orangeColor];
    return cell;
    
}

@end
