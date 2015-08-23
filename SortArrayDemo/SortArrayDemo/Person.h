//
//  Person.h
//  SortArrayDemo
//
//  Created by hugo on 15-8-23.
//  Copyright (c) 2015年 hugo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic,strong) NSString *userName;
@property (nonatomic,assign) int age;
@property (nonatomic,assign) int money;

+ (Person*)personWithPersonName:(NSString*)userName andPersonAge:(int)age andPersonMoney:(int)money;
-(NSComparisonResult)comparePerson:(Person *)person;

@end
