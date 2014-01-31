//
//  PlayerViewController.h
//  JSONtestApp
//
//  Created by Remus Cicu on 17/01/14.
//  Copyright (c) 2014 Agro52 Aps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayersViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UITableView *PlayersTableView;

@property (strong,nonatomic) NSArray *playerJsonWrapper;
@property (strong,nonatomic) NSArray *playerTableArray;

@property(weak, nonatomic)NSString *playerFirstName;
@property(weak, nonatomic)NSString *playerLastName;
@property(weak, nonatomic)NSString *playerNick;
@property(weak, nonatomic)NSString *playerAge;
@property(weak, nonatomic)NSString *playerCity;
@property(weak, nonatomic)NSString *playerCountry;

@end
