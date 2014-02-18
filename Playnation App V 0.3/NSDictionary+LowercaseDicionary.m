//
//  NSDictionary+LowercaseDicionary.m
//  PlaynationCoreData
//
//  Created by Lasse Wingreen on 31/01/14.
//  Copyright (c) 2014 Playnation. All rights reserved.
//

#import "NSDictionary+LowercaseDicionary.h"

//#import "TransformerKit.h"
//#import "TTTStringTransformers.h"

#import "NSString+CatKit.h"



@implementation NSDictionary (LowercaseDicionary)



-(NSDictionary *) dictionaryWithLowercaseKeys {
    NSMutableDictionary         *result = [NSMutableDictionary dictionaryWithCapacity:0];
    NSString                    *key;
    
//NSString * const TTTLlamaCaseStringTransformerName = @"TTTLlamaCaseStringTransformer";
    
    
     for ( key in self ) {
    
         [result setObject:[self objectForKey:key] forKey:[key lowercaseFirstLetterOnlyString]];
         
         //NSLog(@"KEY %@", key);
     }
    return result;
}

    
    
    
    
@end
