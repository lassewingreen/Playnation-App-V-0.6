//
//  GamesViewController.h
//  JSONtestApp
//
//  Created by Remus Cicu on 17/01/14.
//  Copyright (c) 2014 Agro52 Aps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GamesViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UITableView *GamesTableView;
@property (strong,nonatomic) NSArray *gamesJsonWrapper;
@property (strong,nonatomic) NSArray *gamesTableArray;
@property (weak, nonatomic)NSString *gameDescription;
@property (weak, nonatomic)NSString *gameName;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@end
