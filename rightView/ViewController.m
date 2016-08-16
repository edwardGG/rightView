//
//  ViewController.m
//  rightView
//
//  Created by Edward on 16/8/6.
//  Copyright © 2016年 Edward. All rights reserved.
//

#import "ViewController.h"
#import "NaviViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//      self.view.backgroundColor = [UIColor colorWithRed:255/255.0f green:200/255.0f blue:27/255.0f alpha:0.5];
    self.view.backgroundColor = [UIColor redColor];
    UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(300, 100, 200, 100)];
    lb.text = @"asdadsasdasd";
    lb.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:lb];
    self.title = @"Home Controller";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:(NaviViewController *)self.navigationController
                                                                            action:@selector(showMenu)];
    self.modalPresentationStyle = UIModalPresentationCurrentContext;//关键语句，必须有
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
