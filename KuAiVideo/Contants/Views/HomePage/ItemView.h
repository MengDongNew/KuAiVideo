//
//  ItemView.h
//  KuAiVideo
//
//  Created by mengdong on 14-9-17.
//  Copyright (c) 2014年 com.mengdongliuyaming. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VideoImageView;
@interface ItemView : UIView
{
    
}
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UILabel * describeLabel;
@property (nonatomic, strong) VideoImageView * imageView;

//只有图片
- (id)initWithFrame:(CGRect)frame imageUrlStr:(NSString *)imageUrlStr imageDescription:(NSString *)imageDescription target:(id)target action:(SEL)action;

//图片和下面的电影名字
- (id)initWithFrame:(CGRect)frame imageUrlStr:(NSString *)imageUrlStr imageDescription:(NSString *)imageDescription videoTitle:(NSString*)title videoDescription:(NSString *)description target:(id)target action:(SEL)action;

@end
