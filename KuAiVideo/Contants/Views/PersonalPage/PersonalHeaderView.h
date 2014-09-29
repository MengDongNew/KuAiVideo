//
//  PersonalHeaderView.h
//  KuAiVideo
//
//  Created by mengdong on 14-9-18.
//  Copyright (c) 2014年 com.mengdongliuyaming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalHeaderView : UIView
{
    
}
@property (nonatomic, strong) UIImageView * iconImageView;
@property (nonatomic, strong) UILabel * nameLabel;
@property (nonatomic, strong) UIButton * settingButton;

- (id)initWithFrame:(CGRect)frame target:(id)target action:(SEL)action;


@end
