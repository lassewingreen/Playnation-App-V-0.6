//
//  DetailedCompaniesViewController.m
//  Playnation App V 0.3
//
//  Created by Remus Cicu on 14/02/14.
//  Copyright (c) 2014 Remus Cicu. All rights reserved.
//

#import "DetailedCompaniesViewController.h"
#import "CompaniesViewController.h"
#import "UITabBarController+ShowHideBar.h"

@interface DetailedCompaniesViewController ()

@end

@implementation DetailedCompaniesViewController

@synthesize companyWebsite, companyNoOfEmployees, companyJoined, companiesProfilePic,companyDescription,companyFounded, companyHeadquarter , companyType,companyName,companiesProfilePicImage, companyDescriptionText, companyFoundedLabel, companyHeadquarterLabel, companyJoinedLabel, companyNameLabel, companyNoOfEmployeesLabel, companyTypeLabel, companyWebsiteLabel,segControl;

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
    

    
    //converting the timestamp to date
    NSTimeInterval _interval=[companyJoined doubleValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:_interval];
    NSDateFormatter *_formatter=[[NSDateFormatter alloc]init];
    [_formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *actualdate=[_formatter stringFromDate:date];
    

    
    //Custom TableView Background
    self.parentViewController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"common_bg"]];
    self.tableView.backgroundColor = [UIColor clearColor];
    UIEdgeInsets inset =UIEdgeInsetsMake(1, 0, 0, 0);
    self.tableView.contentInset = inset;
    
     //seratator off
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    companyNameLabel.text = companyName;
    companyTypeLabel.text = companyType;
    companyHeadquarterLabel.text = companyHeadquarter;
    companyNoOfEmployeesLabel.text = [NSString stringWithFormat:@"%@ Employees",companyNoOfEmployees];
    companyFoundedLabel.text = [NSString stringWithFormat:@"Founded: %@", companyFounded];
    companyWebsiteLabel.text = companyWebsite;
    companyJoinedLabel.text = [NSString stringWithFormat:@"Joined: %@", actualdate];
    companyDescriptionText.text = companyDescription;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)hidesBottomBarWhenPushed{
    return YES;
}


- (IBAction)segValue:(id)sender {
    if (segControl.selectedSegmentIndex == 0) {
        self.newsScreen.hidden = YES;
        self.wallScreen.hidden = YES;
        self.infoScreen.hidden = NO;
    }
    else if (segControl.selectedSegmentIndex == 1){
        self.newsScreen.hidden = NO;
        self.wallScreen.hidden = YES;
        self.infoScreen.hidden = YES;
    }
    
    else if (segControl.selectedSegmentIndex == 2){
        self.newsScreen.hidden = YES;
        self.wallScreen.hidden = NO;
        self.infoScreen.hidden = YES;
    }

}
@end
