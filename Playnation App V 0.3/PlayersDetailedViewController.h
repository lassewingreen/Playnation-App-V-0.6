//
//  PlayersDetailedViewController.h
//  JSONtestApp
//
//  Created by Remus Cicu on 20/01/14.
//  Copyright (c) 2014 Agro52 Aps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayersDetailedViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *playerFirstNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *playerLastNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *playerNickLabel;
@property (strong, nonatomic) IBOutlet UILabel *playerAgeLabel;
@property (strong, nonatomic) IBOutlet UILabel *playerCityLabel;
@property (strong, nonatomic) IBOutlet UILabel *playerCountryLabel;

@property(weak, nonatomic)NSString *playerFirstName;
@property(weak, nonatomic)NSString *playerLastName;
@property(weak, nonatomic)NSString *playerNick;
@property(weak, nonatomic)NSString *playerAge;
@property(weak, nonatomic)NSString *playerCity;
@property(weak, nonatomic)NSString *playerCountry;

@end
