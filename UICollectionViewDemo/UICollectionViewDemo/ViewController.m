//
//  ViewController.m
//  UICollectionViewDemo
//
//  Created by hugo on 15-8-14.
//  Copyright (c) 2015年 hugo. All rights reserved.
//

#import "ViewController.h"
#import "CircleLayout.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

@implementation ViewController
{
    UICollectionView *_collectionView;
    NSMutableArray *_dataArr;
    UICollectionViewFlowLayout *defalutLayout;
    CircleLayout *circle;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"UICollectionViewDemo";
    self.view.backgroundColor = [UIColor whiteColor];
    [self buildUI];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)buildUI
{
    defalutLayout = [[UICollectionViewFlowLayout alloc]init];
    defalutLayout.minimumInteritemSpacing = 10;//每一行之间item的距离
    defalutLayout.minimumLineSpacing = 30;//每一列之间的距离
    defalutLayout.itemSize = CGSizeMake(80, 80);
    
    circle = [[CircleLayout alloc]init];
    
    _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:circle];
    _collectionView.delegate =self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor yellowColor];
    _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:_collectionView];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CELL"];
}

-(void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    if(editing)
    {
        [_collectionView setCollectionViewLayout:defalutLayout animated:YES];
    }
    else
    {
        [_collectionView setCollectionViewLayout:circle animated:YES];
    }
}

#pragma mark- dataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}


#pragma mark- delegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row ==8 ||indexPath.row ==1)
    {
        return CGSizeMake(120, 120);
    }
    return CGSizeMake(80, 80);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
