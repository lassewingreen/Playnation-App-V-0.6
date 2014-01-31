//
//  NSString+StripHTMLwithRegEX.m
//  JSONtestApp
//
//  Created by Lasse Wingreen on 16/01/14.
//  Copyright (c) 2014 Agro52 Aps. All rights reserved.
//

#import "NSString+StripHTMLwithRegEX.h"

@implementation NSString (stripHTMLwithRegEX)

-(NSString *) stripHTMLwithRegEX {

    NSString *s = [self copy];
    
    NSRange start = [s rangeOfString:@"["];
    NSRange end = [s rangeOfString:@"]"];
    if (start.location != NSNotFound && end.location != NSNotFound && end.location > start.location) {
       s = [s substringWithRange:NSMakeRange(start.location, end.location+1)];
    }

    return s;
}


@end


//    NSRange r;
//    while ((r = [s rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
//        s = [s stringByReplacingCharactersInRange:r withString:@""];
