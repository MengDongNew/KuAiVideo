//
//  HeadersView.h
//  KuAiVideo
//
//  Created by mengdong on 14-9-16.
//  Copyright (c) 2014年 com.mengdongliuyaming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeadersView : UIScrollView
{
    
}
@property (nonatomic, strong) NSMutableArray * headersAry;
@property (nonatomic, strong) NSMutableArray * buttonsAry;
- (id)initWithFrame:(CGRect)frame headers:(NSArray *)headers target:(id)target action:(SEL)action;
- (void)changeButtonState:(NSString *)header;

@end
