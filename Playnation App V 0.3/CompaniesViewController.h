//
//  CompaniesViewController.h
//  JSONtestApp
//
//  Created by Remus Cicu on 17/01/14.
//  Copyright (c) 2014 Agro52 Aps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CompaniesViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UITableView *CompaniesTableView;
@property (strong,nonatomic) NSArray *companiesJsonWrapper;
@property (strong,nonatomic) NSArray *companiesTableArray;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@end
