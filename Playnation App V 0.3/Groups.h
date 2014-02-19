//
//  Groups.h
//  Playnation App V 0.3
//
//  Created by Lasse Wingreen on 18/02/14.
//  Copyright (c) 2014 Remus Cicu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Groups : NSManagedObject

@property (nonatomic, retain) NSString * createdTime;
@property (nonatomic, retain) NSString * displayName;
@property (nonatomic, retain) NSString * groupDesc;
@property (nonatomic, retain) NSString * groupName;
@property (nonatomic, retain) NSString * groupType1;
@property (nonatomic, retain) NSString * groupType2;
@property (nonatomic, retain) NSString * iD_CREATOR;
@property (nonatomic, retain) NSString * iD_GROUP;
@property (nonatomic, retain) NSString * imageURL;
@property (nonatomic, retain) NSString * isLiked;
@property (nonatomic, retain) NSString * isMember;
@property (nonatomic, retain) NSString * memberCount;

@end
