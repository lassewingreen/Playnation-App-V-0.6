//
//  Games.h
//  Playnation App V 0.3
//
//  Created by Lasse Wingreen on 18/02/14.
//  Copyright (c) 2014 Remus Cicu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Games : NSManagedObject

@property (nonatomic, retain) NSNumber * companyCount;
@property (nonatomic, retain) NSDate * createdTime;
@property (nonatomic, retain) NSString * creationDate;
@property (nonatomic, retain) NSNumber * currentPop;
@property (nonatomic, retain) NSNumber * currentTop;
@property (nonatomic, retain) NSNumber * downloadableItems;
@property (nonatomic, retain) NSNumber * eSportPlayersCount;
@property (nonatomic, retain) NSString * eSRB;
@property (nonatomic, retain) NSNumber * eventCount;
@property (nonatomic, retain) NSNumber * eventParticipantCount;
@property (nonatomic, retain) NSNumber * expansionCount;
@property (nonatomic, retain) NSNumber * fanCount;
@property (nonatomic, retain) NSNumber * forumMemberCount;
@property (nonatomic, retain) NSString * freePlayLink;
@property (nonatomic, retain) NSNumber * gameDesc;
@property (nonatomic, retain) NSString * gameName;
@property (nonatomic, retain) NSString * gameType;
@property (nonatomic, retain) NSNumber * groupCount;
@property (nonatomic, retain) NSNumber * historyPop;
@property (nonatomic, retain) NSNumber * historyTop;
@property (nonatomic, retain) NSNumber * iD_GAME;
@property (nonatomic, retain) NSNumber * iD_GAMETYPE;
@property (nonatomic, retain) NSNumber * iD_PRODUCT;
@property (nonatomic, retain) NSString * imageURL;
@property (nonatomic, retain) NSNumber * isBuyable;
@property (nonatomic, retain) NSNumber * isESportGame;
@property (nonatomic, retain) NSNumber * isFreePlay;
@property (nonatomic, retain) NSNumber * likeCount;
@property (nonatomic, retain) NSNumber * mediaCount;
@property (nonatomic, retain) NSNumber * newsCount;
@property (nonatomic, retain) NSNumber * newsCurrentPop;
@property (nonatomic, retain) NSNumber * newsCurrentTop;
@property (nonatomic, retain) NSNumber * newsHistoryPop;
@property (nonatomic, retain) NSNumber * newsHistoryTop;
@property (nonatomic, retain) NSNumber * newsSortPop;
@property (nonatomic, retain) NSNumber * newsSortTop;
@property (nonatomic, retain) NSNumber * playersCount;
@property (nonatomic, retain) NSNumber * shareCount;
@property (nonatomic, retain) NSNumber * socialRating;
@property (nonatomic, retain) NSNumber * sortPop;
@property (nonatomic, retain) NSNumber * sortTop;
@property (nonatomic, retain) NSString * tags;
@property (nonatomic, retain) NSNumber * uRL;

@end
