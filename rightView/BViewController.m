//
//  BViewController.m
//  rightView
//
//  Created by Edward on 16/8/6.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import "BViewController.h"
#import "FViewController.h"
#import "Masonry.h"
#define MAS_SHORTHAND_GLOBALS
#define equalTo(...)                     mas_equalTo(__VA_ARGS__)
#define greaterThanOrEqualTo(...)        mas_greaterThanOrEqualTo(__VA_ARGS__)
#define lessThanOrEqualTo(...)           mas_lessThanOrEqualTo(__VA_ARGS__)
#define offset(...)                      mas_offset(__VA_ARGS__)
#import "TransitionAnimator.h"
@interface BViewController ()<UITableViewDelegate, UITableViewDataSource,UINavigationControllerDelegate>
@property (nonatomic) UITableView *tableView;


@property (nonatomic) TransitionAnimator *animator;

@end

@implementation BViewController
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.title = @"BViewController";
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     static NSString *identifyCell = @"Cell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifyCell];
    cell.textLabel.text = @"asdasdasd";
    cell.backgroundColor = [UIColor colorWithRed:7/255.0f green:7/255.0f blue:7/255.0f alpha:0.5];
    cell.contentView.backgroundColor = [UIColor colorWithRed:7/255.0f green:7/255.0f blue:7/255.0f alpha:0.5];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
        FViewController *fVC = [[FViewController alloc] init];
            fVC.view.backgroundColor = [UIColor colorWithRed:7/255.0f green:7/255.0f blue:7/255.0f alpha:0.5];
    
    [self.navigationController pushViewController:fVC animated:YES];
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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _animator = [TransitionAnimator new];
    self.view.backgroundColor = [UIColor colorWithRed:7/255.0f green:7/255.0f blue:7/255.0f alpha:0.1];

    UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(300, 200, 200, 100)];
    lb.text = @"asdadsasdasdasdasdasdads";
    lb.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:lb];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(20, 100, 100, 20);
    [btn setTitle:@"click" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn setBackgroundColor:[UIColor yellowColor]];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
//    self.view.clipsToBounds = YES;
//    [self tableView];
//    self.navigationController.delegate = self;
    
//    [self leftBtn];
    
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController: (UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
//    _animator = [TransitionAnimator new];
//    animator.presenting = YES;
//    fromVC = self;
//    toVC = [[FViewController alloc] init];
//    animator.operation = UINavigationControllerOperationPush;
        _animator.presenting = YES;
        return _animator;
}

- (void)click{

    FViewController *fVC = [[FViewController alloc] init];
        fVC.view.backgroundColor = [UIColor colorWithRed:7/255.0f green:7/255.0f blue:7/255.0f alpha:0.1];

    [self.navigationController pushViewController:fVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableView *)tableView {
	if(_tableView == nil) {
		_tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor colorWithRed:7/255.0f green:7/255.0f blue:7/255.0f alpha:0.5];
	}
	return _tableView;
}

@end
