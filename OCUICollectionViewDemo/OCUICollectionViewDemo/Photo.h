//
//  Photo.h
//  OCUICollectionViewDemo
//
//  Created by hugo on 15-8-27.
//  Copyright (c) 2015年 hugo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Photo : NSObject

@property (nonatomic,strong) NSString *caption;
@property (nonatomic,strong) NSString *comment;
@property (nonatomic,strong) NSString *photo;
@property (nonatomic,retain) UIImage *image;

- (NSMutableArray *)allPhotos;

@end
