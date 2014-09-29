//
//  SettingPageViewController.h
//  KuAiVideo
//
//  Created by mengdong on 14-9-26.
//  Copyright (c) 2014年 com.mengdongliuyaming. All rights reserved.
//

#import "BaseViewController.h"
#import "SettingCell.h"

@interface SettingPageViewController : BaseViewController<
    UITableViewDelegate,
    UITableViewDataSource,
    SettingCellDelegate>



@end
