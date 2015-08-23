//
//  Article.h
//  StudyAPIDemo
//
//  Created by hugo on 15-8-23.
//  Copyright (c) 2015年 hugo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Article : NSObject

@property (nonatomic,strong) NSMutableArray *articles;
@property (nonatomic,strong) NSMutableArray *top_stories;
@property (nonatomic,strong) NSMutableArray *marketings;
@property (nonatomic,copy) NSString *display_date;
@property (nonatomic,copy) NSString *date;
@property (nonatomic,assign) BOOL is_today;

@end
