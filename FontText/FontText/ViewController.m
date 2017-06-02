//
//  ViewController.m
//  FontText
//
//  Created by Joe on 2017/6/1.
//  Copyright © 2017年 Joe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *lab = [[UILabel alloc] initWithFrame:self.view.bounds];
    lab.text = @"按时到合肥拉萨交电话费拉还是快递费卢卡斯 阿萨德会尽快了粉红色的拉客户放假啦是肯定会发生良好的会计法哈收了的看法和沙拉肯定会发了卡萨丁";
    lab.font = [UIFont systemFontOfSize:19];
    lab.numberOfLines = 0;
    [self.view addSubview:lab];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
