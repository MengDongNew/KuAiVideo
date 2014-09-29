//
//  SettingCell.m
//  KuAiVideo
//
//  Created by mengdong on 14-9-26.
//  Copyright (c) 2014年 com.mengdongliuyaming. All rights reserved.
//

#import "SettingCell.h"
#import "SettingModal.h"

#define _SettingModal [SettingModal sharedSettingModal]

@implementation SettingCell


- (void)initTitleLabel:(NSString *)title selectionButtonState:(BOOL)flag
{
    [self initTitleLabel:title];
    [self initSelectionButtonState:flag];
}
- (void)initTitleLabel:(NSString *)title
{
    self.titleLabel.text = title;
}

- (void)initSelectionButtonState:(BOOL)flag
{
    NSLog(@"flag1 = %d", flag);
    _flag = !flag;
    
    [self responseButtonAction:nil];
}
- (void)awakeFromNib {
    [_selectionButton setTitle:@"no" forState:UIControlStateNormal];
    [_selectionButton setBackgroundImage:kImage(@"") forState:UIControlStateNormal];
    [_selectionButton setTitle:@"yes" forState:UIControlStateSelected];
    [_selectionButton setBackgroundImage:kImage(@"") forState:UIControlStateSelected];
    // Initialization code
}

- (IBAction)responseButtonAction:(id)sender {
    NSLog(@"responseButtonAction");
    _flag = !_flag;
    if (_flag) {
        _selectionButton.selected = YES;
    }else{
        _selectionButton.selected = NO;
    }
    
    NSLog(@"flag1 = %d", _flag);

    [[[_SettingModal.dataDic objectForKey:[_SettingModal.titlesAry objectAtIndex:_indexPath.section]] objectAtIndex:_indexPath.row] setObject:[NSNumber numberWithBool:_flag] forKey:@"flag"];
    NSLog(@"dic = %@", _SettingModal.dataDic);
    
    //NSLog(@"indexPath = %@", _indexPath);

//    if (_delegate && [_delegate performSelector:@selector(settingCellSelectionButtonFlag:section:row:)]) {
//        [self.delegate settingCellSelectionButtonFlag:_flag section:_indexPath.section row:_indexPath.row];
//    }
   // [self.delegate performSelector:@selector(settingCellSelectionButtonFlag:) withObject:self];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
