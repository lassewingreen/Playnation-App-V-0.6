//
//  PlayersDetailedViewController.m
//  JSONtestApp
//
//  Created by Remus Cicu on 20/01/14.
//  Copyright (c) 2014 Agro52 Aps. All rights reserved.
//

#import "PlayersDetailedViewController.h"

@interface PlayersDetailedViewController ()

@end

@implementation PlayersDetailedViewController
@synthesize playerAge, playerCity, playerCountry, playerFirstName, playerLastName, playerNick;
@synthesize playerAgeLabel, playerCityLabel, playerCountryLabel, playerFirstNameLabel, playerLastNameLabel, playerNickLabel;
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
    playerFirstNameLabel.text = playerFirstName;
    playerLastNameLabel.text = playerLastName;
    playerNickLabel.text = playerNick;
    playerAgeLabel.text = playerAge;
    playerCityLabel.text = playerCity;
    playerCountryLabel.text = playerCountry;
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
