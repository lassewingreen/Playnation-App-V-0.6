//
//  NSManagedObject+safeSetValuesKeysWithDictionary.h
//  AFN-Magical-Record-Example
//
//  Created by Lasse Wingreen on 13/02/14.
//  Copyright (c) 2014 Cocoa Star Apps. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (safeSetValuesForKeysWithDictionary)

- (void)safeSetManagedValuesForKeysWithDictionary:(NSDictionary *)keyedValues dateFormatter:(NSDateFormatter *)dateFormatter;

@end