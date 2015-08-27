//
//  PinterestLayout.m
//  OCUICollectionViewDemo
//
//  Created by hugo on 15-8-27.
//  Copyright (c) 2015年 hugo. All rights reserved.
//

#import "PinterestLayout.h"

@implementation PinterestLayoutAttributes

-(instancetype)init {
    self = [super init];
    if(self) {
        self.photoHeight = 0.0f;
    }
    return self;
}

- (BOOL)isEqual:(id)object {
    if([object isKindOfClass:[PinterestLayoutAttributes class]]) {
        PinterestLayoutAttributes *pin = object;
        if(self.photoHeight == pin.photoHeight) {
            return YES;
        }
    }
    return NO;
}

@end

@interface PinterestLayout ()

@property (nonatomic,assign)CGFloat width;
@property (nonatomic,assign)CGFloat contentHeight;
@property (nonatomic,strong)PinterestLayoutAttributes *cache;

@end

@implementation PinterestLayout


- (instancetype)initWithDelegate:(id)delegate {
    self = [super init];
    if(self) {
        _delegate = delegate;
        _cellPadding = 0;
        _numberOfColumns = 1;
    }
    return self;
}

- (CGFloat)width {
    UIEdgeInsets insets = self.collectionView.contentInset;
    return CGRectGetWidth(self.collectionView.bounds) - (insets.left +insets.right);
}

- (void)prepareLayout {
    _itemCount = [[self collectionView] numberOfItemsInSection:0];//item count
    
    
}

- (CGSize)collectionViewContentSize {
    return CGSizeZero;
}

@end
