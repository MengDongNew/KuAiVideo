//
//  ItemsView.m
//  KuAiVideo
//
//  Created by mengdong on 14-9-17.
//  Copyright (c) 2014年 com.mengdongliuyaming. All rights reserved.
//

#import "ItemsView.h"
#import "ItemView.h"

#define Header_Font [UIFont systemFontOfSize:16]
#define Default_Header_Height 30
#define Default_Item_Height 60
#define Two_Line_Item_Height 110
#define Three_Line_Item_Height 100

#define Gap 10
#define Gap_Inside 6

#define Min_Line_Item_Num 3
@implementation ItemsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor greenColor];
        // Initialization code
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame header:(NSString *)header numberOfLine:(NSInteger)lineNumber
{
    self = [self initWithFrame:frame];
    if (self) {
        if (header && ![header isEqualToString:@""]) {
            self.headerBottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, Default_Header_Height)];
            [self addSubview:_headerBottomView];
            self.headerButton = [UIButton buttonWithType:UIButtonTypeSystem] ;
            _headerButton.titleLabel.font = Header_Font;
            CGFloat headerWidth = header.length * _headerButton.titleLabel.font.pointSize;
            _headerButton.frame = CGRectMake(10, 0, headerWidth, _headerBottomView.height);
            [_headerButton setBackgroundColor:[UIColor whiteColor]];
            [_headerButton  setTitle:header forState:UIControlStateNormal];
            [_headerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            _headerButton.titleLabel.textAlignment = NSTextAlignmentLeft;
            [_headerBottomView addSubview:_headerButton];
            
            self.itemsBottomView = [[UIView alloc] initWithFrame:CGRectMake(_headerBottomView.left, _headerBottomView.bottom, self.width, Default_Item_Height)];
            _itemsBottomView.backgroundColor = [UIColor clearColor];
            [self addSubview:_itemsBottomView];
            _itemHeight = 0;
            if (lineNumber == 2) {
                _itemHeight = Two_Line_Item_Height;
            }else if(lineNumber == 3){
                _itemHeight = Three_Line_Item_Height;
            }else{
                _itemHeight = Default_Item_Height;
            }
        }
        // Initialization code
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame header:(NSString *)header items:(NSArray *)items itemsNumberOfLine:(NSInteger)itemsNumber target:(id)target action:(SEL)action
{
    self = [self initWithFrame:frame header:header numberOfLine:itemsNumber];
    if (self) {
        
        CGFloat itemWidth = (_itemsBottomView.width-Gap_Inside*(itemsNumber-1))/itemsNumber;
        CGFloat bottomViewHeight= 0.0;
        //NSInteger itemsCount = items.count;
        for (int i = 0; i < items.count; i ++) {
            ItemView * itemView = [[ItemView alloc] initWithFrame:CGRectMake(i%itemsNumber *(itemWidth +Gap_Inside), i/itemsNumber * (_itemHeight+Gap_Inside), itemWidth, _itemHeight) imageUrlStr:@"image_1" imageDescription:@"全38集"  videoTitle:@"动物世界2" videoDescription:@"带给你全新的视觉体验" target:target action:action];
            [_itemsBottomView addSubview:itemView];
            if (i%itemsNumber == 0) {
                bottomViewHeight = itemView.bottom;
            }
        }
        CGRect bottomRect = _itemsBottomView.frame;
        bottomRect.size.height = bottomViewHeight;
        _itemsBottomView.frame = bottomRect;
        
        CGRect rect = self.frame;
        rect.size.height = _itemsBottomView.bottom ;
        self.frame = rect;
        
        // Initialization code
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame header:(NSString *)header imageItems:(NSArray *)items itemsNumberOfLine:(NSInteger)lineNumber target:(id)target action:(SEL)action
{
    self = [self initWithFrame:frame header:header numberOfLine:lineNumber];
    if (self) {
        CGFloat itemWidth = (_itemsBottomView.width-Gap_Inside*(lineNumber-1))/lineNumber;
        _itemHeight = itemWidth;
        CGFloat bottomViewHeight= 0.0;
        //NSInteger itemsCount = items.count;
        for (int i = 0; i < items.count; i ++) {
            ItemView * itemView = [[ItemView alloc] initWithFrame:CGRectMake(i%lineNumber *(itemWidth +Gap_Inside), i/lineNumber * (_itemHeight+Gap_Inside), itemWidth, _itemHeight) imageUrlStr:[[items objectAtIndex:i] objectForKey:@"video_icon"] imageDescription:[[items objectAtIndex:i] objectForKey:@"video_category"]  target:target action:action];
            [_itemsBottomView addSubview:itemView];
            if (i%lineNumber == 0) {
                bottomViewHeight = itemView.bottom;
            }
        }
        CGRect bottomRect = _itemsBottomView.frame;
        bottomRect.size.height = bottomViewHeight;
        _itemsBottomView.frame = bottomRect;
        
        CGRect rect = self.frame;
        rect.size.height = _itemsBottomView.bottom ;
        self.frame = rect;

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
