//
//  shouYeView.h
//  沙海_识贝
//
//  Created by Eleven on 2024/4/9.
//

#import <UIKit/UIKit.h>
#import "SceneKit/SceneKit.h"

NS_ASSUME_NONNULL_BEGIN

@interface shouYeView : UIView
@property (nonatomic, weak) SCNView  *scnView;
@property (nonatomic, strong) SCNNode *modelNode;
@property (nonatomic, strong) NSString *modelURLStr;
@property (nonatomic, strong) UIScrollView *scrollView;
-(void) initView;
@end

NS_ASSUME_NONNULL_END
