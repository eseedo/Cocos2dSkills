//
//  ChallengeLevelResult.m
//  Cocos2dChallenge
//
//  Created by Ricky on 12/27/12.
//  Copyright 2012 happybubsy. All rights reserved.
//

#import "ChallengeLevelResult.h"
#import "GameData.h"
#import "SimpleAudioEngine.h"
#import "SceneManager.h"
#import "Constants.h"


@implementation ChallengeLevelResult

+(CCScene*)scene{
    
    CCScene *scene = [CCScene node];
    ChallengeLevelResult *layer = [ChallengeLevelResult node];
    [scene addChild:layer];
    return scene;
    
}

#pragma mark 设置视觉元素的位置

-(void)setMenuLocation{
    
    CGSize size = [CCDirector sharedDirector].winSize;
    
    resultBgLocation = ccp(size.width/2,size.height/2);
    starsLocation = ccp(size.width*0.5,size.height*0.8);
    
    resultTextLocation = ccp(size.width*0.5,size.height*0.6);
    
    resultLabelLocation = ccp(size.width*0.5,size.height*0.67);

}

#pragma mark 读取数据

//读取LevelManager中的数据

-(void)readData{
    
    
    
    //从GameData类中读取数据,是否通关，评价等
    
    GameData *data =[GameData sharedData];
    

    levelNumber = data.selectedLevel;
    
    levelClear = data.isCurrentLevelPassed;
    
    levelStars = data.currentLevelStar;
    

    

}

//解锁新场景
-(void)unlockNextLevel{
    
    if(levelClear == YES){
        
        switch (levelNumber) {
            case 1:
                [GameData sharedData].isLevel2Unlocked = YES;
                break;
            case 2:
                [GameData sharedData].isLevel3Unlocked = YES;
                break;
            case 3:
                [GameData sharedData].isLevel4Unlocked = YES;
                break;
            case 4:
                [GameData sharedData].isLevel5Unlocked = YES;
                break;
            default:
                break;
        }
        
    }
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


#pragma mark 显示关卡名称和历史最高得分

//显示关卡名称和历史最高得分
-(void)addLevelTitle{
    
    screenSize = [CCDirector sharedDirector].winSize;
    //only you
    
    
    if(levelClear){
        CCLabelTTF *text1 = [CCLabelTTF labelWithString:@"You've passed this level!" fontName:@"Arial-BoldMT" fontSize:16];
        
        text1.position = resultTextLocation;
        //    text1.anchorPoint = ccp(0.5f,0.5f);
        
        [self addChild:text1 z:10];
        
        
        
        
    }else if(!levelClear){
        CCLabelTTF *text1 = [CCLabelTTF labelWithString:@"Oops... You'd better learn more about cocos2d!" fontName:@"Arial-BoldMT" fontSize:16];
        
        text1.position =resultTextLocation;
        
        //    text1.anchorPoint = ccp(0,0.5f);
        
        [self addChild:text1 z:10];
        
        
        
        
    }
}

//显示游戏结果

-(void)addResult{
    
    screenSize = [CCDirector sharedDirector].winSize;
    //显示过关或失败的标签
    if(levelStars ==3){
        
        //显示过关或失败的标签
        CCLabelTTF *clear = [CCLabelTTF labelWithString:@"Perfect!" fontName:@"ChalkboardSE-Bold" fontSize:50];
        
        //添加星星
        CCSprite *star = [CCSprite spriteWithFile:@"3stars-ipad.png"];
        
        clear.position = resultLabelLocation;
        star.position = starsLocation;
        
        
        [self addChild:clear z:10];
        [self addChild:star z:10];
        
    }else if(levelStars ==2){
        
        //显示过关或失败的标签
        
        CCLabelTTF *clear = [CCLabelTTF labelWithString:@"Wonderful!" fontName:@"ChalkboardSE-Bold" fontSize:50];
        
        //添加星星
        CCSprite *star = [CCSprite spriteWithFile:@"2stars-ipad.png"];
        
        clear.position = resultLabelLocation;
        star.position = starsLocation;
        
        
        [self addChild:clear z:10];
        [self addChild:star z:10];
        
    }else if(levelStars ==1){
        //显示过关或失败的标签
        
        CCLabelTTF *clear = [CCLabelTTF labelWithString:@"Level Complete!" fontName:@"ChalkboardSE-Bold" fontSize:50];
        
        //添加星星
        CCSprite *star = [CCSprite spriteWithFile:@"1star-ipad.png"];
        
        clear.position = resultLabelLocation;
        star.position = starsLocation;
        
        
        [self addChild:clear z:10];
        [self addChild:star z:10];
        
    }else if(levelStars ==0){
        
        //显示过关或失败的标签
        
        CCLabelTTF *clear = [CCLabelTTF labelWithString:@"Level Failed!" fontName:@"ChalkboardSE-Bold" fontSize:50];
        
        //添加星星
        CCSprite *star = [CCSprite spriteWithFile:@"0star-ipad.png"];
        
        
        clear.position = resultLabelLocation;
        star.position = starsLocation;
        
        
        [self addChild:clear z:10];
        [self addChild:star z:10];
        
    }
    
}

//停止播放背景音乐
-(void)stopBackgroundMusic{
    
    [[SimpleAudioEngine sharedEngine]stopBackgroundMusic];
}


-(void)item1Pressed{
    
    //    [item1 runAction:[CCRotateBy actionWithDuration:0.5 angle:90]];
    
    [self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.5],[CCCallFunc actionWithTarget:self selector:@selector(shareToSocialNetwork)] ,nil]];
    
}

-(void)shareToSocialNetwork{
    
    NSString *systemVersion = [UIDevice currentDevice].systemVersion;
    BOOL isSystemVersionAfter6 = NO;
    if([systemVersion isEqualToString:@"6.0"] || [systemVersion isEqualToString:@"6.0.1"] || [systemVersion isEqualToString:@"6.1"])  {
        isSystemVersionAfter6 = YES;
    }
    
    NSLog(@"systemversion is:%@",systemVersion);
    
    if(isSystemVersionAfter6){
        
        NSString *initialText = [NSString stringWithFormat:@"I found a great game challenging your cocos2d skill,come to have a try:)"];
        
        UIActivityViewController *activityViewController =
        [[UIActivityViewController alloc] initWithActivityItems:@[initialText] applicationActivities:nil];
        [[[CCDirector sharedDirector]parentViewController]  presentViewController:activityViewController animated:YES completion:nil];
    }
    else{
        NSURL *url = [NSURL URLWithString:@"mailto://happybubsy@126.com"];
        [[UIApplication sharedApplication]openURL:url];
    }
}

-(void)item2Pressed{
    
    //    [item2 runAction:[CCRotateBy actionWithDuration:0.5 angle:90]];
    
    [self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.5],[CCCallFunc actionWithTarget:self selector:@selector(backToLevelSelection)] ,nil]];
    
    
}
-(void)item3Pressed{
    
    
    //    [item3 runAction:[CCRotateBy actionWithDuration:0.5 angle:90]];
    
    [self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.5],[CCCallFunc actionWithTarget:self selector:@selector(playNextLevel)] ,nil]];
    
}

-(void)item4Pressed{
    
    
    //    [item4 runAction:[CCRotateBy actionWithDuration:0.5 angle:90]];
    
    [self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.5],[CCCallFunc actionWithTarget:self selector:@selector(replayCurrentLevel)] ,nil]];
    
}

//返回关卡选择界面

-(void)backToLevelSelection{
    [self stopBackgroundMusic];
    
    [SceneManager goChallengeLevelSelect];
    
}

//重玩当前关卡
-(void)replayCurrentLevel{
    
    [self stopBackgroundMusic];
    //根据关卡编号的进入不同关卡场景
    
    
    [GameData sharedData].selectedLevel =levelNumber;
    
    [SceneManager goChallengeGameScene];
    
    
}

//进入下一个关卡
-(void)playNextLevel{
    
    [self stopBackgroundMusic];
    GameData *gamedata =[GameData sharedData];
    
    //判断是否下一个关卡已解锁
    if(levelClear ==YES && gamedata.selectedLevel < 5)
    {
        
        gamedata.selectedLevel++;
        
        
        [SceneManager goChallengeGameScene];
        
    }
    
    
}


#pragma mark 显示菜单选项

//显示三个菜单选项
-(void)addMenuItems{
    
    CGSize size = [CCDirector sharedDirector].winSize;
    //获取屏幕大小
    
    if(levelClear){
        
        //创建分享按钮
        item1 = [CCMenuItemSprite  itemWithNormalSprite:[CCSprite spriteWithFile:@"button_share-ipad.png"]   selectedSprite:nil target:self selector:@selector(item1Pressed)];

        // 创建选择按钮
        item2 =
        [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:@"button_backtolevelselection-ipad.png"]
                                selectedSprite:nil
                                        target:self
                                      selector:@selector(item2Pressed)];
        // 创建继续按钮
        item3 =
        [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:@"button_continue-ipad.png"]
                                selectedSprite:nil
                                        target:self
                                      selector:@selector(item3Pressed)];
        
        // put all those three buttons on the menu
        resultMenu = [CCMenu menuWithItems:item1,item2, item3, nil];
        item1.position = ccp(size.width/2,size.height*0.2);
        item2.position = ccp(size.width/2,size.height*0.5);
        item3.position = ccp(size.width/2,size.height*0.35);
        

        
        resultMenu.position =  ccp(0,0);
        
        [self addChild:resultMenu];
        
    }else if(!levelClear){
        
        //创建分享按钮
        item1 = [CCMenuItemSprite  itemWithNormalSprite:[CCSprite spriteWithFile:@"button_share-ipad.png"]   selectedSprite:nil target:self selector:@selector(item1Pressed)];
        
        // 创建选择按钮
        item2 =
        [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:@"button_backtolevelselection-ipad.png"]
                                selectedSprite:nil
                                        target:self
                                      selector:@selector(item2Pressed)];
        // 创建继续按钮
        item4 =
        [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:@"button_retry-ipad.png"]
                                selectedSprite:nil
                                        target:self
                                      selector:@selector(item4Pressed)];
        
        // put all those three buttons on the menu
        resultMenu = [CCMenu menuWithItems:item1,item2, item4, nil];

        item1.position = ccp(size.width/2,size.height*0.2);
        item2.position = ccp(size.width/2,size.height*0.5);
        item4.position = ccp(size.width/2,size.height*0.35);
        
        resultMenu.position =  ccp(0,0);
        
        [self addChild:resultMenu];
        
    }
    
}




-(void)playBgMusic{
    
    if(levelClear){
        
        [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"levelpass.mp3" loop:NO];
        
        
    }else {
        
        [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"levelfail.mp3" loop:NO];
        
        
    }
    
}

-(void)resetDatabase{
    
    [GameData sharedData].numberOfUnusedQuestions = TotalNumberOfQuestionInDatabase;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        //设置位置
        [self setMenuLocation];
        
        //读取LevelManager中的数据
        
        [self readData];
        
        //获取游戏关卡的背景并设置透明度
        
        [self addSceneBg];
        
        [self addResultBg];
        
        //显示关卡名称
//        [self addLevelTitle];
        
        //显示菜单选项
        
        [self addMenuItems];
        
        //显示游戏结果
        [self addResult];
        
        //显示游戏奖励
        //    [self addBonus];
        
        //播放背景音乐
        [self playBgMusic];
        
        //解锁新场景
        [self unlockNextLevel];
        
         [self resetDatabase];
        
    }
	return self;
}

@end
