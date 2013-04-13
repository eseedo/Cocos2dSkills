//
//  About.h
//  AngryPanda
//
//  Created by Ricky Wang on 3/21/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface AboutUs : CCLayer {
    
    
    double curTime;
    double nextTime;
    
    CGPoint backMenuLocation;
    
    CCMenuItemImage* backButton;
    
     CCSprite *bg;
}
+(CCScene *) scene;


//返回游戏开始界面
-(void)backToStart;

//添加返回按钮
-(void)addBackItem;

//添加背景图片
-(void)addBg;


//添加文字标签
-(void)addTextLabel;


//给作者写邮件
-(void)mailToMe;

@end
