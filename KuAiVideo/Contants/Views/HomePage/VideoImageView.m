//
//  VideoImageView.m
//  KuAiVideo
//
//  Created by mengdong on 14-9-17.
//  Copyright (c) 2014年 com.mengdongliuyaming. All rights reserved.
//

#import "VideoImageView.h"

@implementation VideoImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        self.userInteractionEnabled = YES;
       
        // Initialization code
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame imageUrl:(NSString *)imageUrl description:(NSString *)description
{
    self = [self initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:imageUrl];
        if (description) {
            self.describeLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, self.bottom-25, self.width-10, 25)];
            [self addSubview:_describeLabel];
             _describeLabel.text = description;
        }
                // Initialization code
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame imageUrl:(NSString *)imageUrl describeStr:(NSString *)describeStr target:(id)target action:(SEL)action
{
    self = [self initWithFrame:frame imageUrl:imageUrl description:describeStr];
    if (self) {
        _target = target;
        _action = action;
        [self addTapGasture];
        
        _describeLabel.font = [UIFont systemFontOfSize:12];
        _describeLabel.textColor = [UIColor whiteColor];
        _describeLabel.backgroundColor = [UIColor clearColor];
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame imageUrlStr:(NSString *)imageStr hasPauseIcon:(BOOL)hasIcon target:(id)target action:(SEL)action
{
    self = [self initWithFrame:frame];
    if (self) {
        _target = target;
        _action = action;
        [self addTapGasture];

        self.image = [UIImage imageNamed:imageStr];
        if (hasIcon) {
            UIButton * iconButton = [[UIButton alloc] initWithFrame:CGRectMake(10, self.bottom - 50, 40, 40)];
            [self addSubview:iconButton];
            [iconButton setImage:kImage(@"icon_pause") forState:UIControlStateNormal];
        }
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame imageUrl:(NSString *)imageUrl pauseButtonState:(VideoPauseButtonState)pauseButtonState target:(id)target action:(SEL)action
{
    self = [self initWithFrame:frame imageUrl:imageUrl description:nil];
    if (self) {
        _target = target;
        _action = action;
        [self addTapGasture];

        self.pauseButton = [[UIButton alloc] initWithFrame:CGRectMake(self.width/2-20, self.height/2-10, 40, 20)];
        [self addSubview:_pauseButton];
        _pauseButton.backgroundColor = [UIColor clearColor];
        [_pauseButton addTarget:_target action:_action forControlEvents:UIControlEventTouchUpInside];
        
        [self resetPauseButtonState:pauseButtonState];
    }
    return self;
}
//重置button状态，是重播还是续播
- (void)resetPauseButtonState:(VideoPauseButtonState)videoState
{
    if (videoState == VideoPauseButtonStateContinue) {//续播
        [_pauseButton setTitle:@"续播" forState:UIControlStateNormal];
    }else if(videoState == VideoPauseButtonStateReplay){//重播
        [_pauseButton setTitle:@"重播" forState:UIControlStateNormal];
    }else {
        [_pauseButton setTitle:@"" forState:UIControlStateNormal];
        NSLog(@"您的video状态为无或者有误！");
    }

}

- (void)addTapGasture
{
    UITapGestureRecognizer * tap =[[UITapGestureRecognizer alloc] initWithTarget:_target action:_action];
    [self  addGestureRecognizer:tap];
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
