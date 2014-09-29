//
//  VideoImageView.h
//  KuAiVideo
//
//  Created by mengdong on 14-9-17.
//  Copyright (c) 2014年 com.mengdongliuyaming. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef  NS_OPTIONS(NSInteger, VideoPauseButtonState)  {
    VideoPauseButtonStateContinue = 0,//续播
    VideoPauseButtonStateReplay//重播
};


@interface VideoImageView : UIImageView
{
    id _target;
    SEL _action;
    
}
@property (nonatomic, strong) UILabel * describeLabel;
@property (nonatomic, strong) UIButton * pauseButton;


//methord for imageView with pauseIcon
- (id)initWithFrame:(CGRect)frame imageUrlStr:(NSString *)imageStr hasPauseIcon:(BOOL)hasIcon target:(id)target action:(SEL)action;

//methord for imageView with describe string
- (id)initWithFrame:(CGRect)frame imageUrl:(NSString *)imageUrl describeStr:(NSString *)describeStr target:(id)target action:(SEL)action;
//methord for VideoCellView
- (id)initWithFrame:(CGRect)frame imageUrl:(NSString *)imageUrl pauseButtonState:(VideoPauseButtonState)pauseButtonState target:(id)target action:(SEL)action;


@end
