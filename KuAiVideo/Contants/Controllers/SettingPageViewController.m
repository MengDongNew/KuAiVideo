//
//  SettingPageViewController.m
//  KuAiVideo
//
//  Created by mengdong on 14-9-26.
//  Copyright (c) 2014年 com.mengdongliuyaming. All rights reserved.
//

#import "SettingPageViewController.h"
#import "SettingCell.h"
#import "SettingModal.h"

@interface SettingPageViewController ()
{
    
}

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray * headersAry;
@property (strong, nonatomic) NSDictionary * dataDic;
@end
#define _SettingModal [SettingModal sharedSettingModal]
@implementation SettingPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
}
#pragma maek - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}
#pragma mark - UITableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _SettingModal.titlesAry.count;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [_SettingModal.titlesAry objectAtIndex: section];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[_SettingModal.dataDic objectForKey:[_SettingModal.titlesAry objectAtIndex:section]] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * identifier = @"cell";
    SettingCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SettingCell" owner:self options:nil] firstObject];
        //cell.delegate = self;
    }
    cell.indexPath = indexPath;
     [cell initTitleLabel:[[[_SettingModal.dataDic objectForKey:[_SettingModal.titlesAry objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row] objectForKey:@"title"] selectionButtonState:[[[_SettingModal.dataDic objectForKey:[_SettingModal.titlesAry objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row] objectForKey:@"flag"]];
    //NSLog(@"flag3 = %d",[[[[_SettingModal.dataDic objectForKey:[_SettingModal.titlesAry objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row] objectForKey:@"flag"] boolValue]);
    return cell;
}

#pragma mark - setting

- (void)settingCellSelectionButtonFlag:(BOOL)flag section:(NSInteger)section row:(NSInteger)row
{
    NSLog(@"flag = %d, section = %ld, row = %ld",flag, section, row);
    [self.tableView reloadData];
   // [[[_dataDic objectForKey:[_headersAry objectAtIndex:section]] objectAtIndex:row] setObject:[NSNumber numberWithBool:flag] forKey:@"flag"];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
