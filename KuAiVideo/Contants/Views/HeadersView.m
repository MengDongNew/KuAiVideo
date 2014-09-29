//
//  HeadersView.m
//  KuAiVideo
//
//  Created by mengdong on 14-9-16.
//  Copyright (c) 2014年 com.mengdongliuyaming. All rights reserved.
//

#import "HeadersView.h"
#import "UIViewAdditions.h"

#define Header_Count 4
#define Min_Width (320/Header_Count)
#define Default_Height 44
@implementation HeadersView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.headersAry = [NSMutableArray arrayWithCapacity:1];
        self.buttonsAry = [NSMutableArray arrayWithCapacity:1];
        // Initialization code
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame headers:(NSArray *)headers target:(id)target action:(SEL)action
{
    self = [self initWithFrame:frame];
    if (self) {
        [_headersAry addObjectsFromArray:headers];
        
        NSInteger count = headers.count;
        CGFloat width = 0.0;
        if (count < Header_Count) {
            width = 321/count;
        }else {
            width = Min_Width;
        }
        for (int i = 0; i < headers.count; i ++) {
            NSString * header = [headers objectAtIndex:i];
            UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(0 + width*i, 0, width, Default_Height)];
            [button setTitle:header forState:UIControlStateNormal];
            [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [self addSubview:button];
            [self.buttonsAry addObject:button];
            [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        }
        self.contentSize = CGSizeMake(width*count, Default_Height);
        // Initialization code
    }
    return self;
}

- (void)changeButtonState:(NSString *)header
{
    for (UIButton * button in self.buttonsAry) {
        if ([button.titleLabel.text isEqualToString:header]) {
            [button setBackgroundImage:[UIImage imageNamed:@"button_bg_normal"] forState:UIControlStateNormal];
        }else{
            [button setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        }
    }
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
