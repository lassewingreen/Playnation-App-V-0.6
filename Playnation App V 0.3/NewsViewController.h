//
//  NewsViewController.h
//  JSONtestApp
//
//  Created by Lasse Wingreen on 02/01/14.
//  Copyright (c) 2014 Agro52 Aps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsViewController : UITableViewController <UITableViewDataSource> {
    
    
    __weak IBOutlet UIRefreshControl *refreshTheNewsDragDown;
    

    IBOutlet UITableView *NewsTableView;


    NSArray *newsJsonWrapper;
    NSArray *newsTableArray;
    NSArray *playerIdArray;
    NSDictionary *newsJsonDictionary;
    NSMutableData *newsData;
    

}


@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSArray *companies;

@property (weak, nonatomic)NSString *headline;
@property (weak, nonatomic)NSString *newsText;
@property (weak, nonatomic)IBOutlet UIBarButtonItem *sidebarButton;

@end


