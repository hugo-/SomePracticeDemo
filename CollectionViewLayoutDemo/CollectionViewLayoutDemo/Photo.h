//
//  Photo.h
//  CollectionViewLayoutDemo
//
//  Created by hugo on 15-8-28.
//  Copyright (c) 2015年 hugo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Photo : NSObject

@property(nonatomic,strong) NSString *caption;
@property(nonatomic,strong) NSString *comment;
@property(nonatomic,strong) NSString *photo;
@property(nonatomic,strong) UIImage *image;

+ (NSMutableArray *)allPhotos;

@end
