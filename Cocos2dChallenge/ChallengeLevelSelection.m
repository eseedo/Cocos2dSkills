//
//  ChallengeLevelSelection.m
//  Cocos2dChallenge
//
//  Created by Ricky on 12/27/12.
//  Copyright 2012 happybubsy. All rights reserved.
//

#import "ChallengeLevelSelection.h"
#import "SceneManager.h"
#import "SimpleAudioEngine.h"
#import "GameData.h"
#import "Constants.h"



@implementation ChallengeLevelSelection

+(CCScene*)scene{
    
    CCScene *scene = [CCScene node];
    ChallengeLevelSelection *layer = [ChallengeLevelSelection node];
    [scene addChild:layer];
    return scene;
    
}



//添加背景图片
-(void)addBg{
    
    CGSize size = [CCDirector sharedDirector].winSize;
    
    bg = [CCSprite spriteWithFile:@"bg_common-ipad.png"];
    
    bg.position = ccp(size.width/2,size.height/2);
    
    [self addChild:bg z:-1];
    
}
-(void)addBackButton{
    
    CGSize size = [CCDirector sharedDirector].winSize;
    
    backButton = [CCMenuItemImage itemWithNormalImage:@"button_back-ipad.png" selectedImage:nil target:self selector:@selector(backButtonPressed)];
    
    backButton.position = ccp(size.width*0.85,size.height*0.85);
    
    CCMenu *menu = [CCMenu menuWithItems:backButton, nil];
    menu.position = ccp(0,0);
    [self addChild:menu];
    
}

//button pressed
-(void)backButtonPressed{
    
    [backButton runAction:[CCRotateBy actionWithDuration:0.5 angle:360]];
    
    [self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.5],[CCCallFunc actionWithTarget:self selector:@selector(backToStartScene)] ,nil]];
}
-(void)backToStartScene{
    //播放音效
    [[SimpleAudioEngine sharedEngine]playEffect:@"menuenter.wav"];
    
    [SceneManager goStartGame];
}

-(void)playBackgroundMusic{
    
    GameData *data = [GameData sharedData];
    if ( data.backgroundMusicMuted == NO ) {
        
        if([SimpleAudioEngine sharedEngine].isBackgroundMusicPlaying == NO)
        {
            
            [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"start.mp3" loop:YES];
        }
        
    }

    
}

//set menu positions
-(void)setMenuPositions{
    
    
    CGSize size = [CCDirector sharedDirector].winSize;
    newbieMenuItemPosition = ccp(size.width*0.25,size.height*0.5);
    coderMenuItemPosition = ccp(size.width*0.5,size.height*0.5);
    hackerMenuItemPosition = ccp(size.width*0.75,size.height*0.5);
    masterMenuItemPosition = ccp(size.width*0.25,size.height*0.3);
    monsterMenuItemPosition = ccp(size.width*0.5,size.height*0.3);
    
    
}
//add level selection menu

-(void)addLevelSelectionMenu{
    
    newbieMenuItem = [CCMenuItemImage itemWithNormalImage:@"button_newbie-ipad.png" selectedImage:nil target:self selector:@selector(enterChallengeGameScene:)];
    
    if([GameData sharedData].isLevel2Unlocked == YES){
        
           coderMenuItem = [CCMenuItemImage itemWithNormalImage:@"button_coder-ipad.png" selectedImage:nil target:self selector:@selector(enterChallengeGameScene:)];
        
    }else if([GameData sharedData].isLevel2Unlocked == NO){
        
            coderMenuItem = [CCMenuItemImage itemWithNormalImage:@"button_locked-ipad.png" selectedImage:nil target:self selector:@selector(alertPopUp)];
        
    }
    if([GameData sharedData].isLevel3Unlocked == YES){
        
        
        hackerMenuItem = [CCMenuItemImage itemWithNormalImage:@"button_hacker-ipad.png" selectedImage:nil target:self selector:@selector(enterChallengeGameScene:)];
        
    }else if([GameData sharedData].isLevel3Unlocked == NO){
        
        hackerMenuItem = [CCMenuItemImage itemWithNormalImage:@"button_locked-ipad.png" selectedImage:nil target:self selector:@selector(alertPopUp)];
        
    }
    if([GameData sharedData].isLevel4Unlocked == YES){
        
        
        masterMenuItem = [CCMenuItemImage itemWithNormalImage:@"button_master-ipad.png" selectedImage:nil target:self selector:@selector(enterChallengeGameScene:)];
        
    }else if([GameData sharedData].isLevel4Unlocked == NO){
        
        masterMenuItem = [CCMenuItemImage itemWithNormalImage:@"button_locked-ipad.png" selectedImage:nil target:self selector:@selector(alertPopUp)];
        
    }
    if([GameData sharedData].isLevel5Unlocked == YES){
        
        
        monsterMenuItem = [CCMenuItemImage itemWithNormalImage:@"button_monster-ipad.png" selectedImage:nil target:self selector:@selector(enterChallengeGameScene:)];
        
    }else if([GameData sharedData].isLevel5Unlocked == NO){
        
        monsterMenuItem = [CCMenuItemImage itemWithNormalImage:@"button_locked-ipad.png" selectedImage:nil target:self selector:@selector(alertPopUp)];
        
    }

    
    newbieMenuItem.position = newbieMenuItemPosition;
    coderMenuItem.position = coderMenuItemPosition;
    hackerMenuItem.position = hackerMenuItemPosition;
    masterMenuItem.position = masterMenuItemPosition;
    monsterMenuItem.position = monsterMenuItemPosition;
    
    newbieMenuItem.tag = kTagLevelNewbie;
    coderMenuItem.tag = kTagLevelCoder;
    hackerMenuItem.tag = kTagLevelHacker;
  
    masterMenuItem.tag = kTagLevelMaster;
      monsterMenuItem.tag =kTagLevelMonster;
    
     

    
    levelMenu = [CCMenu menuWithItems:newbieMenuItem,coderMenuItem,hackerMenuItem,masterMenuItem,monsterMenuItem, nil];
    levelMenu.position = CGPointZero;
  
    [self addChild:levelMenu z:0];
    
}

-(void)alertPopUp{
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Please complete the previous level" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
}

-(void)enterChallengeGameScene:(id)sender{
    
    CCMenuItem *item = (CCMenuItem*)sender;
    int selectedItem = item.tag;
    
    switch (selectedItem) {
        case kTagLevelNewbie:
            [GameData sharedData].selectedLevel = 1;
            break;
        case kTagLevelCoder:
            [GameData sharedData].selectedLevel = 2;
            break;
        case kTagLevelHacker:
            [GameData sharedData].selectedLevel = 3;
            break;
        case kTagLevelMaster:
            [GameData sharedData].selectedLevel = 4;
            break;
        case kTagLevelMonster:
            [GameData sharedData].selectedLevel = 5;
            break;
        default:
            break;
    }
    
    [SceneManager goChallengeGameScene];
}


#pragma mark init

-(id)init{
    
    if((self = [super init])){
        
        [self setMenuPositions];
        [self addBackButton];
        [self addBg];
        [self playBackgroundMusic];
        [self addLevelSelectionMenu];
    }
    return self;
    
}

@end
