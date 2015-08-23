//
//  ApiRoot.m
//  StudyAPIDemo
//
//  Created by hugo on 15-8-23.
//  Copyright (c) 2015年 hugo. All rights reserved.
//

#import "ApiRoot.h"
#import "ApiCommand.h"

@interface ApiRoot ()

@property (nonatomic,strong) NSMutableDictionary *listenerCallbacks;
@property (nonatomic,strong) NSMutableDictionary *commandCallbacks;

@end

@implementation ApiRoot

static ApiRoot *_apiRoot = nil;

+ (ApiRoot*)shareAPIManager {
    if(_apiRoot == nil)
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _apiRoot = [[ApiRoot alloc]init];
        });
    }
    return _apiRoot;
}

- (instancetype)init {
    self =  [super init];
    if(self) {
        _listenerCallbacks = [[NSMutableDictionary alloc]init];
        _commandCallbacks = [[NSMutableDictionary alloc]init];
    }
    return self;
}

- (void)readDataWithCommand:(NSString *)command {
    CommandCallback cb = _commandCallbacks[command];
    if (cb) {
        cb(command);
    }
}

- (void)registerCommand:(NSString *)commandID callback:(CommandCallback)callback {
    _commandCallbacks[commandID] = callback;
}

- (void)apiCommand {
    ApiCommand *command = [[ApiCommand alloc]init];
    [command getData];
}

- (NSInteger)addListenerWithCallback:(ListenerCallback)callback {
    return [self addListenerWithCallback:callback topic:nil];
}

- (NSInteger)addListenerWithCallback:(ListenerCallback)callback topic:(NSString *)topic {
    if (topic == nil) {
        topic = @"public";
    }
    _listenerCallbacks[@(0)] = callback;
    
    return 0;
}

- (void)sendData:(Model*)data {
    ListenerCallback caleback = _listenerCallbacks[@(0)];
    if(caleback) {
        caleback(data);
    }
    
}

@end
