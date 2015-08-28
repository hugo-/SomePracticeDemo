//
//  CollectionViewCell.h
//  CollectionViewLayoutDemo
//
//  Created by hugo on 15-8-28.
//  Copyright (c) 2015年 hugo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;

@end
