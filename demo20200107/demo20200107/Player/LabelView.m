//
//  LabelView.m
//  Player
//
//  Created by wangjingru on 2020/1/7.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import "LabelView.h"
#import <Masonry/Masonry.h>
@interface LabelView()

@property(nonatomic, strong, readwrite) NSMutableArray *array;

@end

@implementation LabelView

-(instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        _array = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void) setAllCount:(NSInteger) count{
    if(count <= 0){
        return;
    }
    
    for(UIView *view in self.subviews){
        [view removeFromSuperview];
    }
    
    [_array removeAllObjects];
    for(int i=0; i<count; i++){
        UIView* lineView = [[UIView alloc] init];
        [self addSubview: lineView];
        if(i == 0){
            lineView.backgroundColor = [UIColor blueColor];
        }else{
            lineView.backgroundColor = [UIColor grayColor];
        }
        
        CGFloat left = 15*i;
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(left));
            make.width.equalTo(@(11));
            make.top.bottom.equalTo(self);
            if(i == 0){
                make.left.equalTo(self);
            }else if(i == count-1){
                make.right.equalTo(self);
            }
        }];
        
        [_array addObject:lineView];
    }
}

-(void) setIndex:(NSInteger )index{
    if(index < 0 || index > self.array.count){
        return;
    }
    
    for(UIView *view in _array){
        NSInteger viewIndex = [_array indexOfObject:view];
        if(viewIndex == index){
            view.backgroundColor = [UIColor blueColor];
        }else{
            view.backgroundColor = [UIColor grayColor];
        }
    }
}
@end
