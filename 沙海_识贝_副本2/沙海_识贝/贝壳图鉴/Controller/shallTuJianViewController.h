//
//  shallTuJianViewController.h
//  沙海_识贝
//
//  Created by Eleven on 2024/4/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface shallTuJianViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, assign) BOOL isShouYe;

@end

NS_ASSUME_NONNULL_END
