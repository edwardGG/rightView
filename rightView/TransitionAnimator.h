//
//  TransitionAnimator.h
//  rightView
//
//  Created by Edward on 16/8/8.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface TransitionAnimator : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign, getter = isPresenting) BOOL presenting;


//@property (nonatomic) UINavigationControllerOperation operation;

@end
