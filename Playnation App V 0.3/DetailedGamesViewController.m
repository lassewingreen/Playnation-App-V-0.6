//
//  DetailedGamesViewController.m
//  Playnation App V 0.3
//
//  Created by Remus Cicu on 19/02/14.
//  Copyright (c) 2014 Remus Cicu. All rights reserved.
//

#import "DetailedGamesViewController.h"
#import "UITabBarController+ShowHideBar.h"

@interface DetailedGamesViewController ()

@end

@implementation DetailedGamesViewController

@synthesize gameAvatar, gameAvatarImage, gameDate, gameDateLabel, gameName, gameNameLabel, gameRating, gameRatingLabel, gameType, gameTypeLabel, infoScreen, newsScreen, wallScreen, segControl,gameDescription, gameDescriptionText    ;

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
    gameNameLabel.text = gameName;
    gameTypeLabel.text = gameType;
    gameDateLabel.text = gameDate;
    gameAvatarImage.image = [UIImage imageNamed:@"playnationLogo.png"];
    gameRatingLabel.text = gameRating;
    gameDescriptionText.text = gameDescription;
    
    //Custom TableView Background
    self.parentViewController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"common_bg"]];
    self.tableView.backgroundColor = [UIColor clearColor];
    UIEdgeInsets inset =UIEdgeInsetsMake(1, 0, 0, 0);
    self.tableView.contentInset = inset;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

-(BOOL)hidesBottomBarWhenPushed{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (IBAction)segValueChanged:(id)sender {
    
    if (segControl.selectedSegmentIndex == 0) {
        self.infoScreen.hidden = NO;
        self.newsScreen.hidden = YES;
        self.wallScreen.hidden = YES;
    }
    else if (segControl.selectedSegmentIndex == 1){
        self.infoScreen.hidden = YES;
        self.newsScreen.hidden = NO;
        self.wallScreen.hidden = YES;
        
    }
    else if (segControl.selectedSegmentIndex == 2){
        self.infoScreen.hidden = YES;
        self.newsScreen.hidden = YES;
        self.wallScreen.hidden = NO;
        
    }
    
}

@end
