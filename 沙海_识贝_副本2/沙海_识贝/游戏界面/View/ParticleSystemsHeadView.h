#import <UIKit/UIKit.h>

@interface ParticleSystemsHeadView : UIView

@property (nonatomic, copy) void(^headViewDateBlock)(NSInteger lifenNum,NSInteger clickNodeNun, NSInteger pangXieNum);

@property (nonatomic, assign) NSInteger lifeNum;
@property (nonatomic, assign) NSInteger clickNodeNum;
@property (nonatomic, assign) NSInteger pangXieNum;

+ (instancetype)headVeiw;

@end
