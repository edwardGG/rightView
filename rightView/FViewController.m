//
//  FViewController.m
//  rightView
//
//  Created by Edward on 16/8/8.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import "FViewController.h"
#import "TransitionAnimator.h"
#define kRGBA(R,G,B,A) [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:A]
@interface FViewController ()<UINavigationControllerDelegate>
@property (nonatomic) UIBarButtonItem *leftBtn;
@end

@implementation FViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.title = @"FViewController";
        self.navigationItem.leftBarButtonItem = self.leftBtn;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:7/255.0f green:7/255.0f blue:7/255.0f alpha:0.1];

    [self leftBtn];
    
//    self.navigationController.delegate = self;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController: (UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    TransitionAnimator *animator = [TransitionAnimator new];
    animator.presenting = NO;
    NSLog(@"FVC");
    return animator;
}

- (void)viewDidAppear:(BOOL)animated
{
    self.navigationController.delegate = self;
    [super viewDidAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    if (self.navigationController.delegate == self) {
        self.navigationController.delegate = nil;
    }
    [super viewDidDisappear:animated];
}

- (void)popView{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (UIBarButtonItem *)leftBtn {
    if(_leftBtn == nil) {
        _leftBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(popView)];
        [_leftBtn setTitle:@"返回"];
        
        self.navigationItem.leftBarButtonItem = _leftBtn;
    }
    return _leftBtn;
}

@end
