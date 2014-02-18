//
//  NSString+CatKit.m
//  CatKit
//
//  Created by Andrew Smith on 10/19/11.
//  Copyright (c) 2011 Andrew B. Smith. All rights reserved.
//

#import "NSString+CatKit.h"

@implementation NSString (CatKit)

- (NSString *)urlEncodedString
{
	return [self urlEncodedStringWithEncoding:NSUTF8StringEncoding];
}

- (NSString *)urlEncodedStringWithEncoding:(NSStringEncoding)encoding
{
	NSString *urlEncodedString = (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (__bridge CFStringRef)self, NULL, (CFStringRef)@":/?#[]@!$ &'()*+,;=\"<>%{}|\\^~`", CFStringConvertNSStringEncodingToEncoding(encoding));	
    return urlEncodedString ? urlEncodedString : @"";
}

- (BOOL)isEmailAddress
{
    BOOL strict = YES;
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSString *laxString            = @".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex           = strict ? stricterFilterString : laxString;
    NSPredicate *emailTest         = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (BOOL)isBankRoutingTransitNumber
{
    if (self.length != 9) return NO;
    
    NSUInteger d1 = [[self substringWithRange:NSMakeRange(0, 1)] integerValue];
    NSUInteger d2 = [[self substringWithRange:NSMakeRange(1, 1)] integerValue];
    NSUInteger d3 = [[self substringWithRange:NSMakeRange(2, 1)] integerValue];
    NSUInteger d4 = [[self substringWithRange:NSMakeRange(3, 1)] integerValue];
    NSUInteger d5 = [[self substringWithRange:NSMakeRange(4, 1)] integerValue];
    NSUInteger d6 = [[self substringWithRange:NSMakeRange(5, 1)] integerValue];
    NSUInteger d7 = [[self substringWithRange:NSMakeRange(6, 1)] integerValue];
    NSUInteger d8 = [[self substringWithRange:NSMakeRange(7, 1)] integerValue];
    NSUInteger d9 = [[self substringWithRange:NSMakeRange(8, 1)] integerValue];

    NSUInteger checksum = (3 * (d1 + d4 + d7) + 7 * (d2 + d5 + d8) + (d3 + d6 + d9)) % 10;
    
    return (checksum == 0);
}

- (NSString *)lowercaseFirstLetterOnlyString
{
    NSString *firstCharacterInString = [[self substringToIndex:1] lowercaseString];
    return [self stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:firstCharacterInString];
}

- (NSString *)uppercaseFirstLetterOnlyString
{
    NSString *firstCharacterInString = [[self substringToIndex:1] uppercaseString];
    return [self stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:firstCharacterInString];
}

@end
