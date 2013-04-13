//
//  SceneManager.m
//  DoomsDay2012
//
//  Created by eseedo on 9/11/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

//
//  SceneManager.m
//

#import "SceneManager.h"


@interface SceneManager ()

+(void) go: (CCLayer *) layer;
+(CCScene *) wrap: (CCLayer *) layer;

@end

@implementation SceneManager

/*  ___Template___________________________________
 
 Step 3 - Add implementation to call scene
 ______________________________________________
 
 
 +(void) goSceneName {
 [SceneManager go:[SceneName node]];
 }
 
 */

#pragma mark 切换场景

+(void) goStartGame {
    [SceneManager go:[StartGameScene node]];
}


+(void) goGameSetting {
    
    [SceneManager go:[GameSetting node]];
}

+(void) goGameHelp{
    
    [SceneManager go:[GameHelp node]];
}

+(void) goMoreApps{
    
    [SceneManager go:[MoreApps node]];
}

+(void) goAboutUs{
    
    [SceneManager go:[AboutUs node]];
}

+(void) goChallengeLevelSelect{
    
    [SceneManager go:[ChallengeLevelSelection node]];
}

+(void) goChallengeGameScene{
    
    [SceneManager go:[ChallengeGameScene node]];
}

+(void) gochallengeLevelResult{
    
    [SceneManager go:[ChallengeLevelResult node]];
    
}

+(void) goChallengeFinalResult{
    
    [SceneManager go:[ChallengeFinalResult node]];
}

+(void) goCrazyModeGuide{
    
    [SceneManager go:[CrazyModeGuide node]];
}

+(void) goCrazyModeGameScene{
    
    [SceneManager go:[CrazyModeGameScene node]];
}

+(void) goCrazyModeResultScene{
    
    [SceneManager go:[CrazyModeResultScene node]];
}

+(void) goGameStore{
    
    [SceneManager go:[GameStore node]];
}


+(void) go: (CCLayer *) layer {
    CCDirector *director = [CCDirector sharedDirector];
    CCScene *newScene = [SceneManager wrap:layer];
    
    
    if ([director runningScene]) {
        
        [director replaceScene:newScene];
        
        
    }
    else {
        [director runWithScene:newScene];
    }
}


#pragma mark 类方法

+(CCScene *) wrap: (CCLayer *) layer {
    CCScene *newScene = [CCScene node];
    [newScene addChild: layer];
    return newScene;
}

@end
