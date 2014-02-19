//
//  NewsViewController.m
//  JSONtestApp
//
//  Created by Lasse Wingreen on 02/01/14.
//  Copyright (c) 2014 Agro52 Aps. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsDetailedViewController.h"
#import "SWRevealViewController.h"
#import "NSString+StripHTMLwithRegEX.h"
#import "AFNSyncEngine.h"
#import "Companies.h"


@interface NewsViewController ()


@end

@implementation NewsViewController

@synthesize managedObjectContext = _managedObjectContext;
@synthesize companies = _companies;

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
    self.title = @"News";
    
    self.companies = [NSArray array];

     self.managedObjectContext = [NSManagedObjectContext MR_contextForCurrentThread];
    
    [self loadRecordsFromCoreData];
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    _sidebarButton.target = self.revealViewController;
    _sidebarButton.action = @selector(revealToggle:);
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    

    
  //  [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    
    {
        NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
        
        NSURL * url = [NSURL URLWithString:@"http://playnation.eu/beta/hacks/getItemiOS.php"];
        NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
        NSString * params =@"tableName=news";
        [urlRequest setHTTPMethod:@"POST"];
        [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
        
        
        
        NSURLSessionDataTask * dataTask =[defaultSession dataTaskWithRequest:urlRequest
                                                           completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                               
                                                               
                                                               NSLog(@"Response:%@ %@\n", response, error);
                                                               
                                                               
                                                               if(error == nil)
                                                               {
                                                                   NSLog(@"Data = %@",data);
                                                               
                                                                   NSError *jsonNewsError = nil;
                                                                   
                                                                   newsJsonWrapper = [NSJSONSerialization
                                                                                         JSONObjectWithData:data
                                                                                         options:NSJSONReadingAllowFragments
                                                                                         error:&jsonNewsError];
                                                                   
                                                                   if (!newsJsonWrapper) {
                                                                            NSLog(@"Error parsing JSON: %@", jsonNewsError);
                                                                   }
                                                                   
                                                                   else {
                                                                       NSLog(@"NewsJsonList: %@", newsJsonWrapper);
                                                                
                                                                       [NewsTableView reloadData];
                                                                       
                                                                   newsTableArray = newsJsonWrapper;
                                                                       
                                                                   }
                                                                }
                                                              
                                                           }];
        [dataTask resume];
    
            
        
        
    }
    
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:kAFNSyncEngineSyncCompletedNotificationName
                                                      object:nil
                                                       queue:nil
                                                  usingBlock:^(NSNotification *note) {
                                                      [self loadRecordsFromCoreData];
                                                      [self.tableView reloadData];
                                                  }];
    
    [[AFNSyncEngine sharedEngine] addObserver:self forKeyPath:@"syncInProgress"
                                      options:NSKeyValueObservingOptionNew
                                      context:nil];
}







- (void)loadRecordsFromCoreData
{
    [self.managedObjectContext performBlockAndWait:^{
        [self.managedObjectContext reset];
        NSError *error = nil;
        NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Companies"];
        [request setSortDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"createdTime" ascending:NO]]];
        self.companies = [self.managedObjectContext executeFetchRequest:request error:&error];
        NSLog(@"loadRecordsFromCoreData:%@", self.companies);
    }];
    
    [self.managedObjectContext reset];
    
    self.companies = [Companies MR_findAllSortedBy:@"createdTime"
                                         ascending:NO
                                     withPredicate:nil
                                         inContext:self.managedObjectContext];
    
    NSLog(@"loadRecordsFromCoreData:companies:%@", self.companies);
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [newsJsonWrapper count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newsCell"];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"newsCell"];
    }
    
    cell.textLabel.text = [[newsTableArray objectAtIndex:indexPath.row] objectForKey:@"Headline"];
    cell.detailTextLabel.text = [[newsTableArray objectAtIndex:indexPath.row] objectForKey:@"DisplayName"];
    
    return cell;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showNewsDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NewsViewController *newsDestViewController = segue.destinationViewController;
        newsDestViewController.headline = [[newsTableArray objectAtIndex:indexPath.row] objectForKey:@"Headline"];
        newsDestViewController.newsText = [[newsTableArray objectAtIndex:indexPath.row] objectForKey:@"NewsText"];
        
    }
}


@end
