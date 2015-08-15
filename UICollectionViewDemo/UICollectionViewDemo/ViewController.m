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

@property(nonatomic,assign)NSInteger cellCount;

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
    
    _cellCount = 20;
    
    _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:circle];
    _collectionView.delegate =self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:_collectionView];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CELL"];
    
    UITapGestureRecognizer* tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [_collectionView addGestureRecognizer:tapRecognizer];
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

- (void)handleTapGesture:(UITapGestureRecognizer *)sender {
    
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        CGPoint initialPinchPoint = [sender locationInView:_collectionView];
        NSIndexPath* tappedCellPath = [_collectionView indexPathForItemAtPoint:initialPinchPoint];
        if (tappedCellPath!=nil)
        {
            self.cellCount = self.cellCount - 1;
            [_collectionView performBatchUpdates:^{
                [_collectionView deleteItemsAtIndexPaths:@[tappedCellPath]];
                
            } completion:nil];
        }
        else
        {
            self.cellCount = self.cellCount + 1;
            [_collectionView performBatchUpdates:^{
                [_collectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:0 inSection:0]]];
            } completion:nil];
        }
    }
}

#pragma mark- dataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _cellCount;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    cell.backgroundColor = [self randColor];
    cell.layer.cornerRadius = cell.frame.size.height/2;
    UILabel *lable = [[UILabel alloc]initWithFrame:cell.bounds];
    lable.text = @"麻花是傻逼";
    lable.adjustsFontSizeToFitWidth =YES;
    [cell addSubview:lable];
    return cell;
}

-(UIColor*)randColor
{
    int a =arc4random()%7;
    UIColor *co = [UIColor redColor];
    switch (a) {
        case 0:
        {
            return co;
        }
            break;
            case 1:
        {
            co = [UIColor orangeColor];
        }
            break;
            case 2:
        {
            co = [UIColor yellowColor];
        }
            break;
            case 3:
        {
            co = [UIColor greenColor];
        }
            break;
            case 4:
        {
            co = [UIColor cyanColor];
        }
            break;
            case 5:
        {
            co = [UIColor blueColor];
        }
            break;
            case 6:
        {
            co = [UIColor purpleColor];
        }
            break;
        default:
            break;
    }
    return co;
}

#pragma mark- delegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(70,70);
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
