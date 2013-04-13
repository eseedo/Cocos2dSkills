//
//  MyNotification.h
//  MagicZither
//
//  Created by 茹 振中 on 12-8-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

/*
 v1.0-通知信息,并记录一些基础变量
 v1.1-修改notification的get&set方法，从NSUserDefault中存储和获取
 */

#import <Foundation/Foundation.h>

@interface MyNotification : NSObject

//通知信息
+ (NSString *)notification;
+ (void)setNotification:(NSString *)string;
//语言是否中文
+ (BOOL)isChinese;
+ (void)setIsChinese:(BOOL)isOn;
//是否联网
+ (BOOL)isConnected;
+ (void)setIsConnected:(BOOL)isOn;

@end
