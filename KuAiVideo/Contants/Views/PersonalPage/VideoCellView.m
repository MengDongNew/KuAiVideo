//
//  VideoCellView.m
//  KuAiVideo
//
//  Created by mengdong on 14-9-19.
//  Copyright (c) 2014年 com.mengdongliuyaming. All rights reserved.
//

#import "VideoCellView.h"
#import "VideoImageView.h"

#define Default_Height 100
@implementation VideoCellView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        CGRect rect = self.frame;
        rect.size.height = Default_Height;
        self.frame = rect;
        // Initialization code
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame imageUrl:(NSString*)imageUrl videoTitle:(NSString *)title description:(NSString *)description target:(id)target action:(SEL)action
{
    self = [self initWithFrame:frame];
    if (self) {
        self.imageView = [[VideoImageView alloc] initWithFrame:CGRectMake(0, 0, 150, Default_Height) imageUrl:imageUrl pauseButtonState:VideoPauseButtonStateContinue target:target action:action];
        [self addSubview:_imageView];
        
        self.videoNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(_imageView.right + 10, 15, self.width-_imageView.width - 10*2, 60)];
        _videoNameLabel.numberOfLines = 2;
        _videoNameLabel.font = [UIFont systemFontOfSize:15];
        _videoNameLabel.textAlignment = NSTextAlignmentNatural;
        //_videoNameLabel.lineBreakMode = NSLineBreakByCharWrapping;
        _videoNameLabel.text = @"iphone6";
        if (title) {
            _videoNameLabel.text = title;
        }
        [self addSubview:_videoNameLabel];
        
        self.descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(_imageView.right+10, _imageView.bottom- 20, self.width- _imageView.width-20, 20)];
        _descriptionLabel.textColor = [UIColor lightGrayColor];
        _descriptionLabel.text = description;
        _descriptionLabel.font = [UIFont systemFontOfSize:12];
        _descriptionLabel.textAlignment = NSTextAlignmentRight;
        [self addSubview:_descriptionLabel];
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
