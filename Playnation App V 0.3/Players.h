//
//  Players.h
//  Playnation App V 0.3
//
//  Created by Lasse Wingreen on 18/02/14.
//  Copyright (c) 2014 Remus Cicu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Players : NSManagedObject

@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSString * avatar;
@property (nonatomic, retain) NSNumber * canCreateReferrers;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSNumber * companyCount;
@property (nonatomic, retain) NSNumber * companyForumCount;
@property (nonatomic, retain) NSString * country;
@property (nonatomic, retain) NSNumber * credits;
@property (nonatomic, retain) NSDate * dateOfBirth;
@property (nonatomic, retain) NSString * displayName;
@property (nonatomic, retain) NSNumber * dSTOffset;
@property (nonatomic, retain) NSString * eMail;
@property (nonatomic, retain) NSNumber * eSportCount;
@property (nonatomic, retain) NSNumber * eSportNotificationCount;
@property (nonatomic, retain) NSNumber * eventCount;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSNumber * freeGameLimit;
@property (nonatomic, retain) NSNumber * friendCount;
@property (nonatomic, retain) NSNumber * friendRequestsReceived;
@property (nonatomic, retain) NSNumber * friendRequestsSent;
@property (nonatomic, retain) NSNumber * gameCount;
@property (nonatomic, retain) NSNumber * gameForumCount;
@property (nonatomic, retain) NSNumber * gamePlayedCount;
@property (nonatomic, retain) NSString * gender;
@property (nonatomic, retain) NSNumber * groupCount;
@property (nonatomic, retain) NSNumber * groupForumCount;
@property (nonatomic, retain) NSNumber * groupLimit;
@property (nonatomic, retain) NSNumber * groupsOwnedCount;
@property (nonatomic, retain) NSNumber * hasBlog;
@property (nonatomic, retain) NSNumber * iD_LANGUAGE;
@property (nonatomic, retain) NSNumber * iD_LASTVISITOR;
@property (nonatomic, retain) NSNumber * iD_PLAYER;
@property (nonatomic, retain) NSNumber * iD_TEAM;
@property (nonatomic, retain) NSNumber * iD_TIMEZONE;
@property (nonatomic, retain) NSNumber * iD_USERGROUP;
@property (nonatomic, retain) NSNumber * imageLimit;
@property (nonatomic, retain) NSNumber * introSteps;
@property (nonatomic, retain) NSNumber * isDeveloper;
@property (nonatomic, retain) NSNumber * isOnline;
@property (nonatomic, retain) NSNumber * isReferrer;
@property (nonatomic, retain) NSNumber * isSuperUser;
@property (nonatomic, retain) NSNumber * isSupporter;
@property (nonatomic, retain) NSNumber * isTester;
@property (nonatomic, retain) NSDate * lastActivity;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSNumber * messageCount;
@property (nonatomic, retain) NSNumber * messageSentCount;
@property (nonatomic, retain) NSNumber * newAchievementCount;
@property (nonatomic, retain) NSNumber * newESportNotificationCount;
@property (nonatomic, retain) NSNumber * newEventCount;
@property (nonatomic, retain) NSNumber * newMessageCount;
@property (nonatomic, retain) NSNumber * newNotificationCount;
@property (nonatomic, retain) NSString * nickName;
@property (nonatomic, retain) NSNumber * noAdsTime;
@property (nonatomic, retain) NSNumber * notificationCount;
@property (nonatomic, retain) NSNumber * otherLanguages;
@property (nonatomic, retain) NSString * passRequest;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * phone;
@property (nonatomic, retain) NSNumber * playCredits;
@property (nonatomic, retain) NSString * playerHash;
@property (nonatomic, retain) NSNumber * playerIsDeleted;
@property (nonatomic, retain) NSNumber * postCount;
@property (nonatomic, retain) NSNumber * registrationTime;
@property (nonatomic, retain) NSNumber * socialRating;
@property (nonatomic, retain) NSNumber * subscribedBoardTopicCount;
@property (nonatomic, retain) NSNumber * subscribedByCount;
@property (nonatomic, retain) NSNumber * subscribedNewsCount;
@property (nonatomic, retain) NSNumber * subscribedToCount;
@property (nonatomic, retain) NSNumber * timeOffset;
@property (nonatomic, retain) NSNumber * twitterID;
@property (nonatomic, retain) NSString * uRL;
@property (nonatomic, retain) NSString * verificationCode;
@property (nonatomic, retain) NSNumber * wallitemInterval;
@property (nonatomic, retain) NSNumber * wallLinkCount;
@property (nonatomic, retain) NSNumber * wallPhotoCount;
@property (nonatomic, retain) NSNumber * wallPostCount;
@property (nonatomic, retain) NSNumber * wallVideoCount;
@property (nonatomic, retain) NSString * zip;

@end
