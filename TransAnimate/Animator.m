//
//  Animator.m
//  TransAnimate
//
//  Created by davidli on 2017/2/10.
//  Copyright © 2017年 Taole. All rights reserved.
//

#import "Animator.h"

@implementation Animator

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *toViewControler   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];

    //返回 ViewController
    if ([toViewControler isKindOfClass:NSClassFromString(@"ViewController")]) {

        CGRect frame = toView.frame;
        frame.origin.x = - CGRectGetWidth(frame);
        toView.frame = frame;
        [containerView addSubview:toView];

        [UIView animateWithDuration:duration delay:0
             usingSpringWithDamping:0.8 initialSpringVelocity:3
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             CGRect frame = fromView.frame;
                             frame.origin.x = CGRectGetMaxX(frame);
                             fromView.frame = frame;

                             toView.frame = [transitionContext finalFrameForViewController:toViewControler];
                         } completion:^(BOOL finished) {
                             [fromView removeFromSuperview];
                             BOOL canceled = [transitionContext transitionWasCancelled];
                             [transitionContext completeTransition:!canceled];
                         }];
    }
    //从 ViewController push或pop到别的界面
    else{
        //缩放动画
        [self scaleAnimationWithTransContext:transitionContext];
        //位移动画
        //[self frameAnimationWithTransContext:transitionContext];
    }
}



#pragma mark -Private
- (void)scaleAnimationWithTransContext:(id<UIViewControllerContextTransitioning>)transitionContext
{
    NSTimeInterval duration = [self transitionDuration:transitionContext];

    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toView];
    toView.transform = CGAffineTransformMakeScale(0, 0);

    [UIView animateWithDuration:duration / 2.0 animations:^{
        toView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
    } completion:^(BOOL finished) {
        toView.transform = CGAffineTransformIdentity;
        BOOL canceled = [transitionContext transitionWasCancelled];
        [transitionContext completeTransition:!canceled];
    }];
}


- (void)frameAnimationWithTransContext:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *toViewControler   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView   = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *containerView = [transitionContext containerView];

    CGRect frame = toView.frame;
    frame.origin.x = CGRectGetWidth(frame);
    toView.frame = frame;
    [containerView addSubview:toView];

    NSTimeInterval duration = [self transitionDuration:transitionContext];

    [UIView animateWithDuration:duration delay:0
         usingSpringWithDamping:0.8 initialSpringVelocity:3
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         toView.frame = [transitionContext finalFrameForViewController:toViewControler];
                         CGRect frame = fromView.frame;
                         frame.origin.x = -CGRectGetMaxX(frame);
                         fromView.frame = frame;
                     } completion:^(BOOL finished) {
                         BOOL canceled = [transitionContext transitionWasCancelled];
                         [transitionContext completeTransition:!canceled];
                     }];
}
@end
