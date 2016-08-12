//
//  ViewController.m
//  XYScrollView
//
//  Created by etom on 16/8/12.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "ViewController.h"
#import "XYScrollView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    XYScrollView *scv = [[XYScrollView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height * 0.3) ImageArray:@[[UIImage imageNamed:@"1.jpg"], [UIImage imageNamed:@"2.jpg"], [UIImage imageNamed:@"3.jpg"]] TimerInv:2 RestartTimerInv:5];
    [self.view addSubview:scv];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
