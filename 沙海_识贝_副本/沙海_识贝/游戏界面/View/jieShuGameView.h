//
//  jieShuGameView.h
//  沙海_识贝
//
//  Created by Eleven on 2024/4/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface jieShuGameView : UIView

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *fanHuiButton;
- (void)initView;
@end

NS_ASSUME_NONNULL_END
