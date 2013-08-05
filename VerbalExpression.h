//
//  VerbalExpression.h
//  Notable
//
//  Created by David Keegan on 8/5/13.
//  Copyright (c) 2013 David Keegan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VerbalExpression : NSObject

@property (readonly) NSString *pattern;

+ (NSString *)number;
+ (NSString *)notNumber;
+ (NSString *)whiteSpace;
+ (NSString *)nonWhiteSpace;
+ (NSString *)word;
+ (NSString *)nonWord;

+ (instancetype)expression;

- (void)find:(NSString *)string;

- (void)startOfLine;
- (void)endOfLine;

- (void)then:(NSString *)string;
- (void)maybe:(NSString *)string;

- (void)anything;
- (void)anythingBut:(NSString *)string;
- (void)something;
- (void)somethingBut:(NSString *)string;

- (void)anyOf:(NSString *)string, ... NS_REQUIRES_NIL_TERMINATION;

- (void)lineBreak;
- (void)tab;
- (void)word;
- (void)whiteSpace;

@end
