//
//  Article.m
//  StudyAPIDemo
//
//  Created by hugo on 15-8-23.
//  Copyright (c) 2015年 hugo. All rights reserved.
//

#import "Article.h"

@implementation Article


-(id)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if(self)
    {
        _articles = dict[@"articles"]!= [NSNull null] ? dict[@"articles"] :nil;
        _date = dict[@"date"] != [NSNull null] ? dict[@"articles"] : @"";
        _display_date = dict[@"display_date"]!= [NSNull null] ? dict[@"display_date"] :nil;
        _is_today = dict[@"is_today"]!= [NSNull null] ? [dict[@"is_today"] boolValue] :0;
        _marketings = dict[@"marketings"]!= [NSNull null] ? dict[@"marketings"] :nil;
        _top_stories = dict[@"top_stories"]!= [NSNull null] ? dict[@"top_stories"] :nil;
    }
    return self;
}

@end
