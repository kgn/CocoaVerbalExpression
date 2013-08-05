Cocoa port of [VerbalExpressions](). Still very much in development, contributions welcome!

``` obj-c
VerbalExpression *verbalExpression = [VerbalExpression expression];
[verbalExpression whiteSpace];
[verbalExpression then:CNPreferencesNoteTagCharacter];
[verbalExpression somethingBut:[VerbalExpression number]];
[verbalExpression anyOf:[VerbalExpression word], [VerbalExpression number], @"-", @"_", nil];

NSError *error = nil;    
NSRegularExpression *regex =
[NSRegularExpression regularExpressionWithPattern:verbalExpression.pattern options:NSRegularExpressionCaseInsensitive error:&error];
NSArray *matches = [regex matchesInString:text options:0 range:NSMakeRange(0, text.length)];
for(NSTextCheckingResult *match in matches){
    ...
}
```