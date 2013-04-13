//
//  GameSounds.mm


#import "GameSounds.h"
#import "SimpleAudioEngine.h"
#import "Constants.h"
#import "GameData.h"



@implementation GameSounds


static GameSounds *sharedGameSounds = nil;

//场景初始化

-(id) init
{
    
    if ((self = [super init] ))
    {
        
    }
    return self;
    
}

//单例类方法

+(GameSounds*) sharedGameSounds {
    
    if (sharedGameSounds == nil) {
        sharedGameSounds = [[GameSounds alloc] init];
        
    }
    
    return sharedGameSounds;
}

//预加载游戏中所需的音效

-(void) preloadSounds {
    
    //  [[SimpleAudioEngine sharedEngine] preloadEffect:@"bird.mp3"];
    
    
}



//禁用音效
-(void) disableSoundEffect {
    
    //    soundEffectTurnedOff = YES;
    [GameData sharedData].soundEffectMuted = YES;
    
}
//启用音效
-(void) enableSoundEffect {
    
    //    soundEffectTurnedOff = NO;
    [GameData sharedData].soundEffectMuted = NO;
}




//播放音效
-(void) playSoundEffect:(NSString*)fileName {
    
    if ( [GameData sharedData].soundEffectMuted  == NO ) {
        
        [[SimpleAudioEngine sharedEngine] playEffect:fileName];
        
    }
    
}



//在一定的延迟时间后播放音效

//-(void) playSoundEffectWithDelay:(NSString*)fileName:(float)delayTime {
//    
//    if ( [GameData sharedData].soundEffectMuted  == NO ) {
//        
//        delayedSoundEffectName = fileName;
//        [self performSelector:@selector(playThisAfterDelay) withObject:nil afterDelay:delayTime];
//        
//        
//    }
//    
//}





//介绍标签音效

-(void) playIntroSound {
    
    if ( [GameData sharedData].soundEffectMuted  == NO ) {
        
        [[SimpleAudioEngine sharedEngine] playEffect:@"gong.mp3"];
        
    }
    
    
}



//播放背景音乐

-(void) playBackgroundMusic{
    
    
    [[CDAudioManager sharedManager] setMode:kAMM_FxPlusMusicIfNoOtherAudio];
    [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
    
    if ( [GameData sharedData].backgroundMusicMuted  == NO ) {
        
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"startgame.mp3" loop:YES];
        [CDAudioManager sharedManager].backgroundMusic.volume = 0.15f;
    }
    
    
    
}

//停止背景音乐

-(void) stopBackgroundMusic {
    
    [[CDAudioManager sharedManager] setMode:kAMM_FxOnly];
    
    [[SimpleAudioEngine sharedEngine] stopBackgroundMusic ];
    
    [GameData sharedData].backgroundMusicMuted  = YES;
    
    
    
}

//重启背景音乐

-(void) restartBackgroundMusic {
    
    [GameData sharedData].backgroundMusicMuted = NO;
    [self playBackgroundMusic];
}


//播放About页面的背景音乐
-(void)playAboutSceneMusic{
    
    if([GameData sharedData].backgroundMusicMuted == NO){
        [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"startgame.mp3" loop:YES];
    }
}

//关卡胜利
-(void)levelClear{
    if ([GameData sharedData].soundEffectMuted == NO) {
        
        [[SimpleAudioEngine sharedEngine] playEffect:@"levelwin.mp3"];
        
    }
    
}

//关卡失败

-(void)levelLose{
    if ([GameData sharedData].soundEffectMuted == NO) {
        
        [[SimpleAudioEngine sharedEngine] playEffect:@"levelfailure.mp3"];
        
    }
    
}


@end
