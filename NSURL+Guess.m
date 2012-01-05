//
//  NSURL+Guess.m
//
//  Created by Jorge Bernal on 7/12/11.
//  Copyright 2011 Jorge Bernal. All rights reserved.
//

#import "NSURL+Guess.h"

@implementation NSURL (NSURL_Guess)
+ (id)guessURLWithString:(NSString *)URLString {
    NSError *error = nil;
    NSRegularExpression *okExpression = [NSRegularExpression regularExpressionWithPattern:@"^https?://" options:NSRegularExpressionCaseInsensitive error:&error];
    if (error) {
        NSLog(@"Invalid regular expression: %@", [error localizedDescription]);
        return nil;
    }
    
    NSRegularExpression *wrongExpression = [NSRegularExpression regularExpressionWithPattern:@"^(h[htp]{1,3}s?[:/]/*)" options:NSRegularExpressionCaseInsensitive error:&error];
    if (error) {
        NSLog(@"Invalid regular expression: %@", [error localizedDescription]);
        return nil;
    }
    
    NSString *fixedURLString;
    if ([okExpression numberOfMatchesInString:URLString options:0 range:NSMakeRange(0, [URLString length])]) {
        fixedURLString = URLString;
    } else if ([wrongExpression numberOfMatchesInString:URLString options:0 range:NSMakeRange(0, [URLString length])]) {
        fixedURLString = [wrongExpression stringByReplacingMatchesInString:URLString options:0 range:NSMakeRange(0, [URLString length]) withTemplate:@"http://"];
    } else {
        fixedURLString = [NSString stringWithFormat:@"http://%@", URLString];
    }
    
    return [NSURL URLWithString:fixedURLString];
}
@end
