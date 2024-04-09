//
//  shallTuJianViewController.m
//  沙海_识贝
//
//  Created by Eleven on 2024/4/9.
//

#import "shallTuJianViewController.h"
#import "CollectionViewCell.h"
#import "shallXiangQingViewController.h"

@interface shallTuJianViewController ()

@end

@implementation shallTuJianViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 创建流水布局
    UICollectionViewFlowLayout* flowLayOut = [[UICollectionViewFlowLayout alloc] init];

    //设置布局方向
    flowLayOut.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayOut.minimumLineSpacing = 10;  //行间距
    flowLayOut.minimumInteritemSpacing = 10;  //列间距

    //设置每个item的尺寸
    flowLayOut.itemSize = CGSizeMake(self.view.bounds.size.width / 2, 800);

    // 创建UICollectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayOut];
    collectionView.backgroundColor = [UIColor colorWithRed:0/225.0 green:113/225.0 blue:93/225.0 alpha:1.0];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    
    // 注册UICollectionViewCell
    [collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];

    // 添加UICollectionView到视图层级
    [self.view addSubview:collectionView];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[collectionView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(collectionView)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[collectionView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(collectionView)]];
    
    self.collectionView = collectionView;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1; // 根据实际数据源返回分区数量
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    // 返回该分区下的item数量，根据实际数据源设定
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    NSArray *urlArr = @[@"ed5949eecae6_6b5cc46c1687_ancient_chinese_por", @"f8007b8104c1_3cf60cd02ab1_ancient_chinese_por", @"73f13e877866_2ba81b96c3da_Ancient_Chinese_Chi", @"0b8590524fb5_0d47957322a2_ancient_chinese_por", @"58d6d5056d97_8e5e957a5c5d_ancient_chinese_por", @"4d6ee1f9b52d_591e109e4191_ancient_chinese_por"];
    NSArray *titArr = @[@"瓷罐", @"青花瓷盘", @"鸡头壶", @"瓷制碗", @"胖胖壶", @"长形壶"];
    cell.modelURLStr = urlArr[indexPath.row];
    cell.label.text = titArr[indexPath.item];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 1) {
        shallXiangQingViewController *aa = [[shallXiangQingViewController alloc] init];
        [self.navigationController pushViewController:aa animated:YES];
    }
}

// 如果需要瀑布流布局，还需要实现以下代理方法
#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = (collectionView.frame.size.width - 20) / 2.0; // 假设一行3列
    return CGSizeMake(width, 270); // 根据需求返回单元格大小
}

@end
