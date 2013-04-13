//
//  MyNotification.m
//  MagicZither
//
//  Created by 茹 振中 on 12-8-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MyNotification.h"

#define  NOTIFICATION_TAG      @"notification_text_tag"

@implementation MyNotification

static NSString *notification = nil;
static BOOL isChinese = NO;
static BOOL isConnected = NO;

+ (NSString *)notification{
    if (notification == nil) {
        NSString *string = [[NSUserDefaults standardUserDefaults] objectForKey:NOTIFICATION_TAG];
        if ([string length]>0) {
            notification = [[NSString alloc] initWithFormat:@"%@",string];
        }
        
    }
    
    return notification;
}

+ (void)setNotification:(NSString *)string{
    if (notification) {
        [notification release];
        notification = nil;
    }
    
    if (string) {
        notification = [[NSString alloc] initWithFormat:@"%@",string];
        [[NSUserDefaults standardUserDefaults] setObject:notification forKey:NOTIFICATION_TAG];
    }
    else {
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:NOTIFICATION_TAG];
    }
}

+ (BOOL)isChinese{
    return isChinese;
}

+ (void)setIsChinese:(BOOL)isOn{
    isChinese = isOn;
}

+ (BOOL)isConnected{
    return isConnected;
}

+ (void)setIsConnected:(BOOL)isOn{
    isConnected = isOn;
}

@end
