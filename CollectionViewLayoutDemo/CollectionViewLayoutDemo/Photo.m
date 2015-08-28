//
//  Photo.m
//  CollectionViewLayoutDemo
//
//  Created by hugo on 15-8-28.
//  Copyright (c) 2015年 hugo. All rights reserved.
//

#import "Photo.h"

@implementation Photo

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if(self) {
        self.caption = dictionary[@"Caption"];
        self.comment = dictionary[@"Comment"];
        self.photo = dictionary[@"Photo"];
        self.image = [UIImage imageNamed:self.photo];
    }
    return self;
}

+ (NSMutableArray *)allPhotos {
    NSMutableArray *photos = [[NSMutableArray alloc]init];
    NSURL *URL = [[NSBundle mainBundle] URLForResource:@"Photos" withExtension:@"plist"];
    NSArray *photoArray = [[NSArray alloc]initWithContentsOfURL:URL];
    [photoArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if([obj isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dictionary = obj;
            Photo *photo = [[Photo alloc]initWithDictionary:dictionary];
            [photos addObject:photo];
        }
    }];
    return photos;
}

@end
