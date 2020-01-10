//
//  ImageSlideViewController.m
//  Player
//
//  Created by wangjingru on 2020/1/9.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import "ImageSlideViewController.h"
#import "ImageslideLayout.h"
#import "DataCell.h"

@interface ImageSlideViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property(nonatomic, strong, readwrite) ImageslideLayout *layout;
//@property(nonatomic, strong, readwrite) ImageslideLayout *layout;
@property(nonatomic, strong, readwrite) UICollectionView *collectionView;
@property(nonatomic, strong, readwrite) NSArray *titles;
@end

@implementation ImageSlideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _titles = [[self imageData] objectForKey:@"heros"];
    _layout = [[ImageslideLayout alloc] init];
//    _layout = [[ImageslideLayout alloc] init];
    CGRect rct = self.view.bounds;
    rct.size.height = 200;
    rct.origin.y = [UIScreen mainScreen].bounds.size.height / 2.0 - rct.size.height;
    _layout.itemSize = CGSizeMake(150, 200);
//    _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

    self.collectionView = [[UICollectionView alloc] initWithFrame:rct collectionViewLayout:_layout];
    self.collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.decelerationRate = UIScrollViewDecelerationRateNormal;
    
    [self.collectionView registerClass:[DataCell class] forCellWithReuseIdentifier:@"DataCell"];
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    [self.view addSubview:_collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _titles.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DataCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DataCell" forIndexPath:indexPath];
    UIImage *image= [UIImage imageNamed:[self.titles objectAtIndex:indexPath.row]];
    cell.image.image = image;
    cell.name.text = [self.titles objectAtIndex:indexPath.row];
//    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}

-(NSDictionary*) imageData{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"images.plist" ofType:nil];
    NSDictionary *rootDictionary = [[NSDictionary alloc] initWithContentsOfFile:path];
    return rootDictionary;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    NSInteger itemCount = [self collectionView:collectionView numberOfItemsInSection:section];
    NSIndexPath *first = [NSIndexPath indexPathForItem:0 inSection:section];
    CGSize firstSize = [self collectionView:collectionView layout:collectionViewLayout sizeForItemAtIndexPath:first];
    
    NSIndexPath *last = [NSIndexPath indexPathForItem:itemCount-1 inSection:section];
    CGSize lastSize = [self collectionView:collectionView layout:collectionViewLayout  sizeForItemAtIndexPath:last];

    return UIEdgeInsetsMake(0, (collectionView.bounds.size.width - firstSize.width)/2, 0, (collectionView.bounds.size.width - lastSize.width)/2);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(150,200);
}

@end
