//
//  MasterViewController.h
//  UIDynamics Demo
//
//  Created by Nikhilesh on 09/12/13.
//  Copyright (c) 2013 Global Logic. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
