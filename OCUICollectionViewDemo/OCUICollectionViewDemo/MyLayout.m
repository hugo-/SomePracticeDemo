//
//  MyLayout.m
//  OCUICollectionViewDemo
//
//  Created by hugo on 15-8-27.
//  Copyright (c) 2015年 hugo. All rights reserved.
//

#import "MyLayout.h"

@interface MyLayout ()

@property (nonatomic,strong) NSMutableArray *itemArr;

@end

@implementation MyLayout


- (void)prepareLayout {
    _itemArr = [[NSMutableArray alloc]init];
    
    int itemCount = [[self collectionView] numberOfItemsInSection:0];
    
    for (NSInteger idx = 0; idx < itemCount; idx++)
    {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:idx inSection:0];
        UICollectionViewLayoutAttributes *attributes =
        [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        attributes.frame = CGRectMake(20 *idx, 30*idx,50,50);
        [_itemArr addObject:attributes];
    }
}

- (CGSize)collectionViewContentSize {
   int itemCount = [[self collectionView] numberOfItemsInSection:0];
    return CGSizeMake(70*itemCount, 80*itemCount);
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    return _itemArr[indexPath.item];
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    return [_itemArr filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(UICollectionViewLayoutAttributes *evaluatedObject, NSDictionary *bindings) {
        return CGRectIntersectsRect(rect, [evaluatedObject frame]);
    }]];
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return NO;
}

@end
