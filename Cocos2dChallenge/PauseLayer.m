//
//  PauseLayer.m
//  BeautifulLife
//
//  Created by eseedo on 8/16/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "PauseLayer.h"
#import "SceneManager.h"
#import "SimpleAudioEngine.h"
#import "GameData.h"
#import "Constants.h"

@implementation PauseLayer

@synthesize delegate;

+ (id) layerWithColor:(ccColor4B)color delegate:(id)_delegate

{
    
    return [[[self alloc] initWithColor:color delegate:_delegate] autorelease];
    
}

- (id) initWithColor:(ccColor4B)c delegate:(id)_delegate {
    
    self = [super initWithColor:c];
    
    if (self != nil) {
        
        
        delegate = _delegate;
        
        [self pauseDelegate];
        
        [self createPausedMenu];
//        [self addScrollingBackground];
//        [self scheduleUpdate];
    }
    
    return self;
    
}

//添加滚动背景
-(void)addScrollingBackground{
    
    CGSize size = [CCDirector sharedDirector].winSize;
    
    backgroundNode = [CCParallaxNode node];
    
    [self addChild:backgroundNode z:-1];
    
    
    bg = [CCSprite spriteWithFile:@"bg_iphone-retina4.jpg"];
    spacialanomaly = [CCSprite spriteWithFile:@"bg_spacialanomaly.png"];
    
    
    CGPoint bgSpeed = ccp(0.05,0.05);
    
    [backgroundNode addChild:bg z:-1 parallaxRatio:bgSpeed positionOffset:ccp(300,size.height*0.5)];
    [backgroundNode addChild:spacialanomaly z:-1 parallaxRatio:bgSpeed positionOffset:ccp(size.width/2,size.height*0.3)];
    
    
    
}

-(void)update:(ccTime)dt{
    
    CGSize size = [CCDirector sharedDirector].winSize;
    CGPoint backgroundScrollVel = ccp(-size.width,0);
    backgroundNode.position = ccpAdd(backgroundNode.position, ccpMult(backgroundScrollVel, dt));
    NSArray *backgrounds = [NSArray arrayWithObjects:bg,spacialanomaly, nil];
    for(CCSprite *background in backgrounds){
        
        if([backgroundNode convertToWorldSpace:background.position].x <-background.contentSize.width) {
            
            backgroundNode.position = ccp(size.width*1.7,0);
            //        [backgroundNode incrementOffset:ccp(2000,0) forChild:background];
        }
    }
    
}

//创建暂停画面

-(void)createPausedMenu{
    
    screenSize = [CCDirector sharedDirector].winSize;
    
    
    pauseBg = [CCSprite spriteWithFile:@"rollbg-ipad.png"];
    //  pauseBg.opacity = 50;
    
 
    //创建文字2
    pauseText2 = [CCLabelTTF labelWithString:@"Paused" fontName:@"Arial-BoldMT" fontSize:50];
    

    // 创建选择按钮
    item2 =
    [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:@"button_backtolevelselection-ipad.png"]
                            selectedSprite:nil
                                    target:self
                                  selector:@selector(backButtonPressed)];
    // 创建继续按钮
    item3 =
    [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:@"button_continue-ipad.png"]
                            selectedSprite:nil
                                    target:self
                                  selector:@selector(resumeButtonPressed)];
    
    // put all those three buttons on the menu
    pausedMenu = [CCMenu menuWithItems:item2, item3, nil];
    pausedMenu.position = ccp(0,0);
    
    item2.position = ccp(screenSize.width/2,screenSize.height*0.5);
    item3.position = ccp(screenSize.width/2,screenSize.height*0.3);
    
    pauseBg.position = ccp(screenSize.width/2,screenSize.height/2);

    pauseText2.position = ccp(screenSize.width*0.5,screenSize.height*0.74);
    
    
    // add the Paused sprite and menu to the current layer
    [self addChild:pauseBg z:0];
    [self addChild:pausedMenu z:100];

    [self addChild:pauseText2 z:10];
    
    
}

-(void)storeButtonPressed{
    [item1 runAction:[CCRotateBy actionWithDuration:0.5 angle:0]];
    
    [self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.1],[CCCallFunc actionWithTarget:self selector:@selector(goStore)] ,nil]];
    
    
    
}
-(void)backButtonPressed{
    
    [item2 runAction:[CCRotateBy actionWithDuration:0.5 angle:0]];
    
    [self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.1],[CCCallFunc actionWithTarget:self selector:@selector(goLevelSelection)] ,nil]];
    
}

-(void)resumeButtonPressed{
    
    [item3 runAction:[CCRotateBy actionWithDuration:0.5 angle:0]];
    
    [self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.1],[CCCallFunc actionWithTarget:self selector:@selector(doResume:)] ,nil]];
    
}

-(void)resetDatabase{
    
    //重置问题总数
    [GameData sharedData].numberOfUnusedQuestions = TotalNumberOfQuestionInDatabase;
}

-(void)goLevelSelection{
    
    [[SimpleAudioEngine sharedEngine]stopBackgroundMusic];
    [self resetDatabase];
    
    [SceneManager goChallengeLevelSelect];
}

-(void)goStore{
    [SceneManager goGameStore];
}


-(void)pauseDelegate

{
    
    if([delegate respondsToSelector:@selector(pauseLayerDidPause)])
        
        [delegate pauseLayerDidPause];
    
    [delegate onExit];
    
    [delegate.parent addChild:self z:10];
    
}

-(void)doResume: (id)sender

{
    
    [delegate onEnter];
    
    if([delegate respondsToSelector:@selector(pauseLayerDidUnpause)])
        
        [delegate pauseLayerDidUnpause];
    
    [self.parent removeChild:self cleanup:YES];
    
}

-(void)dealloc

{
    
    [super dealloc];
    
}

@end
