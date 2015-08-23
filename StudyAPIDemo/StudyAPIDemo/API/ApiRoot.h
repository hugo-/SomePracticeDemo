//
//  ApiRoot.h
//  StudyAPIDemo
//
//  Created by hugo on 15-8-23.
//  Copyright (c) 2015年 hugo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Model.h"

@interface ApiRoot : NSObject

typedef id(^CommandCallback)(NSString *command);
typedef void(^ListenerCallback)(Model *event);

+ (ApiRoot*)shareAPIManager;
- (void)apiCommand;

- (void)readDataWithCommand:(NSString *)command;
- (void)registerCommand:(NSString *)commandID callback:(CommandCallback)callback;

- (void)sendData:(Model*)data;
- (NSInteger)addListenerWithCallback:(ListenerCallback)callback;

@end
