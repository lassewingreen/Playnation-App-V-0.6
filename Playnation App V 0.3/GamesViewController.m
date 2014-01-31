//
//  GamesViewController.m
//  JSONtestApp
//
//  Created by Remus Cicu on 17/01/14.
//  Copyright (c) 2014 Agro52 Aps. All rights reserved.
//

#import "GamesViewController.h"
#import "NSString+StripHTMLwithRegEX.h"

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
    [super viewDidLoad];
    self.title = @"Games";
    
    
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"gamesCell"];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"gamesCell"];
    }
    
    cell.textLabel.text = [[gamesTableArray objectAtIndex:indexPath.row] objectForKey:@"GameName"];
    
    if ([[[gamesTableArray objectAtIndex:indexPath.row] objectForKey:@"Developer"] isKindOfClass:[NSString class]]){
        cell.detailTextLabel.text = [[gamesTableArray objectAtIndex:indexPath.row] objectForKey:@"Developer"];
        
    
    }else{
    cell.detailTextLabel.text = @"Companie";
    }
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
