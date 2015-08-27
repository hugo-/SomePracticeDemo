//
//  MainViewController.h
//  UICollectionViewDemo
//
//  Created by Visitor on 14-10-17.
//  Copyright (c) 2014年 Visitor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCollectionViewLayout.h"
@interface MainViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,MyCollectionViewLayoutDelegete>
@property(nonatomic,strong)NSMutableArray *cellHeights;

@end
