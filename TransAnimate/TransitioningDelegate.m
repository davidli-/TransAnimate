//
//  TransitioningDelegate.m
//  TransAnimate
//
//  Created by davidli on 2017/2/13.
//  Copyright © 2017年 Taole. All rights reserved.
//

#import "TransitioningDelegate.h"
#import "Animator.h"


@implementation TransitioningDelegate

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                 presentingController:(UIViewController *)presenting
                                                                     sourceController:(UIViewController *)source
{
    Animator *animator = [Animator new];
    return animator;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    Animator *animator = [Animator new];
    return animator;
}


@end
