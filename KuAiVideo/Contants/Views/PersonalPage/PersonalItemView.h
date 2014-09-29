//
//  PersonalItemView.h
//  KuAiVideo
//
//  Created by mengdong on 14-9-19.
//  Copyright (c) 2014年 com.mengdongliuyaming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalItemView : UIView
{
    
}
@property (nonatomic, strong) UIButton * button;
@property (nonatomic, strong) UIImageView * imageView;
@property (nonatomic, strong) UILabel * titleLabel;

- (id)initWithFrame:(CGRect)frame title:(NSString *)title imageStr:(NSString *)image target:(id)target action:(SEL)action;
@end
