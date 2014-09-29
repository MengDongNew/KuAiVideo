//
//  VideoCellsView.h
//  KuAiVideo
//
//  Created by mengdong on 14-9-19.
//  Copyright (c) 2014年 com.mengdongliuyaming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoCellsView : UIView
{
    
}
@property (nonatomic, strong) UIView * headerView;
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UILabel * describeLabel;

- (id)initWithFrame:(CGRect)frame title:(NSString *)title describe:(NSString *)describe cellDataAry:(NSArray*)dataAry target:(id)target action:(SEL)action;

@end
