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

@interface NewsViewController ()


@end

@implementation NewsViewController

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
