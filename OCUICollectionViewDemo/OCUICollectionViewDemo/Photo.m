//
//  Photo.m
//  OCUICollectionViewDemo
//
//  Created by hugo on 15-8-27.
//  Copyright (c) 2015年 hugo. All rights reserved.
//

#import "Photo.h"
#import "UIImage_Decompression.h"

@implementation Photo

- (NSMutableArray *)allPhotos {
    NSMutableArray *photos = [[NSMutableArray alloc]init];
    NSURL *URL = [[NSBundle mainBundle] URLForResource:@"Photos" withExtension:@"plist"];
    NSArray *photosFromPlist = [[NSArray alloc]initWithContentsOfURL:URL];
    [photosFromPlist enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if([obj isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dictionary = obj;
            [photos addObject:[self initPhotoWithDictionary:dictionary]];
        }
    }];
    return nil;
}

- (Photo *)initPhotoWithDictionary:(NSDictionary *)dictionary {
    Photo *photo = [[Photo alloc]init];
    photo.caption = dictionary[@"Caption"];
    photo.comment = dictionary[@"Comment"];
    photo.photo = dictionary[@"Photo"];
    photo.image = [UIImage imageNamed:photo.photo].decommpressionImage;
    return photo;
}

@end
