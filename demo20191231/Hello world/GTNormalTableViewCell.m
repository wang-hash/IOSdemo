//
//  GTNormalTableViewCell.m
//  Hello world
//
//  Created by wangjingru on 2019/12/31.
//  Copyright © 2019 wangjingru. All rights reserved.
//

#import "GTNormalTableViewCell.h"

@interface GTNormalTableViewCell ()

@property(nonatomic, strong, readwrite) UILabel *titleLabel;
@property(nonatomic, strong, readwrite) UILabel *sourceLabel;
@property(nonatomic, strong, readwrite) UILabel *commentLabel;
@property(nonatomic, strong, readwrite) UILabel *timeLabel;


@end

@implementation GTNormalTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self.contentView addSubview: ({
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20,15,300,50)];
            self.titleLabel.backgroundColor = [UIColor redColor];
            self.titleLabel;
        })];
        [self.contentView addSubview: ({
            self.sourceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20,80,50,20)];
            self.sourceLabel.backgroundColor = [UIColor redColor];
            self.sourceLabel;
        })];
        [self.contentView addSubview: ({
            self.commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(100,80,50,20)];
            self.commentLabel.backgroundColor = [UIColor redColor];
            self.commentLabel;
        })];
        [self.contentView addSubview: ({
            self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(200,80,50,20)];
            self.timeLabel.backgroundColor = [UIColor redColor];
            self.timeLabel;
        })];
    }
    return self;
}

-(void) layoutTableView{
    self.titleLabel.text = @"今日头条IOS开发";
    self.sourceLabel.text = @"西瓜视频";
    [self.sourceLabel sizeToFit];
    
    self.commentLabel.text = @"2020";
    [self.commentLabel sizeToFit];
    self.commentLabel.frame = CGRectMake(self.sourceLabel.frame.origin.x + self.sourceLabel.frame.size.width + 15,
                                         self.commentLabel.frame.origin.y,
                                         self.commentLabel.frame.size.width,
                                         self.commentLabel.frame.size.height);
    
    
    self.timeLabel.text = @"2019";
    [self.timeLabel sizeToFit];
    self.timeLabel.frame = CGRectMake(self.commentLabel.frame.origin.x + self.commentLabel.frame.size.width + 15,
                                         self.timeLabel.frame.origin.y,
                                         self.timeLabel.frame.size.width,
                                         self.timeLabel.frame.size.height);
}

@end
