//
//  PlayerViewController.m
//  JSONtestApp
//
//  Created by Remus Cicu on 17/01/14.
//  Copyright (c) 2014 Agro52 Aps. All rights reserved.
//

#import "PlayersViewController.h"
#import "NSString+StripHTMLwithRegEX.h"

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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"playersCell"];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"playersCell"];
    }
    
    cell.textLabel.text = [[playerTableArray objectAtIndex:indexPath.row] objectForKey:@"LastName"];
    cell.detailTextLabel.text = [[playerTableArray objectAtIndex:indexPath.row] objectForKey:@"FirstName"];
    
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
    if ([segue.identifier isEqualToString:@"showPlayersDetail"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        PlayersViewController *playerDestViewController = segue.destinationViewController;
        playerDestViewController.playerFirstName = [[playerTableArray objectAtIndex:indexPath.row] objectForKey:@"FirstName"];
        playerDestViewController.playerLastName = [[playerTableArray objectAtIndex:indexPath.row] objectForKey:@"LastName"];
        playerDestViewController.playerNick = [[playerTableArray objectAtIndex:indexPath.row] objectForKey:@"NickName"];
        playerDestViewController.playerAge = [[playerTableArray objectAtIndex:indexPath.row] objectForKey:@"DateOfBirth"];
        playerDestViewController.playerCity = [[playerTableArray objectAtIndex:indexPath.row] objectForKey:@"City"];
        playerDestViewController.playerCountry = [[playerTableArray objectAtIndex:indexPath.row] objectForKey:@"Country"];
        
    }
}



@end
