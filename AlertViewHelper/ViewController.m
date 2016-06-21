//
//  ViewController.m
//  AlertViewHelper
//
//  Created by admin on 16/6/21.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

//http://www.jianshu.com/p/de2ecfd770c2
//轻松学会封装自定义视图view

#import "ViewController.h"
#import "AlertViewHelper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor=[UIColor redColor];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    AlertViewHelper *avh=[AlertViewHelper alterViewWithTitle:@"标题" content:@"自定义alertview" cancel:@"取消" sure:@"确定" cancelBtnClick:^{
        //取消按钮点击事件
        NSLog(@"取消");
    } sureBtnClick:^{
        //确定按钮点击事件
        NSLog(@"确定");
    }];
    [self.view addSubview:avh];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
