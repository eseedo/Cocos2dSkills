//
//  ChallengeLevelSelection.h
//  Cocos2dChallenge
//
//  Created by Ricky on 12/27/12.
//  Copyright 2012 happybubsy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface ChallengeLevelSelection : CCLayer {
    
    //bg
    CCSprite *bg;
    
    //back button
    CCMenuItem *backButton;
    
    //menu items
    CCMenuItem *newbieMenuItem;
    CCMenuItem *coderMenuItem;
    CCMenuItem *hackerMenuItem;
    CCMenuItem *masterMenuItem;
    CCMenuItem *monsterMenuItem;
    
    //menu item position
    CGPoint newbieMenuItemPosition;
    CGPoint coderMenuItemPosition;
    CGPoint hackerMenuItemPosition;
    CGPoint masterMenuItemPosition;
    CGPoint monsterMenuItemPosition;
    
    CCMenu *levelMenu;
}

+(CCScene*)scene;

@end
