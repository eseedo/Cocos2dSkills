//
//  ChallengeLevelResult.h
//  Cocos2dChallenge
//
//  Created by Ricky on 12/27/12.
//  Copyright 2012 happybubsy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface ChallengeLevelResult : CCLayer {
    
    //scrolling background
    
    CCParallaxNode *backgroundNode;
    
    CCSprite *bg;
    
    CCSprite *spacialanomaly;
    
    //当前关卡是否成功通过
    BOOL levelClear;
    
    //当前关卡的编号
    int levelNumber;
    
    //当前关卡所属的场景
    int chapterNumber;
    
    //当前场景已通过的关卡数量
    int levelSolvedOfThisChapter;
    
    //当前关卡答对的题目总数
    
    int numberOfWrongAnswers;
    
    //当前关卡的得分
    int scoreOfCurrentLevel;
    
    //当前关卡的评价
    int levelStars;
    
    //背景精灵图片
    CCSprite *sceneBg;
    CCSprite *resultBg;
    
    //屏幕大小
    CGSize screenSize;
    
    //菜单选项
    CCMenu *resultMenu;
    
    
    //位置
    CGPoint resultLabelLocation;
    CGPoint starsLocation;
    CGPoint resultTextLocation;
    CGPoint resultBgLocation;
    CGPoint resultMenuLocation;
    
    
    //menu items
    CCMenuItemSprite *item1;
    CCMenuItemSprite *item2;
    CCMenuItemSprite *item3;
    CCMenuItemSprite *item4;
    
}
+(CCScene*)scene;
@end
