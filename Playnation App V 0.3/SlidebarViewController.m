//
//  SlidebarViewController.m
//  JSONtestApp
//
//  Created by Remus Cicu on 23/01/14.
//  Copyright (c) 2014 Agro52 Aps. All rights reserved.
//

#import "SlidebarViewController.h"
#import "MessagesViewController.h"
#import "SWRevealViewController.h"
#import "MainViewController.h"

@interface SlidebarViewController ()
@property (nonatomic, strong) NSArray *menuItems;
@end

@implementation SlidebarViewController

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0.2f alpha:1.0f];
    self.tableView.backgroundColor = [UIColor colorWithWhite:0.2f alpha:1.0f];
    self.tableView.separatorColor = [UIColor colorWithWhite:0.15f alpha:0.2f];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newsCell"];
//    
//    if(cell == nil){
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"newsCell"];
//    }
//    
//    cell.textLabel.text = [[newsTableArray objectAtIndex:indexPath.row] objectForKey:@"Headline"];
//    cell.detailTextLabel.text = [[newsTableArray objectAtIndex:indexPath.row] objectForKey:@"DisplayName"];
//    
//    return cell;
//}



- (void) prepareForSegue: (UIStoryboardSegue *) segue sender: (id) sender
{
    // Make sure we are using the SWRevealViewControllerSegue
    if ( [segue isKindOfClass: [SWRevealViewControllerSegue class]] )
    {
        SWRevealViewControllerSegue *swSegue = (SWRevealViewControllerSegue*) segue;
        
        swSegue.performBlock = ^(SWRevealViewControllerSegue* rvc_segue, UIViewController* svc, UIViewController* dvc)
        {
            // The name of our view controller we want to navigate to
            NSString *vcName = @"";
            
            // Set the name of the Storyboard ID we want to switch to
            if ([segue.identifier isEqualToString:@"showTabBarMenu"])
            {
                vcName = @"tabBarMenu";
            }
            
            else if ([segue.identifier isEqualToString:@"showMessagesMenu"])
            {
                vcName = @"messagesMenu";
            }
            
            else if ([segue.identifier isEqualToString:@"showFriendsMenu"])
            {
                vcName = @"friendsMenu";
            }
            
            else if ([segue.identifier isEqualToString:@"showMyProfileMenu"])
            {
                vcName = @"myProfileMenu";
            }
            
            else if ([segue.identifier isEqualToString:@"showNotificationMenu"])
            {
                vcName = @"notificationMenu";
            }
            
            // If we selected a menu item
            if (vcName.length > 0)
            {
                // Get the view controller
                UIViewController *vcNew = [[UIStoryboard storyboardWithName:@"Main" bundle:NULL] instantiateViewControllerWithIdentifier:vcName];
                
                // Swap out the Front view controller and display
                [self.revealViewController setFrontViewController:vcNew];
                [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
            }
            
            else
            {
                // Could not navigate to view - add logging
            }
        };
    }
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

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
