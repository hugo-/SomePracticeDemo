//
//  PinterestLayout.h
//  OCUICollectionViewDemo
//
//  Created by hugo on 15-8-27.
//  Copyright (c) 2015年 hugo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PinterestLayoutDelegate <NSObject>

- (CGFloat)collectionView:(UICollectionView *)collectionView heightForPhotoAtIndexPath:(NSIndexPath *)indexPath WithWidth:(CGFloat)width;
- (CGFloat)collectionView:(UICollectionView *)collectionView heightForAnnotationAtIndexPath:(NSIndexPath *)indexPath WithWidth:(CGFloat)width;

@end

@interface PinterestLayout : UICollectionViewFlowLayout

@property (nonatomic,assign)CGFloat cellPadding;
@property (nonatomic,assign)NSInteger numberOfColumns;
@property (nonatomic,retain)id <PinterestLayoutDelegate>delegate;
@property (nonatomic,assign) NSInteger itemCount;

@end


@interface PinterestLayoutAttributes : UICollectionViewLayoutAttributes

@property (nonatomic,assign)CGFloat photoHeight;

@end