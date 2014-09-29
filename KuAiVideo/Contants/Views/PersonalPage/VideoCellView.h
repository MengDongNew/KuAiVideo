//
//  VideoCellView.h
//  KuAiVideo
//
//  Created by mengdong on 14-9-19.
//  Copyright (c) 2014年 com.mengdongliuyaming. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VideoImageView;
@interface VideoCellView : UIView
{
    
}
@property (nonatomic, strong)VideoImageView * imageView;
@property (nonatomic, strong) UILabel * videoNameLabel;
@property (nonatomic, strong) UILabel * descriptionLabel;

- (id)initWithFrame:(CGRect)frame imageUrl:(NSString*)imageUrl videoTitle:(NSString *)title description:(NSString *)description target:(id)target action:(SEL)action;

@end
