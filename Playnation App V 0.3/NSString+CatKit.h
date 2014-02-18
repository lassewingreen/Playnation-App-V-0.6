//
//  NSString+CatKit.h
//  CatKit
//
//  Created by Andrew Smith on 10/19/11.
//  Copyright (c) 2011 Andrew B. Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CatKit)

- (NSString*)urlEncodedString;

/**
See http://github.com/pokeb/asi-http-request/raw/master/Classes/ASIFormDataRequest.m
 */
- (NSString *)urlEncodedStringWithEncoding:(NSStringEncoding)encoding;

/**
 Uses regex to check and see if string is an email address.
 http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
 */
- (BOOL)isEmailAddress;

/**
 Validates string as a bank routing number. Routing number spec is defined on the wiki below.
 http://en.wikipedia.org/wiki/Routing_transit_number#Check_digit
 */
- (BOOL)isBankRoutingTransitNumber;

/**
 Lowercase the first letter of the string
 */
- (NSString *)lowercaseFirstLetterOnlyString;

/**
 Capitalize the first letter of the string
 */
- (NSString *)uppercaseFirstLetterOnlyString;

@end
