//
//  MainViewController.m
//  UICollectionViewDemo
//
//  Created by Visitor on 14-10-17.
//  Copyright (c) 2014年 Visitor. All rights reserved.
//

#import "MainViewController.h"
#import "Photo.h"
#import "CollectionViewCell.h"

#define CELL_WIDTH 150
#define CELL_COUNT 30
#define CELL_IDENTIFIER @"WaterfallCell"



@interface MainViewController ()

@end

@implementation MainViewController
{
    UICollectionView *_collectionView;
    NSMutableArray *_dataArray;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    MyCollectionViewLayout *myLayout = [[MyCollectionViewLayout alloc] init];
    myLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    myLayout.delegate = self;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:myLayout];
    _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [_collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:CELL_IDENTIFIER];
    [self.view addSubview:_collectionView];
}


- (void)updateLayout
{
    MyCollectionViewLayout *layout = (MyCollectionViewLayout *)_collectionView.collectionViewLayout;
    layout.columnCount = _collectionView.bounds.size.width / CELL_WIDTH;
    layout.itemWidth = CELL_WIDTH;
}

#pragma mark - UICollectionViewWaterfallLayoutDelegate

- (NSMutableArray *)cellHeights
{
    if (!_cellHeights)
    {
        _cellHeights = [NSMutableArray arrayWithCapacity:CELL_COUNT];
        for (NSInteger i = 0; i < CELL_COUNT; i++) {
            _cellHeights[i] = @(arc4random()%100*2+100);
        }
    }
    return _cellHeights;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(MyCollectionViewLayout *)collectionViewLayout
 heightForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.cellHeights[indexPath.item] floatValue];
}






#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [[Photo allPhotos] count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
   CollectionViewCell *cell  = (CollectionViewCell*)[_collectionView dequeueReusableCellWithReuseIdentifier:CELL_IDENTIFIER forIndexPath:indexPath];
    
    Photo *photo = [[Photo allPhotos] objectAtIndex:indexPath.item];
    [cell.headImageView setImage:photo.image];
    cell.commentLabel.text = photo.comment;
    return cell;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
