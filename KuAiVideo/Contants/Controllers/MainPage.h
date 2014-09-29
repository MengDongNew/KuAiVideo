//
//  MainPage.h
//  KuAiVideo
//
//  Created by mengdong on 14-9-16.
//  Copyright (c) 2014年 com.mengdongliuyaming. All rights reserved.
//

#import "BaseViewController.h"

@class VideoPlayerPage;
@interface MainPage : BaseViewController<
    UIScrollViewDelegate>
{
    
}
@property (nonatomic, strong) VideoPlayerPage * videoPlayerPage;

@end
