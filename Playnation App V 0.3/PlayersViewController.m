//
//  PlayerViewController.m
//  JSONtestApp
//
//  Created by Remus Cicu on 17/01/14.
//  Copyright (c) 2014 Agro52 Aps. All rights reserved.
//

#import "PlayersViewController.h"
#import "NSString+StripHTMLwithRegEX.h"
#import "SWRevealViewController.h"
#import "PlayerCell.h"

@interface PlayersViewController ()

@end

@implementation PlayersViewController
@synthesize PlayersTableView;
@synthesize playerJsonWrapper;
@synthesize playerTableArray;

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
    self.title = @"Players";
    //set white text for NavController
    NSDictionary *textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                    [UIColor whiteColor],NSForegroundColorAttributeName,
                                    [UIColor whiteColor],NSBackgroundColorAttributeName,nil];
    self.navigationController.navigationBar.titleTextAttributes = textAttributes;

    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navigationBar"] forBarMetrics:UIBarMetricsDefault];
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    _sidebarButton.target = self.revealViewController;
    _sidebarButton.action = @selector(revealToggle:);
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    //Custom TableView Background
    self.parentViewController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"common_bg"]];
    self.tableView.backgroundColor = [UIColor clearColor];
    UIEdgeInsets inset =UIEdgeInsetsMake(1, 0, 0, 0);
    self.tableView.contentInset = inset;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    //  [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    
    {
        NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
        
        NSURL * url = [NSURL URLWithString:@"http://playnation.eu/beta/hacks/getItemiOS.php"];
        NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
        NSString * params =@"tableName=player";
        [urlRequest setHTTPMethod:@"POST"];
        [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
        
        NSURLSessionDataTask * dataTask =[defaultSession dataTaskWithRequest:urlRequest
                                                           completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                               
                                                               NSLog(@"Response:%@ %@\n", response, error);
                                                               
                                                               
                                                               if(error == nil)
                                                               {
                                                                   
                                                                   NSLog(@"Data = %@",data);
                                                                   
                                                                   NSError *jsonNewsError = nil;
                                                                   
                                                                   playerJsonWrapper = [NSJSONSerialization
                                                                                        JSONObjectWithData:data
                                                                                        options:NSJSONReadingAllowFragments
                                                                                        error:&jsonNewsError];
                                                                   
                                                                   if (!playerJsonWrapper) {
                                                                       NSLog(@"Error parsing JSON: %@", jsonNewsError);
                                                                   }
                                                                   
                                                                   else {
                                                                       NSLog(@"PlayerJsonList: %@", playerJsonWrapper);
                                                                       
                                                                       [PlayersTableView reloadData];
                                                                       
                                                                       playerTableArray = playerJsonWrapper;
                                                                       
                                                                   }
                                                               }
                                                               
                                                           }];
        [dataTask resume];
        
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#    // Return the number of rows in the section.
    return [playerJsonWrapper count];
}

-(UIImage *) cellBackgroundForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIImage *backgroundCell = [UIImage imageNamed:@"cell_background"];
    return backgroundCell;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PlayerCell *cell = (PlayerCell *) [tableView dequeueReusableCellWithIdentifier:@"playersCell"];
    
    if(cell == nil){
        cell = [[PlayerCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"playersCell"];
    }
    
    cell.playerFirstAndLastNameLabel.text = [NSString stringWithFormat:@"%@ %@", [[playerTableArray objectAtIndex:indexPath.row] objectForKey:@"FirstName"],[[playerTableArray objectAtIndex:indexPath.row] objectForKey:@"LastName"]] ;
    cell.playerNickLabel.text = [[playerJsonWrapper objectAtIndex:indexPath.row] objectForKey:@"NickName"];
    
    
    
    //    if ([[[playerJsonWrapper objectAtIndex:indexPath.row] objectForKey:@"DateOfBirth"]isKindOfClass:[NSString class]]){
    //        NSDate *birthday =[[playerJsonWrapper objectAtIndex:indexPath.row] objectForKey:@"DateOfBirth"];
    //        NSDate *now= [NSDate date];
    //        NSDateComponents *ageComponents = [[NSCalendar currentCalendar]components: NSYearCalendarUnit fromDate:birthday toDate:now options:0];
    //        NSInteger age = [ageComponents year];
    //        cell.playerAgeLabel.text =[NSString stringWithFormat:@"%ld",(long)age];
    //
    //
    //    }else{
    //        cell.playerAgeLabel.text = @"0";
    //    }
    cell.playerCountryLabel.text = [[playerTableArray objectAtIndex:indexPath.row] objectForKey:@"Country"];
    cell.playerImageView.image = [UIImage imageNamed:@"playnationLogo.png"];
    cell.playerImageView.clipsToBounds = YES;
    
    UIImage *background = [self cellBackgroundForRowAtIndexPath:indexPath];
    UIImageView *cellBackgroundView = [[UIImageView alloc] initWithImage:background];
    cellBackgroundView.image = background;
    cell.backgroundView = cellBackgroundView;
    
    return cell;
}




#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showPlayersDetail"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        PlayersViewController *playerDestViewController = segue.destinationViewController;
        playerDestViewController.playerName = [NSString stringWithFormat:@"%@ %@",[[playerTableArray objectAtIndex:indexPath.row] objectForKey:@"FirstName"],[[playerTableArray objectAtIndex:indexPath.row] objectForKey:@"LastName"]];
        playerDestViewController.playerNickname = [[playerTableArray objectAtIndex:indexPath.row] objectForKey:@"NickName"];
        playerDestViewController.playerBirthday = [[playerTableArray objectAtIndex:indexPath.row] objectForKey:@"DateOfBirth"];
        playerDestViewController.playerAddress = [NSString stringWithFormat:@"%@ %@ %@", [[playerTableArray objectAtIndex:indexPath.row] objectForKey:@"Address"] ,[[playerTableArray objectAtIndex:indexPath.row] objectForKey:@"City"] ,[[playerTableArray objectAtIndex:indexPath.row] objectForKey:@"Country"] ] ;
        playerDestViewController.playerRating = [[playerTableArray objectAtIndex:indexPath.row] objectForKey:@"Country"];
        
    }
}



@end
