//
//  ViewController.m
//  CodeAutoLayout
//
//  Created by hugo on 15-8-23.
//  Copyright (c) 2015年 hugo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) UIButton *button1;
@property (nonatomic,strong) UILabel *label1;
@property (nonatomic,strong) UIButton *button2;
@property (nonatomic,strong) UILabel *label2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self buildUI];
    [self addConstraints1];
    [self buildUI2];
    [self addConstraints2];
}

- (void)buildUI {
    self.button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.button1 setTitle:@"this is button1" forState:UIControlStateNormal];
    self.button1.backgroundColor = [UIColor redColor];
    [self.button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.button1.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.button1];
    
    self.label1 = [[UILabel alloc]init];
    self.label1.backgroundColor = [UIColor yellowColor];
    self.label1.text = @"何去何从,现在你已经对自动布局进行了第一次尝试，感觉怎么样？这可能需要一些时间习惯，但是它能让你的工作更加简单，也会让你的app更加灵活。";
    self.label1.numberOfLines = 0;
    self.label1.lineBreakMode = NSLineBreakByWordWrapping;
    [self.label1 sizeToFit];
    self.label1.translatesAutoresizingMaskIntoConstraints =NO;
    [self.view addSubview:self.label1];
}

- (void)addConstraints1 {
    NSDictionary *constraintsViews = @{@"view1":self.button1,
                                       @"view2":self.label1,
                                    };

    NSArray *constrainsArrH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-8-[view1]-[view2]-8-|" options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom metrics:0 views:constraintsViews];
    NSArray *constraintsArrV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[view1(140)]" options:NSLayoutFormatAlignAllLeft | NSLayoutFormatAlignAllRight metrics:0 views:constraintsViews];
    [self.view addConstraints:constrainsArrH];
    [self.view addConstraints:constraintsArrV];
}

- (void)buildUI2 {
    self.button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.button2 setTitle:@"this is button2" forState:UIControlStateNormal];
    self.button2.backgroundColor = [UIColor orangeColor];
    self.button2.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.button2];
    
    self.label2 = [[UILabel alloc]init];
    self.label2.backgroundColor = [UIColor greenColor];
    self.label2.text = @"追求卓越，成功就会在不经意间追上你跟随自己的节奏学习，思考，总结，找到自己，别人才会找到你";
    self.label2.numberOfLines = 0;
    self.label2.translatesAutoresizingMaskIntoConstraints = NO;
    [self.label2 sizeToFit];
    [self.view addSubview:self.label2];
}

- (void)addConstraints2 {
    NSArray *constraintsArrH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-8-[_button2]-8-|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(_button2)];
    NSArray *constraintsButton2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_button1]-10-[_button2]" options:0 metrics:0 views:NSDictionaryOfVariableBindings(_button1,_button2)];
    [self.view addConstraints:constraintsButton2];
    [self.view addConstraints:constraintsArrH];
    NSArray *constraintsArrV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_button2]-10-[_label2]" options:NSLayoutFormatAlignAllLeft | NSLayoutFormatAlignAllRight metrics:0 views:NSDictionaryOfVariableBindings(_button2,_label2)];
    [self.view addConstraints:constraintsArrV];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
