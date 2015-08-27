//
//  MyCollectionViewLayout.h
//  UICollectionViewDemo
//
//  Created by Visitor on 14-10-17.
//  Copyright (c) 2014年 Visitor. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyCollectionViewLayout;
@protocol MyCollectionViewLayoutDelegete <UICollectionViewDelegate>
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(MyCollectionViewLayout *)collectionViewLayout heightForItemAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface MyCollectionViewLayout : UICollectionViewLayout
@property (nonatomic,assign) NSUInteger columnCount;
@property (nonatomic,assign) CGFloat itemWidth;
@property (nonatomic,assign) UIEdgeInsets sectionInset;

@property (nonatomic,weak)__weak id<MyCollectionViewLayoutDelegete> delegate;

@property (nonatomic,assign) NSInteger itemCount;
@property (nonatomic,assign) CGFloat interitemSpacing;
@property (nonatomic,strong) NSMutableArray *columnHeights; // height for each column
@property (nonatomic,strong) NSMutableArray *itemAttributes; // attributes for each item
@end
