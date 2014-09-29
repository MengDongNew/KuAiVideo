//
//  SettingModal.m
//  KuAiVideo
//
//  Created by mengdong on 14-9-29.
//  Copyright (c) 2014年 com.mengdongliuyaming. All rights reserved.
//

#import "SettingModal.h"

static SettingModal * _sharedSettingModal = nil;
@implementation SettingModal
+ (SettingModal *)sharedSettingModal
{
    @synchronized(self){
        if (!_sharedSettingModal) {
            _sharedSettingModal = [[SettingModal alloc] init];
            [_sharedSettingModal initWithSourceData];
            NSLog(@"000000000000000");
        }
    }
    return _sharedSettingModal;
}

- (void)initWithSourceData
{
    NSString * path = [[NSBundle mainBundle] pathForResource:@"SettingList" ofType:@"plist"];
    self.dataDic = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    NSLog(@"dic = %@", _dataDic);
    self.titlesAry = [_dataDic objectForKey:@"headers"];

}
@end
