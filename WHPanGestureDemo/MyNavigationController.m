//
//  MyNavigationController.m
//  WHPanGestureDemo
//
//  Created by xian on 2018/7/27.
//  Copyright © 2018年 xian. All rights reserved.
//

#import "MyNavigationController.h"

@interface MyNavigationController ()<UIGestureRecognizerDelegate>

//记录自定义手势的开始位置
@property (nonatomic, assign) CGFloat startX;

@end

@implementation MyNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //自定义滑动手势
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handleNavigationTransition:)];
    //将自定义手势添加到NavigationController的view上
    [self.view addGestureRecognizer:panGestureRecognizer];
    //设置自定义手势的代理，用于拦截自定义手势的触发
    panGestureRecognizer.delegate = self;
    //关闭系统的边缘手势
    self.interactivePopGestureRecognizer.enabled = NO;
}

- (void)handleNavigationTransition:(UIPanGestureRecognizer *)panGesture{
    //调用系统手势绑定的方法
    [self.interactivePopGestureRecognizer.delegate performSelector:@selector(handleNavigationTransition:) withObject:panGesture];
    //计算偏移量
    CGFloat offetX = [panGesture locationInView:self.view].x - self.startX;
    if (offetX >= 0) {
        //输出偏移量
        NSLog(@"%f", offetX);
    } else {
        NSLog(@"%f", 0.0f);
    }
}

//拦截自定义手势的触发，并记录触发手势的开始位置
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    //导航控制器的跟控制器不需要返回侧滑手势（如果不屏蔽会有奇怪的效果）
    if (self.childViewControllers.count == 1) {
        return NO;
    }
    //记录触发手势的开始位置
    self.startX = [gestureRecognizer locationInView:self.view].x;
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
