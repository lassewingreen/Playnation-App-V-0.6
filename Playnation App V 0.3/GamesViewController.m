//
//  GamesViewController.m
//  JSONtestApp
//
//  Created by Remus Cicu on 17/01/14.
//  Copyright (c) 2014 Agro52 Aps. All rights reserved.
//

#import "GamesViewController.h"
#import "NSString+StripHTMLwithRegEX.h"
#import "SWRevealViewController.h"
#import "GamesCell.h"

@interface GamesViewController ()

@end

@implementation GamesViewController

@synthesize gamesJsonWrapper, gamesTableArray, GamesTableView;

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
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navigationBar"] forBarMetrics:UIBarMetricsDefault];
    [super viewDidLoad];
    self.title = @"Games";
    //set white text for NavController
    NSDictionary *textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                    [UIColor whiteColor],NSForegroundColorAttributeName,
                                    [UIColor whiteColor],NSBackgroundColorAttributeName,nil];
    self.navigationController.navigationBar.titleTextAttributes = textAttributes;

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
        NSString * params =@"tableName=games";
        [urlRequest setHTTPMethod:@"POST"];
        [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
        
        NSURLSessionDataTask * dataTask =[defaultSession dataTaskWithRequest:urlRequest
                                                           completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                               
                                                               NSLog(@"Response:%@ %@\n", response, error);
                                                               
                                                               
                                                               if(error == nil)
                                                               {
                                                                   
                                                                   NSLog(@"Data = %@",data);
                                                                   
                                                                   
                                                                   NSError *jsonNewsError = nil;
                                                                   
                                                                   gamesJsonWrapper = [NSJSONSerialization
                                                                                       JSONObjectWithData:data
                                                                                       options:NSJSONReadingAllowFragments
                                                                                       error:&jsonNewsError];
                                                                   
                                                                   if (!gamesJsonWrapper) {
                                                                       NSLog(@"Error parsing JSON: %@", jsonNewsError);
                                                                   }
                                                                   
                                                                   else {
                                                                       NSLog(@"jsonList: %@", gamesJsonWrapper);
                                                                       
                                                                       [GamesTableView reloadData];
                                                                       
                                                                       gamesTableArray = gamesJsonWrapper;
                                                                       
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
    return [gamesJsonWrapper count];
}

-(UIImage *) cellBackgroundForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIImage *backgroundCell = [UIImage imageNamed:@"cell_background"];
    return backgroundCell;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GamesCell *cell = [tableView dequeueReusableCellWithIdentifier:@"gamesCell"];
    
    if(cell == nil){
        cell = [[GamesCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"gamesCell"];
    }
    
    cell.gamesName.text = [[gamesTableArray objectAtIndex:indexPath.row] objectForKey:@"GameName"];
    
    if ([[[gamesTableArray objectAtIndex:indexPath.row] objectForKey:@"Developer"] isKindOfClass:[NSString class]]){
        cell.detailTextLabel.text = [[gamesTableArray objectAtIndex:indexPath.row] objectForKey:@"Developer"];
        
        
    }else{
        cell.detailTextLabel.text = @"Companie";
    }
    
    
    cell.gamesImage.image = [UIImage imageNamed:@"playnationLogo.png"];
    cell.gamesImage.clipsToBounds = YES;
    UIImage *background = [self cellBackgroundForRowAtIndexPath:indexPath];
    UIImageView *cellBackgroundView = [[UIImageView alloc] initWithImage:background];
    cellBackgroundView.image = background;
    cell.backgroundView = cellBackgroundView;
    
    return cell;
}




#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showGamesDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        GamesViewController *gamesDestViewController = segue.destinationViewController;
        gamesDestViewController.gameName = [[gamesTableArray objectAtIndex:indexPath.row] objectForKey:@"GameName"];
        gamesDestViewController.gameDescription = [[gamesTableArray objectAtIndex:indexPath.row] objectForKey:@"GameDesc"];
        
    }
    
}



@end
