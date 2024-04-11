//
//  jiangLiView.h
//  沙海_识贝
//
//  Created by Eleven on 2024/4/10.
//

#import <UIKit/UIKit.h>
#import <SceneKit/SceneKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface jiangLiView : UIView
@property (nonatomic, weak) SCNView  *scnView;
@property (nonatomic, strong) SCNNode *modelNode;

- (void) initView;

@end

NS_ASSUME_NONNULL_END
