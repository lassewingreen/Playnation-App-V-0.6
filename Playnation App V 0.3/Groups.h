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

@property (nonatomic, retain) NSNumber * applicantCount;
@property (nonatomic, retain) NSString * createdTime;
@property (nonatomic, retain) NSString * displayName;
@property (nonatomic, retain) NSNumber * downloadableItems;
@property (nonatomic, retain) NSNumber * eventCount;
@property (nonatomic, retain) NSNumber * eventParticipantCount;
@property (nonatomic, retain) NSString * faction;
@property (nonatomic, retain) NSNumber * forumMemberCount;
@property (nonatomic, retain) NSString * gameName;
@property (nonatomic, retain) NSString * groupDesc;
@property (nonatomic, retain) NSString * groupName;
@property (nonatomic, retain) NSString * groupType1;
@property (nonatomic, retain) NSString * groupType2;
@property (nonatomic, retain) NSString * iD_CREATOR;
@property (nonatomic, retain) NSNumber * iD_GAME;
@property (nonatomic, retain) NSNumber * iD_GROUP;
@property (nonatomic, retain) NSNumber * iD_GROUPTYPE1;
@property (nonatomic, retain) NSNumber * iD_GROUPTYPE2;
@property (nonatomic, retain) NSNumber * iD_LANGUAGE;
@property (nonatomic, retain) NSString * imageURL;
@property (nonatomic, retain) NSNumber * inviteCount;
@property (nonatomic, retain) NSNumber * isLiked;
@property (nonatomic, retain) NSNumber * isMember;
@property (nonatomic, retain) NSNumber * likeCount;
@property (nonatomic, retain) NSNumber * mediaCount;
@property (nonatomic, retain) NSNumber * memberCount;
@property (nonatomic, retain) NSString * server;
@property (nonatomic, retain) NSNumber * shareCount;
@property (nonatomic, retain) NSString * tags;

@end
