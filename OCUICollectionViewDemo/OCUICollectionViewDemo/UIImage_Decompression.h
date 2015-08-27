//
//  UIImage_Decompression.h
//  OCUICollectionViewDemo
//
//  Created by hugo on 15-8-27.
//  Copyright (c) 2015年 hugo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage ()

@property (nonatomic,strong) UIImage *decommpressionImage;

@end

@implementation UIImage

-(UIImage *)decommpressionImage {
    UIGraphicsBeginImageContextWithOptions(self.size, YES, 0);
    [self drawInRect:CGRectZero];
    _decommpressionImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return _decommpressionImage;
}

@end