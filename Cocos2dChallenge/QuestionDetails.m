//
//  FailedBankDetails.m
//  FailedBanks
//
//  Created by Ray Wenderlich on 4/5/10.
//  Copyright 2010 Ray Wenderlich. All rights reserved.
//

#import "QuestionDetails.h"

@implementation QuestionDetails
@synthesize uniqueId = _uniqueId;
@synthesize type = _type;
@synthesize title = _title;
@synthesize correctAnswer = _correctAnswer;
@synthesize possibleAnswer2 = _possibleAnswer2;
@synthesize possibleAnswer3 = _possibleAnswer3;

-(id)initWithUniqueId:(int)uniqueId type:(int)type title:(NSString *)title correctAnswer:(NSString *)correctAnswer possibleAnswer2:(NSString *)possibleAnswer2 possibleAnswer3:(NSString *)possibleAnswer3{
  
  if ((self = [super init])) {
    self.uniqueId = uniqueId;
    self.type = type;
    self.title = title;
    self.correctAnswer = correctAnswer;
    self.possibleAnswer2 = possibleAnswer2;
    self.possibleAnswer3 = possibleAnswer3;
  }
  return self;
  
}


- (void) dealloc
{
  self.title = nil;
  self.correctAnswer = nil;
  self.possibleAnswer3 = nil;
  self.possibleAnswer2 = nil;
  
  [super dealloc];
}

@end
