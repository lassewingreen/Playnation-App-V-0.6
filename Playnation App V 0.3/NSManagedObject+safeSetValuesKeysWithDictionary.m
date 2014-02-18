//
//  NSManagedObject+safeSetValuesKeysWithDictionary.m
//  AFN-Magical-Record-Example
//
//  Created by Lasse Wingreen on 13/02/14.
//  Copyright (c) 2014 Cocoa Star Apps. All rights reserved.
//

#import "NSManagedObject+safeSetValuesKeysWithDictionary.h"

@implementation NSManagedObject (safeSetValuesForKeysWithDictionary)

- (void)safeSetManagedValuesForKeysWithDictionary:(NSDictionary *)keyedValues dateFormatter:(NSDateFormatter *)dateFormatter
{
    NSDictionary *attributes = [[self entity] attributesByName];
    for (NSString *attribute in attributes) {
        id value = [keyedValues objectForKey:attribute];
        if (value == nil) {
            continue;
        }
        NSAttributeType attributeType = [[attributes objectForKey:attribute] attributeType];
        
        if ((attributeType == NSStringAttributeType) && ([value isKindOfClass:[NSNumber class]])) {
            value = [value stringValue];
        } else if (((attributeType == NSInteger16AttributeType) || (attributeType == NSInteger32AttributeType) || (attributeType == NSInteger64AttributeType) || (attributeType == NSBooleanAttributeType)) && ([value isKindOfClass:[NSString class]])) {
            value = [NSNumber numberWithInteger:[value integerValue]];
        } else if ((attributeType == NSFloatAttributeType) &&  ([value isKindOfClass:[NSString class]])) {
            value = [NSNumber numberWithDouble:[value doubleValue]];
        } else if ((attributeType == NSDateAttributeType) && ([value isKindOfClass:[NSString class]]) && (dateFormatter != nil)) {
            value = [dateFormatter dateFromString:value];
        }
        //We don't handle nested object yet
        else if ((attributeType == NSStringAttributeType) && ([value isKindOfClass:[NSDictionary class]])) {
            value = nil;
        }
        //Convert NSNull to nil
        else if ([value isKindOfClass:[NSNull class]]) {
            value = nil;
        }
        
        [self setValue:value forKey:attribute];
    }
}
@end