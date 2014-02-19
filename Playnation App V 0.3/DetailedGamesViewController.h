//
//  DetailedGamesViewController.h
//  Playnation App V 0.3
//
//  Created by Remus Cicu on 19/02/14.
//  Copyright (c) 2014 Remus Cicu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailedGamesViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UILabel *gameNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *gameTypeLabel;
@property (strong, nonatomic) IBOutlet UILabel *gameDateLabel;
@property (strong, nonatomic) IBOutlet UIImageView *gameAvatarImage;
@property (strong, nonatomic) IBOutlet UILabel *gameRatingLabel;
@property (strong, nonatomic) IBOutlet UITextView *gameDescriptionText;

@property (strong, nonatomic) IBOutlet UISegmentedControl *segControl;
- (IBAction)segValueChanged:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *infoScreen;
@property (strong, nonatomic) IBOutlet UIView *newsScreen;
@property (strong, nonatomic) IBOutlet UIView *wallScreen;

@property (strong, nonatomic) NSString *gameName;
@property (strong, nonatomic) NSString *gameType;
@property (strong, nonatomic) NSString *gameDate;
@property (strong, nonatomic) NSString *gameAvatar;
@property (strong, nonatomic) NSString *gameRating;
@property (strong, nonatomic) NSString *gameDescription;

@end
