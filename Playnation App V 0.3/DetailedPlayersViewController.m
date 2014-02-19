//
//  DetailedPlayersViewController.m
//  Playnation App V 0.3
//
//  Created by Remus Cicu on 14/02/14.
//  Copyright (c) 2014 Remus Cicu. All rights reserved.
//

#import "DetailedPlayersViewController.h"

@interface DetailedPlayersViewController ()

@end

@implementation DetailedPlayersViewController

@synthesize playerRating, playerAddress,   playerBirthday, playerName, playerAddressLabel, playerAvatarImage, playerBirthdayLabel, playerJoined, playerJoinedLabel, playerNameLabel , playerNickname, playerNicknameLabel, playerRatingLabel, valueChangeSeg;

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
    playerNameLabel.text = playerName;
    playerRatingLabel.text = playerRating;
    playerNicknameLabel.text = playerNickname;
    playerBirthdayLabel.text = playerBirthday;
    playerAddressLabel.text = playerAddress;
    playerJoinedLabel.text = playerJoined;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(BOOL)hidesBottomBarWhenPushed{
    return YES;
}

- (IBAction)segControl:(id)sender {
    if (valueChangeSeg.selectedSegmentIndex == 0) {
        self.wallScreen.hidden = NO;
        self.gamesScreen.hidden = YES ;
        self.friendsScreen.hidden= YES;
    }
    else if (valueChangeSeg.selectedSegmentIndex == 1) {
        self.wallScreen.hidden = YES ;
        self.gamesScreen.hidden = NO ;
        self.friendsScreen.hidden = YES ;
    }
    else if (valueChangeSeg.selectedSegmentIndex == 2) {
        self.wallScreen.hidden = YES ;
        self.gamesScreen.hidden = YES ;
        self.friendsScreen.hidden = NO ;
    }
    
}
@end
