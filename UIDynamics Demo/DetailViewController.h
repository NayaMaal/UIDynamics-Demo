//
//  DetailViewController.h
//  UIDynamics Demo
//
//  Created by Nikhilesh on 09/12/13.
//  Copyright (c) 2013 Global Logic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
