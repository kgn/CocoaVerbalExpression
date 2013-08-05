//
//  VerbalExpression.m
//  Notable
//
//  Created by David Keegan on 8/5/13.
//  Copyright (c) 2013 David Keegan. All rights reserved.
//

#import "VerbalExpression.h"

@interface VerbalExpression()
@property (nonatomic, strong) NSMutableString *mutablePattern;
@end

@implementation VerbalExpression

+ (NSString *)number{
    return @"\\d";
}

+ (NSString *)notNumber{
    return @"\\D";
}

+ (NSString *)whiteSpace{
    return @"\\s";
}

+ (NSString *)nonWhiteSpace{
    return @"\\S";
}

+ (NSString *)word{
    return @"\\w";
}

+ (NSString *)nonWord{
    return @"\\W";
}

+ (instancetype)expression{
    VerbalExpression *verbalExpression = [[[self class] alloc] init];
    verbalExpression.mutablePattern = [NSMutableString string];
    return verbalExpression;
}

- (void)find:(NSString *)string{
    [self then:string];
}

- (void)startOfLine{
    [self.mutablePattern appendString:@"^"];
}

- (void)endOfLine{
    [self.mutablePattern appendString:@"$"];
}

- (void)then:(NSString *)string{
    [self.mutablePattern appendFormat:@"(%@)", string];
}

- (void)maybe:(NSString *)string{
    [self.mutablePattern appendFormat:@"(%@)?", string];    
}

- (void)anything{
    [self.mutablePattern appendString:@"(.*)"];
}

- (void)anythingBut:(NSString *)string{
    [self.mutablePattern appendFormat:@"([^%@]*)", string];
}

- (void)something{
    [self.mutablePattern appendString:@"(.+)"];
}

- (void)somethingBut:(NSString *)string{
    [self.mutablePattern appendFormat:@"([^%@]+)", string];
}

- (void)anyOf:(NSString *)string, ... NS_REQUIRES_NIL_TERMINATION{
    [self.mutablePattern appendFormat:@"[%@", string];

    va_list args;
    va_start(args, string);

    id arg = nil;
    while((arg = va_arg(args,id))){
        [self.mutablePattern appendFormat:@"%@", arg];
    }
    
    va_end(args);

    [self.mutablePattern appendString:@"]"];
}

- (void)lineBreak{
    [self.mutablePattern appendString:@"((\\n)|(\\r\\n))"];
}

- (void)tab{
    [self.mutablePattern appendString:@"(\\t)"];
}

- (void)word{
    [self.mutablePattern appendFormat:@"(%@+)", [[self class] word]];
}

- (void)whiteSpace{
    [self.mutablePattern appendFormat:@"(%@+)", [[self class] whiteSpace]];
}

- (NSString *)pattern{
    return [NSString stringWithString:self.mutablePattern];
}

@end
