//
//  About.m
//  AngryPanda
//
//  Created by Ricky Wang on 3/21/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "AboutUs.h"
#import "GameSounds.h"
#import "SceneManager.h"
#import "GameData.h"
#import "SimpleAudioEngine.h"



@implementation AboutUs



+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	AboutUs *layer = [AboutUs node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}


//设置视觉元素位置
-(void)setMenuLocation{
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    backMenuLocation = ccp(screenSize.width*0.85,screenSize.height*0.85);
    
}


//button pressed
-(void)backButtonPressed{
    
    [backButton runAction:[CCRotateBy actionWithDuration:0.5 angle:360]];
    
    [self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.5],[CCCallFunc actionWithTarget:self selector:@selector(backToStart)] ,nil]];
}

//返回游戏开始界面
-(void)backToStart{
    
    
    //播放音效
    [[SimpleAudioEngine sharedEngine]playEffect:@"menuenter.wav"];
    
    [SceneManager goStartGame];
    
    
}

//添加返回按钮
-(void)addBackItem{
    
    backButton = [CCMenuItemImage itemWithNormalImage:@"button_back-ipad.png" selectedImage:nil target:self selector:@selector(backButtonPressed)];
    
    CCMenu *menuButton = [CCMenu menuWithItems:backButton,  nil];
    menuButton.position = backMenuLocation;
    [self addChild:menuButton z:1];
    
}

//添加背景图片
-(void)addBg{
    
CGSize size = [CCDirector sharedDirector].winSize;
    
    bg = [CCSprite spriteWithFile:@"bg_common-ipad.png"];

    bg.position = ccp(size.width/2,size.height/2);
    
    [self addChild:bg z:-1];
    
}


//添加字幕
-(void)addTextLabel{
    
    CGSize screenSize =[CCDirector sharedDirector].winSize;
    
    //游戏标题
    CCSprite *gameTitle = [CCSprite spriteWithFile:@"bg_gametitle-ipad.png"];
    gameTitle.position = ccp(screenSize.width*0.5,screenSize.height*1.1);
    gameTitle.scale = 0.8;
    
    id titleAction = [CCSequence actions:[CCMoveTo actionWithDuration:1.0f position:ccp(screenSize.width*0.5,screenSize.height*0.7)],[CCMoveTo actionWithDuration:1.0f position:ccp(screenSize.width*0.5,screenSize.height*0.8)],[CCMoveTo actionWithDuration:1.0f position:ccp(screenSize.width*0.5,screenSize.height*0.7)], nil];
    
    [gameTitle runAction:titleAction];
    [self addChild:gameTitle z:2];
    
        //第一行 工作室
    CCLabelTTF *label1 = [CCLabelTTF labelWithString:@"@Copyright 2013 Cocos2d Learning"  fontName:@"ChalkboardSE-Bold" fontSize:25];
    
    label1.position =ccp(screenSize.width/2,screenSize.height*0.5);
    label1.color = ccc3(16,174,231);
//    label1.color = ccc3(0,0,0);
    
    [self addChild:label1 z:2];
    
    //第二行 主策划
    
    CCLabelTTF *label2 = [CCLabelTTF labelWithString:@"Designed by Cococs2d brother"  fontName:@"ChalkboardSE-Bold" fontSize:25];
    
    label2.position =ccp(screenSize.width/2,screenSize.height*0.4);
    
     label2.color = ccc3(16,174,231);
//      label2.color = ccc3(0,0,0);
    [self addChild:label2 z:2];
    
    //第三行 主美
    
    CCLabelTTF *label3 = [CCLabelTTF labelWithString:@"Arts by Cococs2d sister" fontName:@"ChalkboardSE-Bold" fontSize:25];
    label3.position =ccp(screenSize.width/2,screenSize.height*0.3);
     label3.color = ccc3(16,174,231);
//      label3.color = ccc3(0,0,0);
    [self addChild:label3 z:2];
    
    //第四行 主音效
    CCLabelTTF *label4 = [CCLabelTTF labelWithString:@"Music by Cococs2d cat" fontName:@"ChalkboardSE-Bold" fontSize:25];
    label4.position =ccp(screenSize.width/2,screenSize.height*0.2);
     label4.color = ccc3(16,174,231);
//      label4.color = ccc3(0,0,0);
    
    [self addChild:label4 z:2];
    

    
    //copyright

}


#pragma mark more apps

#pragma mark title




//给作者写邮件
-(void)mailToMe{
    NSURL *url = [NSURL URLWithString:@"mailto://eseedo@gmail.com"];
    [[UIApplication sharedApplication] openURL:url];
}


//music


-(void)updateMusic:(ccTime)time{
    
    int soundChoice = (arc4random()%5);
    
    switch (soundChoice)
    {
        case 0:
            [[SimpleAudioEngine sharedEngine]playEffect:@"saveme.mp3"];
            break;
        case 1:
            [[SimpleAudioEngine sharedEngine]playEffect:@"magic3.mp3"];
        case 2:
            [[SimpleAudioEngine sharedEngine]playEffect:@"magic2.mp3"];
            
        case 3:
            [[SimpleAudioEngine sharedEngine]playEffect:@"attack-add2.mp3"];
            
        case 4:
            [[SimpleAudioEngine sharedEngine]playEffect:@"magic1-2.mp3"];
            
        default:
            [[SimpleAudioEngine sharedEngine]playEffect:@"saveme.mp3"];
            break;
            
    }
}

//添加卷轴
-(void)addMenuBackground{

    CGSize size = [CCDirector sharedDirector].winSize;
    
    CCSprite *menuBackground = [CCSprite spriteWithFile:@"rollbg-ipad.png"];
    menuBackground.opacity = 50;
    
    menuBackground.position = ccp(size.width/2,size.height*0.5);
    
   
    
    [self addChild:menuBackground z:0];
    

}

//背景音乐

//添加背景音乐
-(void)playBackgroundMusic{
    

[[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"about.mp3" loop:YES];

    
    
}

//场景初始化


-(id)init{
    if((self = [super init])){
        [self setMenuLocation];
        [self addBg];
        [self addMenuBackground];
        [self addBackItem];
        
        [self addTextLabel];
        [self playBackgroundMusic];
        
        [self schedule:@selector(updateMusic:) interval:6.0f];
        
    }
    return self;
    
}



@end
