//
//  ViewController.m
//  SortArrayDemo
//
//  Created by hugo on 15-8-23.
//  Copyright (c) 2015年 hugo. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [ViewController sortArrayWithSystemSelector];
    [ViewController sortArrCustom];
    [ViewController sortArray3];
}

#pragma mark- system framework
/*
 系统方法
 */
+ (void)sortArrayWithSystemSelector {
    //system framework selector
    NSArray *array = [NSArray arrayWithObjects:@"cd",@"123456",@"456123",@"123456789",@"abcdef", nil];
    NSLog(@"排序前:%@",array);
    NSArray *sortedArray = [array sortedArrayUsingSelector:@selector(compare:)];
    NSLog(@"排序后:%@",sortedArray);
}

#pragma mark- self selector
+ (NSArray*)personInit {
    Person *p1 = [Person personWithPersonName:@"zhan" andPersonAge:11 andPersonMoney:2121];
    Person *p2 = [Person personWithPersonName:@"lishan" andPersonAge:121 andPersonMoney:13243];
    Person *p3 = [Person personWithPersonName:@"hehe" andPersonAge:1443 andPersonMoney:1];
    Person *p4 = [Person personWithPersonName:@"haha" andPersonAge:31 andPersonMoney:0];
    Person *p5 = [Person personWithPersonName:@"HEHE" andPersonAge:31 andPersonMoney:0];
    NSArray *array = [NSArray arrayWithObjects:p1,p2,p3,p4,p5, nil];
    return array;
}

+ (void)sortArrCustom {
    [[ViewController personInit] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        Person *per = obj;
        NSLog(@"排序前：%@ ,%d ,%d",per.userName,per.age,per.money);
    }];
    NSArray *arr = [[ViewController personInit] sortedArrayUsingSelector:@selector(comparePerson:)];
    [arr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        Person *per = obj;
        NSLog(@"排序后：%@ ,%d ,%d",per.userName,per.age,per.money);
    }];
}

+ (void)sortArray3 {
    NSArray *array = [NSArray arrayWithObjects:@"1bc",@"4b6",@"123",@"789",@"3ef", nil];
    NSArray *sortedArray = [array sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        
        //这里的代码可以参照上面compare:默认的排序方法，也可以把自定义的方法写在这里，给对象排序
        NSComparisonResult result = [obj1 compare:obj2];
        return result;
    }];
    NSLog(@"排序后:%@",sortedArray);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
