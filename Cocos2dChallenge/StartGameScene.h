//
//  StartGameScene.h
//  DoomsDay2012
//
//  Created by eseedo on 9/11/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"




@interface StartGameScene : CCLayer  {
  
  
  //背景

    
  CCSprite *bg;

  
  //游戏标题
  CCSprite *gameTitle;
  
  //屏幕大小
  CGSize screenSize;
  
  //按钮
  
  CCMenuItem *startChallengeItem;
  CCMenuItem *endlessModeItem;
  CCMenuItem *aboutItem;
  
  CCMenuItem *settingItem;
  CCMenuItem *moreItem;
  CCMenuItem *storeItem;
    //音效设置
    
    CCMenu* soundMenu;
    
    
    //位置信息
    
    CGPoint soundMenuLocation;
    
  
  
  //位置信息

 
  CGPoint aboutMenuLocation;
  CGPoint moreMenuLocation;
  CGPoint settingMenuLocation;
  CGPoint startChallengeMenuLocation;
  CGPoint endlessModeMenuLocation;
  
    
  CGPoint storeMenuLocation;
  
  CGPoint titleLocation;
    CGPoint titleLabelLocation;
  CGPoint bgLocation;
    



}

+(CCScene *) scene;



@end
