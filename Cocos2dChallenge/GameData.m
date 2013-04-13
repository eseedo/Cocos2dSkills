//
//  GameData.m
//  DoomsDay2012
//
//  Created by eseedo on 9/11/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//


#import "GameData.h"
#import "Constants.h"
#import "SimpleAudioEngine.h"

@implementation GameData


@synthesize currentNumberOfGameProp1,currentNumberOfGameProp2,currentNumberOfGameProp3,currentNumberOfGameProp4;

@synthesize userLife;

@synthesize numberOfCorrectAnswerOfCurrentLevel;
@synthesize numberOfAnsweredQuestionOfCurrentLevel;
@synthesize numberOfWrongAnswerOfCurrentLevel;
@synthesize appearedQuestionIndexArray;
@synthesize currentQuestionIndex;

@synthesize notFirstTimePlayThisGame,notFirstTimeEnterStore;
@synthesize gamePaused;

@synthesize selectedLevel = _selectedLevel;
@synthesize soundEffectMuted,backgroundMusicMuted;


@synthesize currentLevelSolved,currentLevelUnlocked;

@synthesize levelsCompleted;

@synthesize isLevel2Unlocked,isLevel3Unlocked,isLevel4Unlocked,isLevel5Unlocked;

@synthesize isCurrentLevelPassed;

@synthesize currentLevelStar;

@synthesize numberOfUnusedQuestions;


static GameData *sharedData = nil;

+(GameData*) sharedData {
    
    if (sharedData == nil) {
        sharedData = [[GameData alloc] init] ;
        
    }
    return  sharedData;
    
}


-(id) init
{
    
    //无法获取数据的愿意可能在此，也即使用了参数
    
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        
        sharedData = self;
        
        defaults = [NSUserDefaults standardUserDefaults];
        
        currentNumberOfGameProp1 = [defaults integerForKey:@"currentNumberOfGameProp1"];
        currentNumberOfGameProp2 = [defaults integerForKey:@"currentNumberOfGameProp2"];
        currentNumberOfGameProp3 = [defaults integerForKey:@"currentNumberOfGameProp3"];
        currentNumberOfGameProp4 = [defaults integerForKey:@"currentNumberOfGameProp4"];
        
        
        numberOfCorrectAnswerOfCurrentLevel = [defaults integerForKey:@"correctAnswerOfCurrentLevel"];
        numberOfAnsweredQuestionOfCurrentLevel = [defaults integerForKey:@"numberOfAnsweredQuestionOfCurrentLevel"];
        numberOfWrongAnswerOfCurrentLevel = [defaults integerForKey:@"numberOfWrongAnswerOfCurrentLevel"];
        
        userLife = [defaults integerForKey:@"userLife"];
        
        currentQuestionIndex = [defaults integerForKey:@"currentQuestionIndex"];
        numberOfUnusedQuestions = [defaults integerForKey:@"numberOfUnusedQuestions"];
        
        
        currentLevelSolved = [defaults boolForKey:@"currentLevelSolved"];
        
        currentLevelUnlocked = [defaults boolForKey:@"currentLevelUnlocked"];

        
        
        soundEffectMuted = [defaults boolForKey:@"soundEffectMuted"];   //默认值为NO
        backgroundMusicMuted = [defaults boolForKey:@"backgroundMusicMuted"];   //默认值为NO
        
        
        gamePaused = [defaults boolForKey:@"gamePaused"];
        
        
        
        notFirstTimePlayThisGame = [defaults boolForKey:@"notFirstTimePlayThisGame"];
        notFirstTimeEnterStore = [defaults boolForKey:@"notFirstTimeEnterStore"];
        
        
        levelsCompleted = [defaults integerForKey:@"levelsCompletedTotal"];
        
        currentLevelStar = [defaults integerForKey:@"currentLevelStar"];

        
        isLevel2Unlocked = [defaults boolForKey:@"isLevel2Unlocked"];
        isLevel3Unlocked = [defaults boolForKey:@"isLevel3Unlocked"];
        isLevel4Unlocked = [defaults boolForKey:@"isLevel4Unlocked"];
        isLevel5Unlocked = [defaults boolForKey:@"isLevel5Unlocked"];
        
        
        isCurrentLevelPassed = [defaults boolForKey:@"isCurrentLevelPassed"];
        
        //默认选择的关卡

        _selectedLevel =1;
        
        
        //关卡成就相关
        
        //默认数值是否改变
        
        appearedQuestionIndexArray = [defaults mutableArrayValueForKey:@"appearedQuestionIndexArray"];
        
    }
    
    return self;
}





@end
