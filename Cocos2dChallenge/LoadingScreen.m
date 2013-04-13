//
//  LoadingScreen.m
//
//  Created by Six Foot Three Foot on 28/05/12.
//  Copyright 2012 Six Foot Three Foot. All rights reserved.
//

#import "LoadingScreen.h"
#import "SimpleAudioEngine.h"
#import "StartGameScene.h"

//The next scene you wish to transition to.
#import "IntroLayer.h"

@implementation LoadingScreen

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	
    NSString *className = NSStringFromClass([self class]);
    // 'layer' is an autorelease object.
    id layer = [NSClassFromString(className) node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
    
    if ( ( self = [ super init] ) )
    {
        
        winSize = [[CCDirector sharedDirector] winSize];
        winCenter = ccp(winSize.width / 2, winSize.height / 2);
        
        CCSprite *loadingBg = [CCSprite spriteWithFile:@"bg_common-ipad.png"];
        loadingBg.position = winCenter;
        [self addChild:loadingBg z:-1];
        
        //Load your assets (background, progress bars, etc)
        
        progress = [CCProgressTimer progressWithSprite:[CCSprite spriteWithFile:@"progressbar-ipad.png"]];
        [progress setPercentage:0.0f];
//        progress.scale = 0.5f;
        progress.midpoint = ccp(0,0.5);
        progress.barChangeRate = ccp(1,0);
        progress.type = kCCProgressTimerTypeBar;
        progress.position =ccp(winSize.width/2,winSize.height*0.65);
//        [progress setPosition:winCenter];
        [self addChild:progress z:5];
        
        CCSprite *progressbar_base = [CCSprite spriteWithFile:@"progressbar_base-ipad.png"];
        progressbar_base.position = ccp(winSize.width/2,winSize.height*0.65);
        [self addChild:progressbar_base];
        
        
//        CCLabelTTF *loadingText = [CCLabelTTF labelWithString:@"Loading..." fontName:@"Arial" fontSize:50];
//        loadingText.position = ccpAdd(progress.position, ccp(0,100));
//        loadingText.color = ccc3(1, 188, 239);
//        [self addChild:loadingText];
        
    }
    
    return self;
}

-(void) onEnterTransitionDidFinish
{
    [super onEnterTransitionDidFinish];
    
    NSString *path = [[CCFileUtils sharedFileUtils] fullPathFromRelativePath:@"preloadAssetManifest.plist"];
    
    NSDictionary *manifest = [NSDictionary dictionaryWithContentsOfFile:path];
    
    NSArray *spriteSheets   = [manifest objectForKey:@"SpriteSheets"];
    NSArray *images         = [manifest objectForKey:@"Images"];
    NSArray *soundFX        = [manifest objectForKey:@"SoundFX"];
    NSArray *music          = [manifest objectForKey:@"Music"];
    NSArray *assets         = [manifest objectForKey:@"Assets"];
    
    assetCount = ([spriteSheets count] + [images count] + [soundFX count] + [music count] + [assets count]);
    progressInterval = 100.0 / (float) assetCount;
    
    if (soundFX)
        [self performSelectorOnMainThread:@selector(loadSounds:) withObject:soundFX waitUntilDone:YES];
    
    if (spriteSheets)
        [self performSelectorOnMainThread:@selector(loadSpriteSheets:) withObject:spriteSheets waitUntilDone:YES];
    
    if (images)
        [self performSelectorOnMainThread:@selector(loadImages:) withObject:images waitUntilDone:YES];
    
    if (music)
        [self performSelectorOnMainThread:@selector(loadMusic:) withObject:music waitUntilDone:YES];
    
    if (assets)
        [self performSelectorOnMainThread:@selector(loadAssets:) withObject:assets waitUntilDone:YES];
    
}

-(void) loadMusic:(NSArray *) musicFiles
{
    CCLOG(@"Start loading music");
    for (NSString *music in musicFiles)
    {
        [[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:music];
        [self progressUpdate];
    }
}


-(void) loadSounds:(NSArray *) soundClips
{
    CCLOG(@"Start loading sounds");
    for (NSString *soundClip in soundClips)
    {
        [[SimpleAudioEngine sharedEngine] preloadEffect:soundClip];
        [self progressUpdate];
        
    }
    
}

-(void) loadSpriteSheets:(NSArray *) spriteSheets
{
    for (NSString *spriteSheet in spriteSheets)
    {
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:spriteSheet];
        [self progressUpdate];
    }
}

-(void) loadImages:(NSArray *) images
{
    CCLOG(@"LoadingScreen - loadImages : You need to tell me what to do.");
    for (NSString *image in images)
    {
        //Do something with the images
        [[CCTextureCache sharedTextureCache] addImage:image];
        [self progressUpdate];
    }
}

-(void) loadAssets:(NSArray *) assets
{
    //Overwrite me
    CCLOG(@"LoadingScreen - loadAssets : You need to tell me what to do.");
    for (NSString *asset in assets)
    {
        //Do something with the assets
        [self progressUpdate];
    }
    [self progressUpdate];
}

-(void) progressUpdate
{
    if (--assetCount)
    {
        [progress setPercentage:(100.0f - (progressInterval * assetCount))];
    }
    else {
        CCProgressFromTo *ac = [CCProgressFromTo actionWithDuration:0.5 from:progress.percentage to:100];
        CCCallBlock *callbak = [CCCallBlock actionWithBlock:^(){
            [self loadingComplete];
            CCLOG(@"All done loading assets.");
            
        }];
        id action = [CCSequence actions:ac,callbak, nil];
        [progress runAction:action];
        
    }
    
}

-(void) loadingComplete
{
    CCDelayTime *delay = [CCDelayTime actionWithDuration:2.0f];
    CCCallBlock *swapScene = [CCCallBlock actionWithBlock:^(void) {
        [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0f
                                                                                     scene:[StartGameScene  scene]]];
    }];
    
    CCSequence *seq = [CCSequence actions:delay, swapScene, nil];
    [self runAction:seq];
}

@end
