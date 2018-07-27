//
//  ViewController.m
//  WHPanGestureDemo
//
//  Created by xian on 2018/7/27.
//  Copyright © 2018年 xian. All rights reserved.
//

#import "ViewController.h"
#import "MyViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)goAction:(UIButton *)sender {
    [self.navigationController pushViewController:[MyViewController new] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
