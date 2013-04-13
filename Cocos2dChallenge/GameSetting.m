//
//  GameSetting.m
//  Cocos2dChallenge
//
//  Created by Ricky on 12/27/12.
//  Copyright 2012 happybubsy. All rights reserved.
//

#import "GameSetting.h"
#import "SceneManager.h"
#import "GameData.h"
#import "SimpleAudioEngine.h"

@implementation GameSetting

+(CCScene*)scene{
    
    CCScene *scene = [CCScene node];
    GameSetting *layer = [GameSetting node];
    [scene addChild:layer];
    return scene;
    
}

-(void)addBackButton{
    
    CGSize size = [CCDirector sharedDirector].winSize;
    
    backButton = [CCMenuItemImage itemWithNormalImage:@"button_back-ipad.png" selectedImage:nil target:self selector:@selector(backToStartScene)];
    
    backButton.position = ccp(size.width*0.85,size.height*0.85);
    
    CCMenu *menu = [CCMenu menuWithItems:backButton, nil];
    menu.position = ccp(0,0);
    [self addChild:menu];
    
}

-(void)backToStartScene{
    
    [SceneManager goStartGame];
}


//添加背景图片
-(void)addBg{
    
    CGSize size = [CCDirector sharedDirector].winSize;
    
   CCSprite *bg = [CCSprite spriteWithFile:@"bg_common-ipad.png"];
    
    bg.position = ccp(size.width/2,size.height/2);
    
    [self addChild:bg z:-1];
    
}
//背景音乐

//添加背景音乐
-(void)playBackgroundMusic{
    
    
    [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"about.mp3" loop:YES];
    
    
    
}

-(id)init{
    
    if((self = [super init])){
        
        [self addBackButton];
        [self playBackgroundMusic];
        [self addBg];
    }
    return self;
    
}

@end
