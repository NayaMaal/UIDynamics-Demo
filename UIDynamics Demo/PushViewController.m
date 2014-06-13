//
//  PushViewController.m
//  UIDynamics Demo
//
//  Created by Nikhilesh on 13/06/14.
//  Copyright (c) 2014 Global Logic. All rights reserved.
//

#import "PushViewController.h"
#import "UIView+Category.h"
@interface PushViewController ()
{

}
@end

@implementation PushViewController

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
    [self addBar];
    theAnimator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];

}
- (void)addBar {
    barView = [[UIView alloc] initWithFrame:CGRectMake(140, 200, 10, 100)];
    [barView setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:barView];
    
    UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    [self.view addGestureRecognizer:recognizer];
}

- (void)handlePanGesture:(UIPanGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        if ([self gestureHitsBarView:gestureRecognizer]) {
            UIPushBehavior *pushBehavior = [[UIPushBehavior alloc] initWithItems:@[barView] mode:UIPushBehaviorModeInstantaneous];
            [pushBehavior setPushDirection:CGVectorMake([gestureRecognizer velocityInView:self.view].x /5000.f, 0)];
            [theAnimator addBehavior:pushBehavior];
        }
    }
}

- (BOOL)gestureHitsBarView:(UIPanGestureRecognizer *)gestureRecognizer {
    CGPoint locationInView = [gestureRecognizer locationInView:self.view];
    return barView.left <= locationInView.x && locationInView.y <= barView.top + barView.height;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
