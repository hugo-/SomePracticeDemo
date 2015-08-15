//
//  ViewController.m
//  StoryBoardDemo
//
//  Created by hugo on 15-8-15.
//  Copyright (c) 2015年 hugo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)showSecond:(id)sender {
    UIAlertView *alertView  = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"天行健，君子自强不息" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认",@"请再确认",nil];
    [alertView show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
