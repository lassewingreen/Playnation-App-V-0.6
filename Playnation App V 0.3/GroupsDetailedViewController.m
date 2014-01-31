//
//  GroupsDetailedViewController.m
//  JSONtestApp
//
//  Created by Remus Cicu on 20/01/14.
//  Copyright (c) 2014 Agro52 Aps. All rights reserved.
//

#import "GroupsDetailedViewController.h"

@interface GroupsDetailedViewController ()

@end

@implementation GroupsDetailedViewController

@synthesize groupCreatedBy, groupDesciption, groupMembers, groupName, groupType, dateCreated;
@synthesize groupDescriptionLabel, groupNameLabel, groupTypeLabel, dateCreatedLabel, createdByLabel, membersLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    groupNameLabel.text = groupName;
    groupTypeLabel.text = groupType;
    createdByLabel.text = groupCreatedBy;
    membersLabel.text = groupMembers;
    dateCreatedLabel.text = dateCreated;
    groupDescriptionLabel.text = groupDesciption;
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Overriden UIViewController methods
//hide tab bar
-(BOOL)hidesBottomBarWhenPushed{
    return YES;
}
@end
