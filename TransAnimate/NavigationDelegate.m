//
//  NavigationDelegate.m
//  TransAnimate
//
//  Created by davidli on 2017/2/13.
//  Copyright © 2017年 Taole. All rights reserved.
//

#import "NavigationDelegate.h"
#import "Animator.h"

@implementation NavigationDelegate


-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                 animationControllerForOperation:(UINavigationControllerOperation)operation
                                              fromViewController:(UIViewController *)fromVC
                                                toViewController:(UIViewController *)toVC
{
    return [Animator new];
}
@end
