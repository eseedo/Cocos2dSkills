//
//  ChallengeFinalResult.h
//  Cocos2dChallenge
//
//  Created by Ricky on 12/27/12.
//  Copyright 2012 happybubsy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface ChallengeFinalResult : CCLayer {
    
    
    //背景精灵图片
    CCSprite *sceneBg;
    CCSprite *resultBg;
    
    //文本标签
    CCLabelTTF *textLabel;
    
    //屏幕大小
    CGSize screenSize;
    
}
+(CCScene*)scene;
@end
