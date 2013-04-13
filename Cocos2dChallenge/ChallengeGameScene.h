//
//  ChallengeGameScene.h
//  Cocos2dChallenge
//
//  Created by Ricky on 12/27/12.
//  Copyright 2012 happybubsy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class QuestionDetails;

//当前关卡结束的原因

typedef enum {
    kEndReasonWin,
    kEndReasonLose
} EndReason;

@interface ChallengeGameScene : CCLayer {
    
    //数据库信息
    
    int _uniqueId;
    int _type;
    int _questionIndex;
    QuestionDetails *preciseDetails;
    QuestionDetails *details;
    
    
    //视觉元素的位置
    
    //屏幕大小
    CGSize screenSize;
    //按钮的位置
    
    CGPoint backButtonLocation;
    CGPoint storeButtonLocation;
    
    //背景图片的位置
    CGPoint bgLocation;
    
    //远点
    CGPoint zeroLocation;
    
    //暂停按钮
    
    CGPoint pauseButtonLocation;
    
    //问题所在位置
    
    CGPoint questionLocation;
    
    //倒计时标签所在位置
    CGPoint countDownLabelLocation;
    
    //倒计时血条所在位置
    CGPoint countDownBarLocation;
    
    //玩家血条所在位置
    CGPoint lifeBar1Location;
    CGPoint lifeBar2Location;
    CGPoint lifeBar3Location;
    
    
    //当前题目编号所在位置
    CGPoint currentQuestionNumberLabelLocation;
    
    //答错的题目编号
    CGPoint wrongAnswerNumberLabelLocation;
    
    //道具1所在位置
    CGPoint gameProp1Location;
    
    
    
    //道具2所在位置
    CGPoint gameProp2Location;
    
    //道具3所在位置
    CGPoint gameProp3Location;
    
    //道具1数量所在位置
    
    CGPoint gameProp1NumberLocation;
    
    //道具2数量所在位置
    
    CGPoint gameProp2NumberLocation;
    
    //道具3数量所在位置
    
    CGPoint gameProp3NumberLocation;
    
    //玩家是否回答正确的结果所在位置
    
    CGPoint userAnswerFeedbackLocation;
    
    
    //答案所在位置
    
    CGPoint answer1Location;
    CGPoint answer2Location;
    CGPoint answer3Location;
    
    
    //答案框所在位置
    CGPoint answer1FramePosition;
    CGPoint answer2FramePosition;
    CGPoint answer3FramePosition;
    
    //答案序号所在位置
    CGPoint answer1IndexLocation;
    CGPoint answer2IndexLocation;
    CGPoint answer3IndexLocation;
    
    //笑脸的位置
    CGPoint happyBubsySpritePosition;
    
    //界面视觉元素
    
    //问题
    CCLabelTTF *questionTitle;
    
    //倒计时标签
    CCLabelTTF *countdownLabel;
    
    //暂停菜单
    CCMenuItem *pauseMenuItem;
    
    //问题框位置
    CGPoint quizFramePosition;
    
    //答案菜单项
    CCMenu *possibleAnswerMenu;
    
    CCMenuItem *possibleAnswer1MenuItem;
    CCMenuItem *possibleAnswer2MenuItem;
    CCMenuItem *possibleAnswer3MenuItem;
    
    //答案内容
    CCLabelTTF *possibleAnswer1;
    CCLabelTTF *possibleAnswer2;
    CCLabelTTF *possibleAnswer3;
    
    //答案数字编号标签
    CCSprite *answer1index;
    CCSprite *answer2index;
    CCSprite *answer3index;
    
    //卡通形象
    CCSprite *thinkingface;
    CCSprite *smilingface;
    CCSprite *sadface;
    
    
    //数据信息
    int correctAnswerIndex;
    
    //问题类型
    
    //  int questionType;
    
    //当前题目编号（关卡中）
    int currentQuestionIndex;
    
    //当前关卡的问题数量
    int totalQuestionNumberOfCurrentLevel;
    
    //倒计时剩余时间
    int leftTimeForThisQuestion;
    
    //玩家生命
    int userLife;
    
    
    //道具1- 叫兽的爱 的剩余数量
    
    int leftNumberOfGameProp1;
    
    //道具2- 空空的胸 的剩余数量
    
    int leftNumberOfGameProp2;
    
    //道具3- 戴三个表 的剩余数量
    
    int leftNumberOfGameProp3;
    
    //道具4- 女神凝望 的剩余数量（暂不启用）
    int leftNumberOfGameProp4;
    
    //所选答案的选项编号
    int selectedAnswerIndex;
    
    //当前答案选项是否选中
    BOOL answerMenuItem1Selected;
    BOOL answerMenuItem2Selected;
    BOOL answerMenuItem3Selected;
    
    //当前问题是否回答正确
    BOOL isUserCorrect;
    
    //是否使用了道具
    BOOL isGameProp1Used;
    BOOL isGameProp2Used;
    BOOL isGameProp3Used;
    BOOL isGameProp4Used;
    
    //已经回答的问题数量
    int numberOfAnsweredQuestions;
    
    //已经错误回答的问题数量
    int numberOfWrongAnswers;
    
    //已经正确回答的问题数量
    int numberOfCorrectAnswers;
    
    //当前关卡是否通过
    BOOL levelClear;
    
    //关卡编号

    int levelNumber;
    
    //题目在数据库中的编号
    int questionIndexOfDatabase;
    
    //剩余的问题数量
    int numberOfLeftQuestions;
    
    NSMutableArray *quizDetails;
    
    //是否摇晃
    bool shake_once;
    

    
    //scrolling background
    

    
    CCSprite *bg;
    


    
}
+(CCScene*)scene;

@property (nonatomic, assign) int uniqueId;
@property (nonatomic, assign) int type;
@property (nonatomic, assign) int questionIndex;

@end
