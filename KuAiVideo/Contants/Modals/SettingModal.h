//
//  SettingModal.h
//  KuAiVideo
//
//  Created by mengdong on 14-9-29.
//  Copyright (c) 2014年 com.mengdongliuyaming. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingModal : NSObject
{
    
}
@property (nonatomic, strong) NSMutableDictionary * dataDic;
@property (nonatomic, strong) NSArray * titlesAry;

+ (SettingModal *)sharedSettingModal;

@end
