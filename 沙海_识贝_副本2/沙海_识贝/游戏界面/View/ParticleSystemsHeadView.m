#import "ParticleSystemsHeadView.h"

@interface ParticleSystemsHeadView ()

@property (nonatomic, weak) UILabel *lifeLable;
@property (nonatomic, weak) UILabel *clickNumLabel;
@property (nonatomic, weak) UILabel *pangXieLabel;

@end

@implementation ParticleSystemsHeadView

+ (instancetype)headVeiw{
    
    ParticleSystemsHeadView *headView = [[ParticleSystemsHeadView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 164)];
    
    
    headView.lifeNum = 3; // 一开始默认3条命
    NSArray *title = @[[NSString stringWithFormat:@"❤️%ld",(long)headView.lifeNum],@"🦀️0000",@"🐚0000"];
    NSInteger row = title.count;
    CGFloat W = headView.bounds.size.width / row;
    
    for (int i = 0; i < row; i++) {
        
        UILabel *label = [UILabel new];
        label.text = title[i];
        label.font = [UIFont systemFontOfSize:28];
        label.textColor = [UIColor whiteColor];
        
        label.frame = CGRectMake(i * W, 0, W, headView.bounds.size.height);
        label.textAlignment = NSTextAlignmentCenter;
        
        [headView addSubview:(i == 0)? headView.lifeLable = label : ((i == 1)? (headView.pangXieLabel = label) : (headView.clickNumLabel = label))];
    }
    
    
    __weak typeof(headView) weakHeadView = headView;
    headView.headViewDateBlock = ^(NSInteger lifenNum,NSInteger clickNodeNum, NSInteger pangXieNum){
        
        weakHeadView.lifeLable.text = [NSString stringWithFormat:@"❤️%ld",(long)lifenNum];
        weakHeadView.clickNumLabel.text = [NSString stringWithFormat:@"🐚%@",[weakHeadView delewithClickNum:clickNodeNum]];
        weakHeadView.pangXieLabel.text = [NSString stringWithFormat:@"🦀️%@",[weakHeadView delewithClickNum:pangXieNum]];
    };
    
    
    return headView;
}

- (void)setLifeNum:(NSInteger)lifeNum{
    
    _lifeNum = lifeNum;
    
    if (self.headViewDateBlock) {
        self.headViewDateBlock(lifeNum,_clickNodeNum,_pangXieNum);
    }
}

- (void)setClickNodeNum:(NSInteger)clickNodeNum{
    
    _clickNodeNum = clickNodeNum;
    
    if (self.headViewDateBlock) {
        self.headViewDateBlock(_lifeNum,clickNodeNum, _pangXieNum);
    }
}

- (void) setPangXieNum:(NSInteger)pangXieNum {
    
    _pangXieNum = pangXieNum;
    if (self.headViewDateBlock) {
        self.headViewDateBlock(_lifeNum,_clickNodeNum, _pangXieNum);
    }
}


- (NSString *)delewithClickNum:(NSInteger )clickNum{
    
    
    if (clickNum < 10) {
        
        return [NSString stringWithFormat:@"000%ld",(long)clickNum];
    }else if (clickNum < 100){
        
        return [NSString stringWithFormat:@"00%ld",(long)clickNum];
    }else if (clickNum < 1000){
        
        return [NSString stringWithFormat:@"0%ld",(long)clickNum];
    }else{
        
        return [NSString stringWithFormat:@"%ld",(long)clickNum];
    }
    
    
}


@end
