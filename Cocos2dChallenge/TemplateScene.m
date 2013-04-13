//
//  TemplateScene.m
//  Cocos2dChallenge
//
//  Created by Ricky on 12/27/12.
//  Copyright 2012 happybubsy. All rights reserved.
//

#import "TemplateScene.h"


@implementation TemplateScene

+(CCScene*)scene{
    
    CCScene *scene = [CCScene node];
    TemplateScene *layer = [TemplateScene node];
    [scene addChild:layer];
    return scene;
    
}

-(id)init{
    
    if((self = [super init])){
        
    }
    return self;
    
}

@end
