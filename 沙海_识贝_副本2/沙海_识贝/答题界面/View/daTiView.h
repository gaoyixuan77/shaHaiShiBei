//
//  daTiView.h
//  沙海_识贝
//
//  Created by Eleven on 2024/4/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface daTiView : UIView<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIScrollView *ScrollView;
@property (nonatomic, strong) UIButton *backButton;

@property (nonatomic, copy) NSArray *questionArray;
@property (nonatomic, copy) NSArray *answerArray;

-(void) initview;

@end

NS_ASSUME_NONNULL_END
