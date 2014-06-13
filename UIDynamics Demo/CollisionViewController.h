//
//  CollisionViewController.h
//  UIDynamics Demo
//
//  Created by Nikhilesh on 13/06/14.
//  Copyright (c) 2014 Global Logic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollisionViewController : UIViewController<UICollisionBehaviorDelegate>
{
    UIView *ballView;
    UIDynamicAnimator *theAnimator;
}

@end
