//
//  VideoCellsView.m
//  KuAiVideo
//
//  Created by mengdong on 14-9-19.
//  Copyright (c) 2014年 com.mengdongliuyaming. All rights reserved.
//

#import "VideoCellsView.h"
#import "VideoCellView.h"

#define Gap 10
@implementation VideoCellsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, 50)];
        [self addSubview:_headerView];
        _headerView.backgroundColor = [UIColor lightGrayColor];
        // Initialization code
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame title:(NSString *)title description:(NSString *)description
{
    self = [self initWithFrame:frame];
    if (self) {
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(Gap, Gap, 100, 18)];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.text = @"观看记录";
        [_headerView addSubview:_titleLabel];
        [self adjustableLabelRect:_titleLabel text:title];

        UIImageView * pushIcon = [[UIImageView alloc] initWithFrame:CGRectMake(_titleLabel.right, _titleLabel.top, 10, _titleLabel.height)];
        pushIcon.backgroundColor = [UIColor redColor];
        [_headerView addSubview:pushIcon];
        
        self.describeLabel = [[UILabel alloc] initWithFrame:CGRectMake(_titleLabel.left, _titleLabel.bottom+5, 200, _titleLabel.height)];
        _describeLabel.text = @"共有14条记录";
        _describeLabel.font = [UIFont systemFontOfSize:12];
        _describeLabel.textColor = [UIColor grayColor];
        [_headerView addSubview:_describeLabel];
        [self adjustableLabelRect:_describeLabel text:description];
        
        CGRect rect = _headerView.frame;
        rect.size.height = _describeLabel.bottom + Gap;
        _headerView.frame = rect;
        // Initialization code
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame title:(NSString *)title describe:(NSString *)describe cellDataAry:(NSArray*)dataAry target:(id)target action:(SEL)action
{
    self = [self initWithFrame:frame title:title description:describe];
    if (self) {
        NSInteger cellsNumber = 2;
        if (dataAry.count < 2){
                cellsNumber = dataAry.count;
        }
        CGFloat bottom  = _headerView.bottom;
        for (int i = 0; i < cellsNumber; i ++) {
            VideoCellView  * videoCellView = [[VideoCellView alloc] initWithFrame:CGRectMake(_headerView.left, bottom, _headerView.width, 50) imageUrl:[[dataAry objectAtIndex:i] objectForKey:@"video_icon"] videoTitle:[[dataAry objectAtIndex:i] objectForKey:@"video_title"] description:[[dataAry objectAtIndex:i] objectForKey:@"video_time"] target:target action:action];
            [self addSubview:videoCellView];
            bottom = videoCellView.bottom;
        }
        
        CGFloat height = self.height;
        for (UIView * view in self.subviews) {
            height = view.bottom;
        }
        CGRect rect = self.frame;
        rect.size.height = height;
        self.frame = rect;
        // Initialization code
    }
    return self;
}

- (void)adjustableLabelRect:(UILabel *)label text:(NSString *)text
{
    CGRect rect = label.frame;
    rect.size.width = label.font.pointSize*text.length;
    label.frame = rect;
    label.text = text;
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
