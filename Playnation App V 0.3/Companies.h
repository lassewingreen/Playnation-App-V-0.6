//
//  Companies.h
//  Playnation App V 0.3
//
//  Created by Lasse Wingreen on 18/02/14.
//  Copyright (c) 2014 Remus Cicu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Companies : NSManagedObject

@property (nonatomic, retain) NSString * companyAddress;
@property (nonatomic, retain) NSString * companyDesc;
@property (nonatomic, retain) NSString * companyName;
@property (nonatomic, retain) NSString * companyType;
@property (nonatomic, retain) NSDate * createdTime;
@property (nonatomic, retain) NSNumber * currentPop;
@property (nonatomic, retain) NSNumber * currentTop;
@property (nonatomic, retain) NSNumber * downloadableItems;
@property (nonatomic, retain) NSString * employees;
@property (nonatomic, retain) NSString * eventCount;
@property (nonatomic, retain) NSNumber * eventParticipantCount;
@property (nonatomic, retain) NSNumber * fanCount;
@property (nonatomic, retain) NSNumber * forumMemberCount;
@property (nonatomic, retain) NSString * founded;
@property (nonatomic, retain) NSNumber * gameCount;
@property (nonatomic, retain) NSNumber * historyPop;
@property (nonatomic, retain) NSNumber * historyTop;
@property (nonatomic, retain) NSNumber * iD_COMPANY;
@property (nonatomic, retain) NSNumber * iD_COMPANYTYPE;
@property (nonatomic, retain) NSString * imageURL;
@property (nonatomic, retain) NSNumber * isLiked;
@property (nonatomic, retain) NSNumber * likeCount;
@property (nonatomic, retain) NSNumber * mediaCount;
@property (nonatomic, retain) NSNumber * newsCount;
@property (nonatomic, retain) NSNumber * newsCurrentPop;
@property (nonatomic, retain) NSNumber * newsCurrentTop;
@property (nonatomic, retain) NSNumber * newsHistoryPop;
@property (nonatomic, retain) NSNumber * newsHistoryTop;
@property (nonatomic, retain) NSNumber * newsSortPop;
@property (nonatomic, retain) NSNumber * newsSortTop;
@property (nonatomic, retain) NSString * ownership;
@property (nonatomic, retain) NSNumber * shareCount;
@property (nonatomic, retain) NSNumber * socialRating;
@property (nonatomic, retain) NSNumber * sortPop;
@property (nonatomic, retain) NSNumber * sortTop;
@property (nonatomic, retain) NSString * tags;
@property (nonatomic, retain) NSString * uRL;

@end
