//
//  ViewController.m
//  WriteView
//
//  Created by 李晓飞 on 2017/6/11.
//  Copyright © 2017年 xiaofei. All rights reserved.
//

#import "ViewController.h"
#import "WriteView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
     WriteView *write = [[WriteView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.width)];
//     [write setBackgroundColor:[UIColor whiteColor]];
    [write setBackgroundColor:[UIColor brownColor]];
     [self.view addSubview:write];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
