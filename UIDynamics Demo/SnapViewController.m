//
//  SnapViewController.m
//  UIDynamics Demo
//
//  Created by Nikhilesh on 11/12/13.
//  Copyright (c) 2013 Global Logic. All rights reserved.
//

#import "SnapViewController.h"

@interface SnapViewController ()
@property (nonatomic, strong) UIDynamicAnimator *animator;
//! Reference to the previously applied snap behavior.
@property (nonatomic, strong) UISnapBehavior *snapBehavior;
- (IBAction)handleSnapGesture:(UITapGestureRecognizer*)gesture;

@end

@implementation SnapViewController

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
    // Do any additional setup after loading the view from its nib.
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    self.animator = animator;
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSnapGesture:)];
    [self.view addGestureRecognizer:singleFingerTap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleSnapGesture:(UITapGestureRecognizer*)gesture
{
    CGPoint point = [gesture locationInView:self.view];
    
    // Remove the previous behavior.
    [self.animator removeBehavior:self.snapBehavior];
    
    UISnapBehavior *snapBehavior = [[UISnapBehavior alloc] initWithItem:self.square1 snapToPoint:point];
    [self.animator addBehavior:snapBehavior];
    
    self.snapBehavior = snapBehavior;
}

@end
