//
//  DetailedGroupViewController.m
//  Playnation App V 0.3
//
//  Created by Remus Cicu on 13/02/14.
//  Copyright (c) 2014 Remus Cicu. All rights reserved.
//

#import "DetailedGroupViewController.h"
#import "UITabBarController+ShowHideBar.h"

@interface DetailedGroupViewController ()

@end

@implementation DetailedGroupViewController

@synthesize groupCreatedBy, groupDescription, groupMembers, groupName, groupType, dateCreated,segValue;
@synthesize groupDescriptionText, groupNameLabel, groupTypeLabel, dateCreatedLabel, groupCreatedByLabel, groupMembersLabel;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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
    groupCreatedByLabel.text = groupCreatedBy;
    groupMembersLabel.text = [NSString stringWithFormat:@"%@ Members", groupMembers];
    groupDescriptionText.text = groupDescription;
    dateCreatedLabel.text = dateCreated;
    
    
    //Custom TableView Background
    self.parentViewController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"common_bg"]];
    self.tableView.backgroundColor = [UIColor clearColor];
    UIEdgeInsets inset =UIEdgeInsetsMake(1, 0, 0, 0);
    self.tableView.contentInset = inset;
    //seratator off
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)hidesBottomBarWhenPushed{
    return YES;
}




//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 2;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return section == 0 ? 1 : 5;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSString *identifier = indexPath.section == 0 ? @"header" : @"content";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//    // customize cell
//    return cell;
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    if(section == 1) {
//        UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Foo", @"Bar"]];
//        segmentedControl.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.95];
//        return segmentedControl;
//    }
//    return nil;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return section == 0 ? 0 : 44;
//}

- (IBAction)segControl:(id)sender {
    if (segValue.selectedSegmentIndex == 0) {
        self.newsScreen.hidden = YES;
        self.wallScreen.hidden = NO;
        self.eventsScreen.hidden = YES;
    }
    else if (segValue.selectedSegmentIndex == 1){
        self.newsScreen.hidden = NO;
        self.wallScreen.hidden = YES;
        self.eventsScreen.hidden = YES;
    }
    
    else if (segValue.selectedSegmentIndex == 2){
        self.newsScreen.hidden = YES;
        self.wallScreen.hidden = YES;
        self.eventsScreen.hidden = NO;
    }
}
@end
