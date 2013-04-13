//
//  SceneManager.h
//  DoomsDay2012
//
//  Created by eseedo on 9/11/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

//
//  SceneManager.h
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

/*  ___Template___________________________________
 
 Step 1 - Import header of your SceneName
 ______________________________________________
 
 #import "SceneName.h"
 
 */
#import "StartGameScene.h"

#import "GameSetting.h"
#import "GameHelp.h"
#import "AboutUs.h"
#import "MoreApps.h"

#import "ChallengeLevelSelection.h"
#import "ChallengeGameScene.h"
#import "ChallengeLevelResult.h"
#import "ChallengeFinalResult.h"

#import "CrazyModeGuide.h"
#import "CrazyModeGameScene.h"
#import "CrazyModeResultScene.h"

#import "GameStore.h"




@interface SceneManager : NSObject {
    
}

/*  ___Template___________________________________
 
 Step 2 - Add interface scene calling method
 ______________________________________________
 
 +(void) goSceneName;
 
 */

+(void) goStartGame;

+(void) goGameSetting;

+(void) goGameHelp;

+(void) goMoreApps;

+(void) goAboutUs;

+(void) goChallengeLevelSelect;

+(void) goChallengeGameScene;

+(void) gochallengeLevelResult;

+(void) goChallengeFinalResult;

+(void) goCrazyModeGuide;

+(void) goCrazyModeGameScene;

+(void) goCrazyModeResultScene;

+(void) goGameStore;



@end
