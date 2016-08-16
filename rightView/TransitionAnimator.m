//
//  TransitionAnimator.m
//  rightView
//
//  Created by Edward on 16/8/8.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import "TransitionAnimator.h"

#define APP_W0 [UIScreen mainScreen].bounds.size.width
#define APP_H0 [UIScreen mainScreen].bounds.size.height

@implementation TransitionAnimator

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.5f;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    if (self.presenting) {
        //ANIMATE VC ENTERING FROM THE RIGHT SIDE OF THE SCREEN
        [transitionContext.containerView addSubview:fromVC.view];
        [transitionContext.containerView addSubview:toVC.view];
        toVC.view.frame = CGRectMake(0, 0, 2*APP_W0, APP_H0); //SET ORIGINAL POSITION toVC OFF TO THE RIGHT
        [UIView animateWithDuration:[self transitionDuration:transitionContext]
                         animations:^{
          //MOVE fromVC OFF TO THE LEFT
//                             fromVC.view.frame = CGRectMake(0, -APP_H0, APP_W0, APP_H0);
            fromVC.view.frame = CGRectMake((-1)*APP_W0, 0, APP_W0, APP_H0);
            toVC.view.frame = CGRectMake(0, 0, APP_W0, APP_H0); //ANIMATE toVC IN TO OCCUPY THE SCREEN
                         } completion:^(BOOL finished) {
                             [transitionContext completeTransition:YES];
                         }];
    }else{
        //ANIMATE VC EXITING TO THE RIGHT SIDE OF THE SCREEN
        
        [transitionContext.containerView addSubview:fromVC.view];
        [transitionContext.containerView addSubview:toVC.view];
        
        toVC.view.frame = CGRectMake(0, 0, -2*APP_W0, APP_H0); //SET ORIGINAL POSITION toVC OFF TO THE RIGHT
        [UIView animateWithDuration:[self transitionDuration:transitionContext]
                         animations:^{
        fromVC.view.frame = CGRectMake(0, 0, APP_W0, APP_H0);
                             //MOVE fromVC OFF TO THE LEFT
        toVC.view.frame = CGRectMake(0, 0, APP_W0, APP_H0); //ANIMATE toVC IN TO OCCUPY THE SCREEN
                         } completion:^(BOOL finished) {
                             [transitionContext completeTransition:YES];
                         }];

    }
}

@end
