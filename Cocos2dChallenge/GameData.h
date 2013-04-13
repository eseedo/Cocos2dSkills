//
//  GameData.h
//  DoomsDay2012
//
//  Created by eseedo on 9/11/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface GameData : CCLayer {
    
    
    //关卡是否解锁
    
    BOOL isLevel2Unlocked;
    BOOL isLevel3Unlocked;
    BOOL isLevel4Unlocked;
    BOOL isLevel5Unlocked;
    
    //当前玩家所拥有的道具数量
    
    //叫兽的爱
    int currentNumberOfGameProp1;
    
    //空空的胸
    int currentNumberOfGameProp2;
    
    //戴三个表
    int currentNumberOfGameProp3;
    
    //女神凝望
    int currentNumberOfGameProp4;
    
    
    
    //当前关卡答对的题目总数
    
    int numberOfCorrectAnswerOfCurrentLevel;
    
    //当前关卡已回答的题目数量
    
    int numberOfAnsweredQuestionOfCurrentLevel;
    
    //当前关卡已回答错误的题目数量
    int numberOfWrongAnswerOfCurrentLevel;
    
    //玩家生命值
    int userLife;
    
    //已经出现过的题目编号数组，在关卡跳转时需要清空
    NSMutableArray *appearedQuestionIndexArray;
    
    
    //是否已购买道具4
    BOOL isGameProp4Purchased;
    
    
    //音效相关
    
    BOOL soundEffectMuted; //音效是否打开
    BOOL backgroundMusicMuted;//背景音乐是否打开
    
    
    //游戏相关
    
    //是否是第一次玩这款游戏
    BOOL notFirstTimeEnterStore;
    
    BOOL notFirstTimePlayThisGame;
    
    
    //是否暂停游戏
    BOOL gamePaused;
    
    //系统默认设置
    NSUserDefaults* defaults;
    
    
    //关卡相关
    
    int levelsCompleted; //已通过的关卡数量

    
    //当前关卡是否通过
    
    BOOL currentLevelSolved;
    
    
    
    //当前关卡下的题目编号
    
    int currentQuestionIndex;
    
    
    //当前关卡是否解锁
    BOOL currentLevelUnlocked;
    
//当前关卡是否通过
 
    //当前关卡的评级
    int currentLevelStar;
    
    BOOL isCurrentLevelPassed;
    
    
    //所选场景和关卡
    

    int _selectedLevel;
    
    //当前关卡的评价（非历史最佳成绩，而是此次通关时的评价）
    
    int currentLevelStars;
    
    //未回答的问题数量
    
    int numberOfUnusedQuestions;
    
}

@property(nonatomic,assign) int currentNumberOfGameProp1;
@property(nonatomic,assign) int currentNumberOfGameProp2;
@property(nonatomic,assign) int currentNumberOfGameProp3;
@property(nonatomic,assign) int currentNumberOfGameProp4;
@property(nonatomic,assign) int userLife;

@property(nonatomic,assign) int numberOfCorrectAnswerOfCurrentLevel;
@property(nonatomic,assign) int numberOfAnsweredQuestionOfCurrentLevel;
@property(nonatomic,assign) int numberOfWrongAnswerOfCurrentLevel;

@property(nonatomic,assign) BOOL currentLevelSolved,currentLevelUnlocked;
@property(nonatomic,assign) int currentQuestionIndex;
@property(nonatomic,assign) int numberOfUnusedQuestions;


@property(nonatomic) NSInteger levelsCompleted;

@property (nonatomic, assign) int selectedLevel;

@property(nonatomic)BOOL soundEffectMuted,backgroundMusicMuted;
@property(nonatomic)BOOL notFirstTimePlayThisGame,notFirstTimeEnterStore;
@property(nonatomic)BOOL gamePaused;
@property(nonatomic)BOOL isLevel2Unlocked,isLevel3Unlocked,isLevel4Unlocked,isLevel5Unlocked;
@property(nonatomic)BOOL isCurrentLevelPassed;
@property(nonatomic,assign) int currentLevelStar;

@property(nonatomic,copy)   NSMutableArray *appearedQuestionIndexArray;

+(GameData*) sharedData;


//初始化
-(id)init;


@end
