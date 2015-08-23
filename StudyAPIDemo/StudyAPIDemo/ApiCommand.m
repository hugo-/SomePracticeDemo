//
//  ApiCommand.m
//  StudyAPIDemo
//
//  Created by hugo on 15-8-23.
//  Copyright (c) 2015年 hugo. All rights reserved.
//

#import "ApiCommand.h"
#import "ApiRoot.h"
#import "AFHTTPRequestOperationManager.h"
#import "Model.h"
#import "Article.h"

#define kAPI @"http://ribao.ibaozou.com/api/v1/articles/latest"

@implementation ApiCommand

- (instancetype)init {
    self =  [super init];
    if(self) {
    }
    return self;
}

- (void)getData {
    [[ApiRoot shareAPIManager] registerCommand:@"HOMEDATA" callback:^id(NSString *command) {
        [self requestData:command];
        return nil;
    }];
}

- (void)requestData:(NSString *)command {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:kAPI parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        Model *model  = [[Model alloc]init];
        model.data = responseObject;
        [[ApiRoot shareAPIManager] sendData:model];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"JSON: %@", error);
    }];
}
@end
