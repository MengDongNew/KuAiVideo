//
//  ItemsView.h
//  KuAiVideo
//
//  Created by mengdong on 14-9-17.
//  Copyright (c) 2014年 com.mengdongliuyaming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemsView : UIView
{
    CGFloat _itemHeight;
}

@property (nonatomic, strong) UIView * headerBottomView;
@property (nonatomic, strong) UIButton * headerButton;
@property (nonatomic, strong) UIView * itemsBottomView;
//item is image and titles together
- (id)initWithFrame:(CGRect)frame header:(NSString *)header items:(NSArray *)items itemsNumberOfLine:(NSInteger)itemsNumber target:(id)target action:(SEL)action;
//item is image only
- (id)initWithFrame:(CGRect)frame header:(NSString *)header imageItems:(NSArray *)items itemsNumberOfLine:(NSInteger)lineNumber target:(id)target action:(SEL)action;

@end
