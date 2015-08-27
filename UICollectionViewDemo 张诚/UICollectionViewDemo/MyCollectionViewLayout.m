//
//  MyCollectionViewLayout.m
//  UICollectionViewDemo
//
//  Created by Visitor on 14-10-17.
//  Copyright (c) 2014年 Visitor. All rights reserved.

//

#import "MyCollectionViewLayout.h"

#define COLUMNCOUNT 4
#define ITEMWIDTH 70.0f

@implementation MyCollectionViewLayout


- (id)init
{
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    _columnCount = COLUMNCOUNT;
    _itemWidth = ITEMWIDTH;
    _sectionInset = UIEdgeInsetsZero;
}


- (void)prepareLayout
{
    [super prepareLayout];
    _itemCount = [[self collectionView] numberOfItemsInSection:0];
   
    CGFloat width = self.collectionView.frame.size.width - _sectionInset.left - _sectionInset.right;
    
    _interitemSpacing = floorf((width - _columnCount * _itemWidth) / (_columnCount - 1));
    
    _itemAttributes = [NSMutableArray arrayWithCapacity:_itemCount];
    _columnHeights = [NSMutableArray arrayWithCapacity:_columnCount];
    
    for (NSInteger idx = 0; idx < _columnCount; idx++)
    {
        NSLog(@"sectionInset.top = %f",_sectionInset.top);
        [_columnHeights addObject:@(_sectionInset.top)];
    }
    
    for (NSInteger idx = 0; idx < _itemCount; idx++)
    {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:idx inSection:0];
        CGFloat itemHeight = [_delegate collectionView:self.collectionView layout:self heightForItemAtIndexPath:indexPath];
  
        
        NSUInteger columnIndex = [self shortestColumnIndex];
        CGFloat xOffset = _sectionInset.left + (_itemWidth + _interitemSpacing) * columnIndex;
        CGFloat yOffset = [(_columnHeights[columnIndex]) floatValue];
        
        UICollectionViewLayoutAttributes *attributes =
        [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        attributes.frame = CGRectMake(xOffset, yOffset, self.itemWidth, itemHeight);
        [_itemAttributes addObject:attributes];
        _columnHeights[columnIndex] = @(yOffset + itemHeight + _interitemSpacing);
    }
    
    
}

- (CGSize)collectionViewContentSize
{
    if (self.itemCount == 0)
    {
        return CGSizeZero;
    }
    
    CGSize contentSize = self.collectionView.frame.size;
    NSUInteger columnIndex = [self longestColumnIndex];
    
    CGFloat height = [self.columnHeights[columnIndex] floatValue];
    contentSize.height = height - self.interitemSpacing + self.sectionInset.bottom;
    return contentSize;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)path
{
    return _itemAttributes[path.item];
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return [_itemAttributes filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(UICollectionViewLayoutAttributes *evaluatedObject, NSDictionary *bindings) {
        return CGRectIntersectsRect(rect, [evaluatedObject frame]);
    }]];
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return NO;
}












#pragma mark - Private Methods
- (NSUInteger)shortestColumnIndex
{
    __block NSUInteger index = 0;
    __block CGFloat shortestHeight = MAXFLOAT;
    
    [self.columnHeights enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        CGFloat height = [obj floatValue];
        if (height < shortestHeight) {
            shortestHeight = height;
            index = idx;
        }
    }];
    return index;
}

- (NSUInteger)longestColumnIndex
{
    __block NSUInteger index = 0;
    __block CGFloat longestHeight = 0;
    
    [self.columnHeights enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        CGFloat height = [obj floatValue];
        if (height > longestHeight) {
            longestHeight = height;
            index = idx;
        }
    }];
    return index;
}

@end
