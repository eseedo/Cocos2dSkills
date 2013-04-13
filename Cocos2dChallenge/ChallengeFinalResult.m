//
//  ChallengeFinalResult.m
//  Cocos2dChallenge
//
//  Created by Ricky on 12/27/12.
//  Copyright 2012 happybubsy. All rights reserved.
//

#import "ChallengeFinalResult.h"
#import "SimpleAudioEngine.h"
#import "SceneManager.h"
#import "GameData.h"
#import "Constants.h"
#import "GameData.h"


@implementation ChallengeFinalResult

+(CCScene*)scene{
    
    CCScene *scene = [CCScene node];
    ChallengeFinalResult *layer = [ChallengeFinalResult node];
    [scene addChild:layer];
    return scene;
    
}


//添加场景的背景
-(void)addSceneBg{
    
    screenSize = [CCDirector sharedDirector].winSize;
    CCSprite *background = [CCSprite spriteWithFile:@"bg_common-ipad.png"];
    background.position = ccp(screenSize.width/2,screenSize.height/2);
    [self addChild:background z:-1];
    
}

//添加背景并设置透明度

-(void)addResultBg{
    
    screenSize = [CCDirector sharedDirector].winSize;
    
    resultBg = [CCSprite spriteWithFile:@"rollbg-ipad.png"];
    
    resultBg.position =ccp(screenSize.width/2,screenSize.height/2);
    [self addChild:resultBg z:0];
    
}



//停止播放背景音乐
-(void)stopBackgroundMusic{
    
    [[SimpleAudioEngine sharedEngine]stopBackgroundMusic];
}




//add text
-(void)addText{
    
    CGSize size = [CCDirector sharedDirector].winSize;
    
    //显示过关或失败的标签
    CCLabelTTF *clear = [CCLabelTTF labelWithString:@"All Clear" fontName:@"Arial-BoldMT" fontSize:50];
    
    //添加星星
    CCSprite *star = [CCSprite spriteWithFile:@"3stars-hd.png"];
    
    clear.position = ccp(size.width*0.5,size.height*0.67);
    star.position = ccp(size.width*0.5,size.height*0.8);
    
    
    [self addChild:clear z:10];
    [self addChild:star z:10];

    

    
    
}

//返回关卡选择界面

-(void)goStartGame{
    
    [self stopBackgroundMusic];
    
    [SceneManager goStartGame];
    
}

//添加返回按钮

-(void)addBackButton{
    
    CGSize size = [CCDirector sharedDirector].winSize;
    CCMenuItem *backButtonItem = [CCMenuItemImage itemWithNormalImage:@"button_backtolevelselection-ipad.png" selectedImage:nil target:self selector:@selector(backButtonPressed)];
    
    CCMenu *menu = [CCMenu menuWithItems:backButtonItem, nil];
    menu.position = ccp(0,0);
    backButtonItem.position = ccp(size.width/2,size.height*0.3);
    
    [self addChild:menu z:1];
    
}

-(void)backButtonPressed{
    
    //    [item2 runAction:[CCRotateBy actionWithDuration:0.5 angle:90]];
    
    [self goStartGame];
    
}


-(void)playBgMusic{
    
    
    [[SimpleAudioEngine sharedEngine]playEffect:@"about.mp3"];
    
}

-(void)resetDatabase{
    
    //重置问题总数
    [GameData sharedData].numberOfUnusedQuestions = TotalNumberOfQuestionInDatabase;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        //获取屏幕大小
        screenSize = [CCDirector sharedDirector].winSize;
        
        [self addText];
        [self addSceneBg];
        [self addResultBg];
        
        [self addBackButton];
        //播放背景音乐
        [self playBgMusic];
        //reset database
         [self resetDatabase];
        
    }
	return self;
}


@end
