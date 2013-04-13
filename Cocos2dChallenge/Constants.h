//
//  Constants.h
//  LifeDefense
//
//  Created by Ricky on 11/22/12.
//  Copyright (c) 2012 ihappylife. All rights reserved.
//

#ifndef LifeDefense_Constants_h
#define LifeDefense_Constants_h




//通关最多可以错的题目数量
#define MaximumNumberOfWrongAnswer 2

#pragma mark 其它应用
#define kAppSoundToys 100



#pragma mark 关于字体的设置

#define kFontScaleHuge 6;
#define kFontScaleLarge 9;
#define kFontScaleMedium 10;
#define kFontScaleSmall 12;
#define kFontScaleTiny 14;

#pragma mark leveltype

//level type
#define kTagLevelNewbie 100
#define kTagLevelCoder 101
#define kTagLevelHacker 102
#define kTagLevelMaster 103
#define kTagLevelMonster 104

//每个关卡的问题数量


#define Level1QuestionNumber 8
#define Level2QuestionNumber 15
#define Level3QuestionNumber 25
#define Level4QuestionNumber 40
#define Level5QuestionNumber 60

//每个关卡的倒计时时间

#define CountDownTimeForEachQuestion 15

//数据库中的问题数量

#define TotalNumberOfQuestionInDatabase 200

//UMENG

#define   WELCOME_UMENG     @"welcome_umeng"
#define   VERSION_UMENG     @"version_umeng"
#define   LINK_UMENG        @"link_umeng"
#define   VERSION_LOCAL     @"version_local"




//@award 加上日期信息，构成每天是否签到的记录tag,存储在NSUserDefault中,如"SignIn_2012-10-10"
#define   SIGN_IN_TAG              @"SignIn"


#endif
