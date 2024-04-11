#import "afterDaTiView.h"
#import "Masonry.h"

@implementation afterDaTiView

- (void)initView {
    self.backgroundColor = [UIColor colorWithRed:95/225.0f green:224/225.0f blue:196/225.0f alpha:1];
    
    UIImageView *gongXiImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"WechatIMG286.png"]];
    [self addSubview:gongXiImageView];
    [gongXiImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(80);
        make.centerX.equalTo(self.mas_centerX).offset(0);
        make.height.equalTo(@200);
        make.width.equalTo(@300);
    }];
    
    UILabel *label = [[UILabel alloc] init];
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(gongXiImageView.mas_bottom).offset(50);
        make.centerX.equalTo(self.mas_centerX).offset(0);
        make.height.equalTo(@50);
        make.width.equalTo(@(self.bounds.size.width));
    }];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = [NSString stringWithFormat:@"你答对了%d道题", 0]; // 示例答对的题目数量为0
    label.textColor = [UIColor blueColor];
    label.alpha = 0.5;
    label.font = [UIFont systemFontOfSize:50];
    
    
    SCNScene *scene = [SCNScene new];
    SCNView *scnView = [[SCNView alloc] init];
    [self addSubview:_scnView = scnView];
    [scnView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom).offset(50);
        make.centerX.equalTo(self.mas_centerX).offset(0);
        make.height.and.width.equalTo(@250);
    }];
    scnView.scene = scene;
    scnView.allowsCameraControl = NO;
    scnView.backgroundColor = [UIColor clearColor];
    scnView.autoenablesDefaultLighting = true;
    scnView.playing = true;
    scnView.allowsCameraControl = NO;
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"b57e3f301708_4d81a1ac72d1_sea_treasure_chest_" withExtension:@"usdz"];
    if (modelURL) {
        SCNScene *modelScene = [SCNScene sceneWithURL:modelURL options:nil error:nil];
        if (modelScene) {
            SCNNode *modelNode = [modelScene.rootNode clone];
            if (modelNode) {
                [scene.rootNode addChildNode:modelNode];
                modelNode.position = SCNVector3Make(0, 0, 0);
                modelNode.scale = SCNVector3Make(1, 1, 1);
                modelNode.eulerAngles = SCNVector3Make(-(2 * M_PI_2), -M_PI_2, M_PI_2);
            }
        } else {
            NSLog(@"Failed to load model scene.");
        }
    } else {
        NSLog(@"Model file not found.");
    }
    
    UILabel *dianJiLabel = [[UILabel alloc] init];
    [self addSubview:dianJiLabel];
    [dianJiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(scnView.mas_bottom).offset(20);
        make.centerX.equalTo(self.mas_centerX).offset(0);
        make.height.equalTo(@20);
        make.width.equalTo(@(self.bounds.size.width));
    }];
    dianJiLabel.textAlignment = NSTextAlignmentCenter;
    dianJiLabel.text = @"点击宝箱领取你的奖励"; // 示例答对的题目数量为0
    dianJiLabel.textColor = [UIColor blueColor];
    dianJiLabel.alpha = 0.5;
    dianJiLabel.font = [UIFont systemFontOfSize:20];
}

@end
