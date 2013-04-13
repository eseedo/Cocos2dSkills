//
//  FailedBankDatabase.h
//  FailedBanks
//
//  Created by Ray Wenderlich on 4/5/10.
//  Copyright 2010 Ray Wenderlich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@class QuestionDetails;

@interface QuestionDatabase : NSObject {
  sqlite3 *_database;
}

+ (QuestionDatabase*)database;
- (QuestionDetails *)questionDetails:(int)uniqueId;
- (NSMutableArray*)quizQuestionDetails;


@end
