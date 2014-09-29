//
//  ScrollHeaderView.h
//  KuAiVideo
//
//  Created by mengdong on 14-9-16.
//  Copyright (c) 2014年 com.mengdongliuyaming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeScrollHeaderView : UIView<
    UIScrollViewDelegate
    >
{
    
}
@property (nonatomic, strong) UIScrollView * scrollView;
@property (nonatomic, strong) UIPageControl * pageControl;
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UILabel * numLabel;
@property (nonatomic, strong) UIButton * leftButton;
@property (nonatomic, strong) UIButton * rightButton;

- (id)initWithFrame:(CGRect)frame target:(id)target action:(SEL)action;
@end
