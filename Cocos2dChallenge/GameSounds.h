//
//  GameSounds.h

/*
 
 与游戏音效相关的类，游戏中音效的加载，播放和控制均在该类中统一管理
 该类的主要作用是预加载游戏中所需的各类音效，并定义了在不同情况下会播放不同的音效。
 
 */


#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface GameSounds : CCNode {
    
    
    NSString *delayedSoundEffectName;
    unsigned char musicTrackNumber;
}



+(GameSounds*) sharedGameSounds;

-(void) disableSoundEffect;
-(void) enableSoundEffect;
-(void) playSoundEffect:(NSString*)fileName;
//-(void) playSoundEffectWithDelay:(NSString*)fileName:(float)delayTime;



-(void) playBackgroundMusic;
-(void) stopBackgroundMusic;
-(void) restartBackgroundMusic;
-(void) playAboutSceneMusic;


-(void) preloadSounds;

-(void) levelClear;
-(void) levelLose;



@end
