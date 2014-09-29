//
//  ScrollHeaderView.m
//  KuAiVideo
//
//  Created by mengdong on 14-9-16.
//  Copyright (c) 2014年 com.mengdongliuyaming. All rights reserved.
//

#import "HomeScrollHeaderView.h"
#import "UIViewAdditions.h"
#import "VideoImageView.h"

#define PageNumber 5
@implementation HomeScrollHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor greenColor];
        // Initialization code
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame target:(id)target action:(SEL)action
{
    self = [self initWithFrame:frame];
    if (self) {
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.width, 160)];
        _scrollView.backgroundColor = [UIColor greenColor];
        [self addSubview:_scrollView];
        _scrollView.contentSize = CGSizeMake(_scrollView.width*5, _scrollView.height);
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        for (int i = 0; i < 5; i ++) {
            VideoImageView * imageView = [[VideoImageView alloc] initWithFrame:CGRectMake(0+i*_scrollView.width, 0, _scrollView.width, _scrollView.height) imageUrlStr:@"image_1" hasPauseIcon:YES target:target action:action];
            [_scrollView addSubview:imageView];
        }
        
        self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(100, _scrollView.bottom - 50, _scrollView.width-200, 50)];
        _pageControl.numberOfPages = 5;
        _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        [self addSubview:_pageControl];
        
        self.leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, _scrollView.bottom, 30, 60)];
        [_leftButton setBackgroundColor:[UIColor yellowColor]];
        [self addSubview:_leftButton];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(_leftButton.right, _leftButton.top, self.width - _leftButton.width*2, _leftButton.height/2)];
        _titleLabel.text = @"使徒行者";
        _titleLabel.backgroundColor = [UIColor whiteColor];
        [self addSubview:_titleLabel];
        self.numLabel = [[UILabel alloc] initWithFrame:CGRectMake(_titleLabel.left, _titleLabel.bottom, _titleLabel.width, _titleLabel.height)];
        _numLabel.backgroundColor = [UIColor whiteColor];
        _numLabel.text = @"播放：3.3亿";
        [self addSubview:_numLabel];
        
        self.rightButton = [[UIButton alloc] initWithFrame:CGRectMake(_titleLabel.right, _leftButton.top, _leftButton.width, _leftButton.height)];
        [_rightButton setBackgroundColor:[UIColor yellowColor]];
        [self addSubview:_rightButton];
        
        CGRect rect = self.frame;
        rect.size.height = _leftButton.bottom;
        self.frame = rect;
        // Initialization code
    }
    return self;
}

#pragma mark- UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger page = 0;
    CGFloat x = scrollView.contentOffset.x;
    CGFloat width = _scrollView.width;
    if (x < width/2) {
        page = 0;
    }else if (x < width*3/2){
        page = 1;
    }else if(x < width*5/2){
        page =2;
    }else if(x < width*7/2){
        page =3;
    }else {
        page =4;
    }
    self.pageControl.currentPage = page;
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
