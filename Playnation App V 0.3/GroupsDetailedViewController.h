//
//  GroupsDetailedViewController.h
//  JSONtestApp
//
//  Created by Remus Cicu on 20/01/14.
//  Copyright (c) 2014 Agro52 Aps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroupsDetailedViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *groupNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *groupTypeLabel;
@property (strong, nonatomic) IBOutlet UILabel *createdByLabel;
@property (strong, nonatomic) IBOutlet UILabel *membersLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateCreatedLabel;
@property (strong, nonatomic) IBOutlet UITextView *groupDescriptionLabel;


@property (weak,nonatomic) NSString *groupName;
@property (weak,nonatomic) NSString *groupType;
@property (weak,nonatomic) NSString *groupCreatedBy;
@property (weak,nonatomic) NSString *groupMembers;
@property (weak,nonatomic) NSString *dateCreated;
@property (weak,nonatomic) NSString *groupDesciption;

@end
