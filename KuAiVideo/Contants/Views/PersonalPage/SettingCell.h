//
//  SettingCell.h
//  KuAiVideo
//
//  Created by mengdong on 14-9-26.
//  Copyright (c) 2014年 com.mengdongliuyaming. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol SettingCellDelegate <NSObject>

//- (void)settingCellSelectionButtonFlag:(BOOL)flag;
- (void)settingCellSelectionButtonFlag:(BOOL)flag section:(NSInteger)section row:(NSInteger)row;

//- (void)settingCellSelectionButtonFlag:(BOOL)flag indexPath:(NSIndexPath *)indexPath;

@end

@interface SettingCell : UITableViewCell
{
    BOOL _flag;
    //NSIndexPath * _indexPath;
}

@property (nonatomic, weak) id<SettingCellDelegate> delegate;
@property (nonatomic, strong) NSIndexPath * indexPath;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) IBOutlet UIButton *selectionButton;

- (void)initTitleLabel:(NSString *)title selectionButtonState:(BOOL)flag;

@end

