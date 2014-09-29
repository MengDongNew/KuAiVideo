//
//  ItemView.m
//  KuAiVideo
//
//  Created by mengdong on 14-9-17.
//  Copyright (c) 2014年 com.mengdongliuyaming. All rights reserved.
//

#import "ItemView.h"
#import "VideoImageView.h"

#define Label_Height 20
@implementation ItemView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame imageUrlStr:(NSString *)imageUrlStr imageDescription:(NSString *)imageDescription target:(id)target action:(SEL)action
{
    self = [self initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.imageView = [[VideoImageView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.width) imageUrl:imageUrlStr describeStr:imageDescription target:target action:action];
        [self addSubview:_imageView];
        
        // Initialization code
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame imageUrlStr:(NSString *)imageUrlStr imageDescription:(NSString *)imageDescription videoTitle:(NSString*)title videoDescription:(NSString *)description target:(id)target action:(SEL)action
{
    self = [self initWithFrame:frame imageUrlStr:imageUrlStr imageDescription:imageDescription target:target action:action];
    if (self) {
        self.imageView.frame = CGRectMake(0, 0, self.width, self.height- Label_Height*2);
        if (title) {
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(_imageView.left+5, _imageView.bottom, _imageView.width-10, Label_Height)];
            _titleLabel.text = @"动物世界";
            _titleLabel.font = [UIFont systemFontOfSize:15];
            [self addSubview:_titleLabel];
            _titleLabel.text = title;
        }
        if (description) {
            self.describeLabel = [[UILabel alloc] initWithFrame:CGRectMake(_titleLabel.left, _titleLabel.bottom, _titleLabel.width, Label_Height)];
            _describeLabel.text = @"给你带来全新的视觉体验";
            _describeLabel.font = [UIFont systemFontOfSize:13];
            [self addSubview:_describeLabel];
            _describeLabel.text = description;
        }
    }
    return self;
}
//- (id)initWithFrame:(CGRect)frame imageUrlStr:(NSString *)imageUrlStr target:(id)target action:(SEL)action
//{
//    self = [self initWithFrame:frame];
//    if (self) {
//    }
//    return self;
//}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
