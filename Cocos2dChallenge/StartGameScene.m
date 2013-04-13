//
//  StartGameScene.m
//  DoomsDay2012
//
//  Created by eseedo on 9/11/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "StartGameScene.h"
#import "SimpleAudioEngine.h"
#import "SceneManager.h"
#import "GameSounds.h"
#import "GameData.h"
#import "MobClick.h"
#import "MyNotification.h"
#import "Constants.h"




enum {
  //@notification
  kTagAlertForNotification = 2,
} AlertTag;

@implementation StartGameScene


#pragma mark 类方法

+(id)scene{
  
  CCScene *scene =[CCScene node];
  StartGameScene *layer = [StartGameScene node];
  [scene addChild:layer];
  return scene;
  
}


#pragma mark 获取屏幕大小
//获取屏幕大小

-(void)getScreenSize{
  
  screenSize = [CCDirector sharedDirector].winSize;
}


#pragma mark 添加菜单项

//添加进入挑战模式游戏菜单项
-(void)addStartChallengeMenuItem{
  
  startChallengeItem = [CCMenuItemImage itemWithNormalImage:@"button_start-ipad.png" selectedImage:nil target:self selector:@selector(startChallenge)];
  
  startChallengeItem.position = startChallengeMenuLocation;
  
  
  CCMenu *menu =[CCMenu menuWithItems:startChallengeItem, nil];
  menu.position = CGPointZero;
  
    [self addChild:menu z:2];
  
}



//添加about菜单项
-(void)addAboutItem{
  
  //创建菜单项
  
  aboutItem = [CCMenuItemImage itemWithNormalImage:@"button_aboutus-ipad.png" selectedImage:nil target:self selector:@selector(about)];
  aboutItem.position =aboutMenuLocation;
  
  //创建菜单
  
  CCMenu *menu =[CCMenu menuWithItems:aboutItem, nil];
  menu.position = CGPointZero;
    [self addChild:menu z:2];
  
}

//add setting item

-(void)addSettingItem{
    
    //创建菜单项
    
    settingItem = [CCMenuItemImage itemWithNormalImage:@"button_setting-ipad.png" selectedImage:nil target:self selector:@selector(enterGameSetting)];
    settingItem.position =settingMenuLocation;
    
    //创建菜单
    
    CCMenu *menu =[CCMenu menuWithItems:settingItem, nil];
    menu.position = CGPointZero;
    [self addChild:menu z:2];
    
}

//add setting item

-(void)addMoreItem{
    
    //创建菜单项
    
    moreItem = [CCMenuItemImage itemWithNormalImage:@"button_more-ipad.png" selectedImage:nil target:self selector:@selector(enterMoreGames)];
    moreItem.position =moreMenuLocation;
    
    //创建菜单
    
    CCMenu *menu =[CCMenu menuWithItems:moreItem, nil];
    menu.position = CGPointZero;
    [self addChild:menu z:2];
    
}

#pragma mark add menu

-(void)addGameMenu{
    
    [self addStartChallengeMenuItem];
//    [self addSettingItem];
    [self addMoreItem];
    [self addAboutItem];
}


#pragma mark 通过按钮进入不同的场景




//进入挑战模式的关卡选择界面

-(void)startChallenge{
  //播放音效
  [[SimpleAudioEngine sharedEngine]playEffect:@"menuenter.wav"];
  
    [SceneManager goChallengeLevelSelect];


  
}

//进入游戏介绍画面
-(void)about{
  
  //播放音效
  [[SimpleAudioEngine sharedEngine]playEffect:@"menuenter.wav"];

    
  [SceneManager goAboutUs];
  
}

//enter setting
-(void)enterGameSetting{
    
    [[SimpleAudioEngine sharedEngine]playEffect:@"menuenter.wav"];
    
    
    [SceneManager goGameSetting];
    
}

//enter help
-(void)enterMoreGames{
    
    [[SimpleAudioEngine sharedEngine]playEffect:@"menuenter.wav"];
    
    [SceneManager goMoreApps];
    
//    [SceneManager goGameHelp];
}

#pragma mark 添加其它视觉元素

//添加游戏标题

-(void)addGameTitle{
  
    
   gameTitle = [CCSprite spriteWithFile:@"bg_gametitle-ipad.png"];
    gameTitle.position = titleLocation;
    [self addChild:gameTitle z:0];
    
    
    CCLabelTTF *label = [CCLabelTTF labelWithString:@"Challenge" fontName:@"ChalkboardSE-Bold" fontSize:90];
    label.position = titleLabelLocation;
    label.color = ccc3(16,174,231);
    
    [self addChild:label z:0];

  
}

//添加背景图片
-(void)addBackground{
  
  
  bg = [CCSprite spriteWithFile:@"bg_startscene-ipad.png"];
  
  bg.position = bgLocation;
  
    [self addChild:bg z:-1];
  
}


#pragma mark 播放背景音乐

//添加背景音乐
-(void)playBackgroundMusic{
  
  
  GameData *data = [GameData sharedData];
  if ( data.backgroundMusicMuted == NO ) {
    
  
      [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"start.mp3" loop:YES];

    
  }
  
  
}

#pragma  mark 创建声音设置选项
-(void)createSoundSettingMenu{
    
    
    if([GameData sharedData].soundEffectMuted ==NO){
        [self createSoundMenuOn];
    }else {
        [self createSoundMenuOff];
    }
    
}

#pragma mark 设置音效开关选项

//创建音效开关选项

-(void) createSoundMenuOn{
    
    [self removeChild:soundMenu cleanup:YES];
    
    
    CCMenuItem *button = [CCMenuItemImage itemWithNormalImage:@"musicon-ipad.png" selectedImage:nil target:self selector:@selector(turnSoundOff)];
    
    soundMenu = [CCMenu menuWithItems:button, nil];
    soundMenu.position= soundMenuLocation;
    
    [self addChild:soundMenu z:10  ];
    
    
}
-(void)createSoundMenuOff{
    
    [self removeChild:soundMenu cleanup:YES];
    CCMenuItem *button = [CCMenuItemImage itemWithNormalImage:@"musicoff-ipad.png" selectedImage:nil target:self selector:@selector(turnSoundOn)];
    
    soundMenu = [CCMenu menuWithItems:button, nil];
    soundMenu.position= soundMenuLocation;
    
    [self addChild:soundMenu z:10  ];
    
}


-(void)turnSoundOn{
    
    GameData *data = [GameData sharedData];
    data.backgroundMusicMuted = NO;
    [[SimpleAudioEngine sharedEngine]resumeBackgroundMusic];
    [self createSoundMenuOn];
}

-(void)turnSoundOff{
    
    GameData *data = [GameData sharedData];
    data.backgroundMusicMuted = YES;
    [[SimpleAudioEngine sharedEngine]pauseBackgroundMusic];
    [self createSoundMenuOff];
    
}


#pragma mark 设置菜单的位置

-(void)setMenuLocation{
  
  [self getScreenSize];
  

  
  aboutMenuLocation = ccp(screenSize.width*0.15,screenSize.height*0.25);
   
    moreMenuLocation =ccp(screenSize.width*0.65,screenSize.height*0.25);
    
    settingMenuLocation = ccp(screenSize.width*0.65,screenSize.height*0.25);
    
    startChallengeMenuLocation = ccp(screenSize.width*0.4,screenSize.height*0.25);
    
    endlessModeMenuLocation = ccp(screenSize.width*0.5,screenSize.height*0.8);
  
  titleLocation = ccp(screenSize.width*0.5,screenSize.height*0.7);
    titleLabelLocation = ccp(screenSize.width*0.55,screenSize.height*0.5);
  bgLocation = ccp(screenSize.width*0.5,screenSize.height*0.5);
    
    soundMenuLocation = ccp(screenSize.width*0.2,screenSize.height *0.5);
  
  
}






#pragma mark-场景初始化


-(id)init{
  
  if((self  =[super init])){
      
    //推送
    
//      [self addPushNotification];
      
    
    //设置各视觉元素在屏幕中的位置
    
    [self setMenuLocation];
    
    //添加游戏标题和背景
    
    [self addGameTitle];

      [self addBackground];
    //添加菜单选项
    

      
      [self addGameMenu];

    
    //播放背景音乐
    [self playBackgroundMusic];
      
      //添加音效设置开关
      
  [self createSoundSettingMenu];
    

    
  }
  return self;
}

#pragma mark -push
//push notification
-(void)addPushNotification{
    
    
    //@notification 新消息
    NSDictionary *dict = [MobClick getConfigParams];
    NSString *welcome = [dict objectForKey:WELCOME_UMENG];
    NSString *version = [dict objectForKey:VERSION_UMENG];
    
    NSString *version_now = [[NSUserDefaults standardUserDefaults] objectForKey:VERSION_LOCAL];
    
    if ( ![version_now isEqualToString:version] && [version length]>0) {
        [[NSUserDefaults standardUserDefaults] setObject:version forKey:VERSION_LOCAL];
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"notification", nil) message:welcome delegate:self cancelButtonTitle:NSLocalizedString(@"later", nil) otherButtonTitles:NSLocalizedString(@"goto see", nil), nil];
        
        alertView.tag = kTagAlertForNotification;
        
        [alertView show];
        [alertView release];
    }
    
}




//umeng
#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
  if (buttonIndex!=[alertView cancelButtonIndex]) {
    
    //@notification
    if (alertView.tag==kTagAlertForNotification){
      if (buttonIndex == 1) {
        NSString *link = [MobClick getConfigParams:LINK_UMENG];
        NSURL *url = [NSURL URLWithString:link];
        [[UIApplication sharedApplication] openURL:url];
      }
    }
    
  }
}





@end
