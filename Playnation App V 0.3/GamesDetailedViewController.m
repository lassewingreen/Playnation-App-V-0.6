//
//  GamesDetailedViewController.m
//  JSONtestApp
//
//  Created by Remus Cicu on 20/01/14.
//  Copyright (c) 2014 Agro52 Aps. All rights reserved.
//

#import "GamesDetailedViewController.h"

@interface GamesDetailedViewController ()

@end

@implementation GamesDetailedViewController
@synthesize gameDescView,gameNameLabel;
@synthesize gameDescription,gameName;
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
    gameNameLabel.text = gameName;
    gameDescView.text = gameDescription;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Overriden UIViewController methods
//hide tab bar
- (BOOL)hidesBottomBarWhenPushed {
    return YES;
}


@end
