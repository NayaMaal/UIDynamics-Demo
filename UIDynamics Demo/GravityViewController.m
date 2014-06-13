//
//  GravityViewController.m
//  UIDynamics Demo
//
//  Created by Nikhilesh on 13/06/14.
//  Copyright (c) 2014 Global Logic. All rights reserved.
//

#import "GravityViewController.h"

@interface GravityViewController ()

@end

@implementation GravityViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    ballView = [[UIView alloc] init];
    [ballView setFrame:CGRectMake(0, 0, 40, 40)];
    ballView.backgroundColor = [UIColor lightGrayColor];
    ballView.layer.cornerRadius = 20;
    ballView.layer.borderColor = [UIColor grayColor].CGColor;
    ballView.layer.borderWidth = 2;
    ballView.center = CGPointMake(100, 100);
    [self.view addSubview:ballView];

    // Do any additional setup after loading the view from its nib.
    theAnimator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UIGravityBehavior *gravityBehaviour = [[UIGravityBehavior alloc] initWithItems:@[ballView]];
    [theAnimator addBehavior:gravityBehaviour];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
