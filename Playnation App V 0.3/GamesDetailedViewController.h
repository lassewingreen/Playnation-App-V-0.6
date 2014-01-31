//
//  GamesDetailedViewController.h
//  JSONtestApp
//
//  Created by Remus Cicu on 20/01/14.
//  Copyright (c) 2014 Agro52 Aps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GamesDetailedViewController : UIViewController


@property (strong, nonatomic)IBOutlet UILabel *gameNameLabel;
@property (strong, nonatomic)IBOutlet UITextView *gameDescView;
@property (weak, nonatomic)NSString *gameDescription;
@property (weak, nonatomic)NSString *gameName;

@end
