//
//  Person.m
//  SortArrayDemo
//
//  Created by hugo on 15-8-23.
//  Copyright (c) 2015年 hugo. All rights reserved.
//

#import "Person.h"

@interface Person ()

@end

@implementation Person

+ (Person*)personWithPersonName:(NSString*)userName andPersonAge:(int)age andPersonMoney:(int)money {
    Person *per = [[Person alloc]init];
    per.userName = userName;
    per.age = age;
    per.money = money;
    return per;
}

//自定义排序方法
-(NSComparisonResult)comparePerson:(Person *)person {
    //默认按年龄排序
    NSComparisonResult result = [[NSNumber numberWithInt:person.age] compare:[NSNumber numberWithInt:self.age]];//注意:基本数据类型要进行数据转换
    //如果年龄一样，就按照名字排序
    if (result == NSOrderedSame) {
        result = [self.userName compare:person.userName];
    }
    return result;
}


@end
