//
//  PersonalItemsView.m
//  KuAiVideo
//
//  Created by mengdong on 14-9-19.
//  Copyright (c) 2014年 com.mengdongliuyaming. All rights reserved.
//

#import "PersonalItemsView.h"
#import "PersonalItemView.h"

@implementation PersonalItemsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // Initialization code
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame target:(id)target action:(SEL)action
{
    self = [self initWithFrame:frame];
    if (self) {
        NSArray * dataAry = @[@"我的缓存", @"观看记录", @"我的上传", @"我的收藏", @"我的订阅", @"付费"];
        CGFloat height = 0.0;
        CGFloat itemWidth = self.width / 3 - 2;
        for (int i = 0; i < 6; i ++) {
            PersonalItemView * itemView = [[PersonalItemView alloc] initWithFrame:CGRectMake(0+i%3*(self.width/3), 0+i/3*(itemWidth + 2), itemWidth, itemWidth) title:[dataAry objectAtIndex:i] imageStr:nil target:target action:action];
            [self addSubview:itemView];
            height = itemView.bottom;
        }
        
        CGRect rect = self.frame;
        rect.size.height = height + 20;
        self.frame = rect;
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
