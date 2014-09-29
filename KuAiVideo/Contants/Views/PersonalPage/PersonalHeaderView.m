//
//  PersonalHeaderView.m
//  KuAiVideo
//
//  Created by mengdong on 14-9-18.
//  Copyright (c) 2014年 com.mengdongliuyaming. All rights reserved.
//

#import "PersonalHeaderView.h"

#define Icon_Width 90
#define SettingButton_Width 50
#define Gap 25
@implementation PersonalHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        // Initialization code
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame target:(id)target action:(SEL)action
{
    self = [self initWithFrame:frame];
    if (self) {
        UIImageView * headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.bottom - Icon_Width + 20)];
        headerImageView.image = kImage(@"icon_eye");
        [self addSubview:headerImageView];
        
        self.iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, self.bottom - Icon_Width, Icon_Width, Icon_Width)];
        _iconImageView.image = kImage(@"user_icon");
        [self addSubview:_iconImageView];
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(_iconImageView.right + 10, headerImageView.bottom + 15, 80, _iconImageView.bottom - headerImageView.bottom - 15 - 15)];
        _nameLabel.text = @"你好孟栋";
        _nameLabel.font = [UIFont systemFontOfSize:16];
        [self addSubview:_nameLabel];
        
        self.settingButton = [[UIButton alloc] initWithFrame:CGRectMake(self.right- Gap - SettingButton_Width, headerImageView.bottom + (_iconImageView.bottom - headerImageView.bottom - SettingButton_Width)/2, SettingButton_Width, SettingButton_Width)];
        [_settingButton setTitle:@"设置" forState:UIControlStateNormal];
        [_settingButton setBackgroundColor:[UIColor greenColor]];
        [_settingButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:_settingButton];
        
        
        CGRect rect = self.frame;
        rect.size.height = _iconImageView.bottom + 15;
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
