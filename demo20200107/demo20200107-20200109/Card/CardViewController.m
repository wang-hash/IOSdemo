//
//  CardViewController.m
//  Player
//
//  Created by wangjingru on 2020/1/8.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import "CardViewController.h"
#import "CardViewLayout.h"
#import "CardCollectionReusableView.h"
#import "CardCollectionViewCell.h"
#import <Masonry/Masonry.h>

@interface CardViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, CardCollectionViewLayoutDelegate>
@property(nonatomic, strong, readwrite) CardViewLayout *layout;
@property(nonatomic, strong, readwrite) UICollectionView *collectionView;
@property(nonatomic, strong, readwrite) NSMutableArray *dataSource;
@end

@implementation CardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.collectionView];
    [self setUp];
    
}

-(UICollectionView *) collectionView{
    if(!_collectionView){
        self.layout = [[CardViewLayout alloc] init];
        self.layout.padding = 15;
        self.layout.layout_delegate = self;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:self.layout];
        _collectionView.backgroundColor = [UIColor redColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerClass:[CardCollectionViewCell class] forCellWithReuseIdentifier:@"CardCollectionViewCell"];
        //sectiomHeader、sectionFooter
        [_collectionView registerClass:[CardCollectionReusableView class] forSupplementaryViewOfKind:@"CollectionViewSectionFooter" withReuseIdentifier:@"CardCollectionReusableView"];
        [_collectionView registerClass:[CardCollectionReusableView class] forSupplementaryViewOfKind:@"CollectionViewSectionHeader" withReuseIdentifier:@"CardCollectionReusableView"];
        
    }
    return _collectionView;
}

-(void) setUp{
    self.dataSource = [NSMutableArray array];
    for(int i=0; i<2; i++){
        NSMutableArray *ret = [NSMutableArray array];
        NSInteger maxCount = i==0 ? 20 : 6;
        for(int j=0 ; j<maxCount; j++){
            CardModel *model = [[CardModel alloc] init];
            [ret addObject:model];
        }
        [self.dataSource addObject:ret.copy];
    }
    [self.collectionView reloadData];
}

-(CGFloat) collectionView:(UICollectionView*) collectionView reusableHeaderViewForIndexPath:(NSIndexPath *)indexPath{
    return indexPath.section == 0 ? 30 : 0;
}

-(CGFloat) collectionView:(UICollectionView*) collectionView reusableFooterViewForIndexPath:(NSIndexPath *)indexPath{
    return 30;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.dataSource.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSArray *sectionArray = self.dataSource[section];
    return sectionArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CardCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CardCollectionViewCell" forIndexPath:indexPath];
    CardModel *model = self.dataSource[indexPath.section][indexPath.item];
    
    cell.titleLabel.text = [NSString stringWithFormat:@"%ld -- %ld -- %@", indexPath.section, indexPath.item, model.isSelected ? @"YES":@"NO"];
    
    return cell;
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    CardCollectionReusableView *reusable = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"CardCollectionReusableView" forIndexPath:indexPath];
    
    if([kind isEqual: @"CollectionViewSectionFooter"]){
        [reusable setViewTitle:[NSString stringWithFormat:@"footer: %ld -- %ld", indexPath.section, indexPath.item]];
    }else if([kind isEqual: @"CollectionViewSectionHeader"]){
         [reusable setViewTitle:[NSString stringWithFormat:@"header: %ld -- %ld", indexPath.section, indexPath.item]];
    }
    
    return reusable;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self.dataSource enumerateObjectsUsingBlock:^(NSArray *section, NSUInteger idx, BOOL * _Nonnull stop) {
        [section enumerateObjectsUsingBlock:^(CardModel* model, NSUInteger idx, BOOL * _Nonnull stop) {
            if(indexPath.item != idx){
                model.isSelected = NO;
            }else{
                model.isSelected = !model.isSelected;
                if(indexPath.item != section.count-1){
                    [self.layout didClickWithIndexPath:indexPath isExpand:model.isSelected];
                }else{
                    [self.layout didClickWithIndexPath:indexPath isExpand:NO];
                }
                NSLog(@"");
            }
        }];
    }];
    [collectionView reloadData];
}

@end
