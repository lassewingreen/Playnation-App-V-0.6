//
//  News.h
//  Playnation App V 0.3
//
//  Created by Lasse Wingreen on 18/02/14.
//  Copyright (c) 2014 Remus Cicu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface News : NSManagedObject

@property (nonatomic, retain) NSNumber * dislikeCount;
@property (nonatomic, retain) NSString * editorNote;
@property (nonatomic, retain) NSNumber * featured;
@property (nonatomic, retain) NSString * headline;
@property (nonatomic, retain) NSNumber * iD_AREA;
@property (nonatomic, retain) NSNumber * iD_AUTHOR;
@property (nonatomic, retain) NSNumber * iD_COUNTRY;
@property (nonatomic, retain) NSNumber * iD_EVENT;
@property (nonatomic, retain) NSNumber * iD_LANGUAGE;
@property (nonatomic, retain) NSNumber * iD_NEWS;
@property (nonatomic, retain) NSNumber * iD_OWNER;
@property (nonatomic, retain) NSNumber * iD_PLAYER;
@property (nonatomic, retain) NSString * image;
@property (nonatomic, retain) NSString * introText;
@property (nonatomic, retain) NSNumber * iS_PLATFORM;
@property (nonatomic, retain) NSNumber * isBlog;
@property (nonatomic, retain) NSNumber * isInternal;
@property (nonatomic, retain) NSNumber * isPopular;
@property (nonatomic, retain) NSNumber * isReview;
@property (nonatomic, retain) NSDate * lastActivityTime;
@property (nonatomic, retain) NSNumber * lastReplyNum;
@property (nonatomic, retain) NSDate * lastUpdatedTime;
@property (nonatomic, retain) NSNumber * likeCount;
@property (nonatomic, retain) NSString * newsText;
@property (nonatomic, retain) NSString * ownerType;
@property (nonatomic, retain) NSDate * postingTime;
@property (nonatomic, retain) NSNumber * published;
@property (nonatomic, retain) NSNumber * ratingCur;
@property (nonatomic, retain) NSNumber * ratingPop;
@property (nonatomic, retain) NSNumber * ratingTop;
@property (nonatomic, retain) NSNumber * replies;
@property (nonatomic, retain) NSNumber * shareCount;
@property (nonatomic, retain) NSNumber * showCount;
@property (nonatomic, retain) NSNumber * socialRating;
@property (nonatomic, retain) NSString * uRL;

@end
