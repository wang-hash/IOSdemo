//
//  NormalViewCell.m
//  TestTableView
//
//  Created by wangjingru on 2020/1/2.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import "NormalViewCell.h"
#import "ListItem.h"

@interface NormalViewCell ()

@property(nonatomic, strong, readwrite) UILabel* titleLabel;
@property(nonatomic, strong, readwrite) UILabel* commentLabel;
@property(nonatomic, strong, readwrite) UILabel* sourceLabel;
@property(nonatomic, strong, readwrite) UILabel* timeLabel;

@property(nonatomic, strong, readwrite) UIImageView* rightImageView;
@end

@implementation NormalViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self.contentView addSubview: ({
            _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 270, 50)];
//            _titleLabel.backgroundColor = [UIColor redColor];
            self.titleLabel.numberOfLines = 2;
            self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
            _titleLabel;
        })];
        
        [self.contentView addSubview: ({
            _commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 70, 50, 20)];
//            _commentLabel.backgroundColor = [UIColor redColor];
            _commentLabel;
        })];
        [self.contentView addSubview: ({
            _sourceLabel = [[UILabel alloc] initWithFrame:CGRectMake(100,70,50,20)];
//            _sourceLabel.backgroundColor = [UIColor redColor];
            _sourceLabel;
        })];
        [self.contentView addSubview: ({
            _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 70, 50, 20)];
//            _timeLabel.backgroundColor = [UIColor redColor];
            _timeLabel;
        })];

        [self.contentView addSubview: ({
            self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(300, 15, 100, 70)];
            self.rightImageView.contentMode = UIViewContentModeScaleAspectFit;
            self.rightImageView;
        })];
        
    }
    return self;
}

-(void) showViewWithItem:(ListItem*)item{
    
    BOOL hasRead = [[NSUserDefaults standardUserDefaults] boolForKey:item.unqiueKey];
    if(hasRead){
        _titleLabel.textColor = [UIColor lightGrayColor];
    }else{
        _titleLabel.textColor = [UIColor blackColor];
    }
    
    _titleLabel.text = item.title;
    _commentLabel.text = item.category;
    [_commentLabel sizeToFit];
    
    _sourceLabel.text = item.authorName;
    [_sourceLabel sizeToFit];
    
    _sourceLabel.frame = CGRectMake(_commentLabel.frame.origin.x + _commentLabel.frame.size.width + 15, _sourceLabel.frame.origin.y, _sourceLabel.frame.size.width, _sourceLabel.frame.size.height);
    _timeLabel.text = item.date;
    [_timeLabel sizeToFit];
    _timeLabel.frame = CGRectMake(_sourceLabel.frame.origin.x + _sourceLabel.frame.size.width + 15, _timeLabel.frame.origin.y, _timeLabel.frame.size.width, _timeLabel.frame.size.height);
    
//    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString: item.picUrl]]];
//    self.rightImageView.image = image;
    
    
//    NSThread *downloadThread = [[NSThread alloc] initWithBlock:^{
//        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString: item.picUrl]]];
//        self.rightImageView.image = image;
//    }];
//
//    downloadThread.name = @"downloadThread";
//    [downloadThread start];
    
    dispatch_queue_global_t downloadQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_main_t mainQueue = dispatch_get_main_queue();

    dispatch_async(downloadQueue, ^{
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString: item.picUrl]]];
        dispatch_async(mainQueue, ^{
            self.rightImageView.image = image;
        });
    });
    
}

@end
