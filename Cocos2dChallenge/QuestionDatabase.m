//
//  FailedBankDatabase.m
//  FailedBanks
//
//  Created by Ray Wenderlich on 4/5/10.
//  Copyright 2010 Ray Wenderlich. All rights reserved.
//

#import "QuestionDatabase.h"
#import "QuestionDetails.h"

@implementation QuestionDatabase

static QuestionDatabase *_database;

+ (QuestionDatabase*)database {
  if (_database == nil) {
    _database = [[QuestionDatabase alloc] init];
  }
  return _database;
}

- (id)init {
  if ((self = [super init])) {
    NSString *sqLiteDb = [[NSBundle mainBundle] pathForResource:@"challenge" ofType:@"sqlite3"];
    
    if (sqlite3_open([sqLiteDb UTF8String], &_database) != SQLITE_OK) {
      NSLog(@"Failed to open database!");
    }
  }
  return self;
}

- (void)dealloc {
  sqlite3_close(_database);
  [super dealloc];
}

- (NSMutableArray*)quizQuestionDetails{
    
    NSMutableArray *retval = [[[NSMutableArray alloc] init] autorelease];
    NSString *query = @"SELECT id, type, title, correctanswer, answer2,answer3 FROM questionlist ORDER BY id";
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int uniqueId = sqlite3_column_int(statement, 0);
            int type = sqlite3_column_int(statement, 1);
            char *titleChars = (char *) sqlite3_column_text(statement, 2);
            char *correctAnswerChars = (char *) sqlite3_column_text(statement, 3);
            char *answer2Chars = (char *) sqlite3_column_text(statement, 4);
            char *answer3Chars = (char *) sqlite3_column_text(statement, 5);
            
            
            NSString *title = [[NSString alloc] initWithUTF8String:titleChars];
            NSString *correctAnswer = [[NSString alloc] initWithUTF8String:correctAnswerChars];
            NSString *answer2 = [[NSString alloc] initWithUTF8String:answer2Chars];
            NSString *answer3 = [[NSString alloc] initWithUTF8String:answer3Chars];
            
            QuestionDetails *details = [[QuestionDetails alloc]initWithUniqueId:uniqueId type:type title:title correctAnswer:correctAnswer possibleAnswer2:answer2 possibleAnswer3:answer3];
            [retval addObject:details];
            
            [title release];
            [correctAnswer release];
            [answer2 release];
            [answer3 release];
            [details release];
        }
        sqlite3_finalize(statement);
    }
    return retval;

}

- (QuestionDetails *)questionDetails:(int)uniqueId {
  QuestionDetails *retval = nil;
  NSString *query = [NSString stringWithFormat:@"SELECT id, type, title, correctanswer, answer2,answer3 FROM questionlist WHERE id=%d", uniqueId];
  sqlite3_stmt *statement;
  if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil) == SQLITE_OK) {
    while (sqlite3_step(statement) == SQLITE_ROW) {
      
      int uniqueId = sqlite3_column_int(statement, 0);
      int type = sqlite3_column_int(statement, 1);
      char *titleChars = (char *) sqlite3_column_text(statement, 2);
      char *correctAnswerChars = (char *) sqlite3_column_text(statement, 3);
      char *answer2Chars = (char *) sqlite3_column_text(statement, 4);
      char *answer3Chars = (char *) sqlite3_column_text(statement, 5);
      
      
      NSString *title = [[NSString alloc] initWithUTF8String:titleChars];
      NSString *correctAnswer = [[NSString alloc] initWithUTF8String:correctAnswerChars];
      NSString *answer2 = [[NSString alloc] initWithUTF8String:answer2Chars];
      NSString *answer3 = [[NSString alloc] initWithUTF8String:answer3Chars];
      
      
      retval = [[[QuestionDetails alloc] initWithUniqueId:uniqueId type:type title:title  correctAnswer:correctAnswer possibleAnswer2:answer2 possibleAnswer3:answer3] autorelease];
      
      [title release];
      [correctAnswer release];
      [answer2 release];
      [answer3 release];
      
      break;
    }
    sqlite3_finalize(statement);
  }
  return retval;
}


@end