//
//  PersonalItemView.m
//  KuAiVideo
//
//  Created by mengdong on 14-9-19.
//  Copyright (c) 2014年 com.mengdongliuyaming. All rights reserved.
//

#import "PersonalItemView.h"
#define Gap_Left 20
#define Gap_Top 20
@implementation PersonalItemView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
        [_button setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:_button];

        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(Gap_Left, Gap_Top, self.width-Gap_Left*2, self.width-Gap_Top*2 - 20)];
        [self addSubview:_imageView];
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(_imageView.left, _imageView.bottom, _imageView.width, 20)];
        [self addSubview:_titleLabel];
        _titleLabel.text = @"我的缓存";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:12];
        // Initialization code
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame title:(NSString *)title imageStr:(NSString *)image target:(id)target action:(SEL)action
{
    self = [self initWithFrame:frame];
    if (self) {
        [_button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        
        _imageView.backgroundColor = [UIColor grayColor];
        self.titleLabel.backgroundColor = [UIColor lightGrayColor];
        _imageView.image = kImage(image);
        if (title) {
            _titleLabel.text = title;
        }
              // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
