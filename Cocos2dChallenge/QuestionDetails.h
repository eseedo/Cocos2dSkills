//
//  FailedBankDetails.h
//  FailedBanks
//
//  Created by Ray Wenderlich on 4/5/10.
//  Copyright 2010 Ray Wenderlich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionDetails : NSObject {
  int _uniqueId;
  int _type;
  NSString *_title;
  NSString *_correctAnswer;
  NSString *_possibleAnswer2;
  NSString *_possibleAnswer3;
}

@property (nonatomic, assign) int uniqueId;
@property (nonatomic, assign) int type;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *correctAnswer;
@property (nonatomic, retain) NSString *possibleAnswer2;
@property (nonatomic, retain) NSString *possibleAnswer3;


-(id)initWithUniqueId:(int)uniqueId type:(int)type title:(NSString*)title correctAnswer:(NSString*)correctAnswer possibleAnswer2:(NSString*)possibleAnswer2 possibleAnswer3:(NSString*)possibleAnswer3;


@end
