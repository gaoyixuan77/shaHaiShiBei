#import "jiangLiView.h"
#import "Masonry.h"

@implementation jiangLiView

- (void)initView {
    self.backgroundColor = [UIColor orangeColor];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    [self addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10);
        make.centerX.equalTo(self.mas_centerX).offset(0);
        make.width.equalTo(@(self.bounds.size.width));
        make.height.equalTo(@50);
    }];
    titleLabel.text = @"隐藏款贝壳";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor redColor];
    
    SCNScene *scene = [SCNScene new];
    SCNView *scnView = [[SCNView alloc] init];
    [self addSubview:_scnView = scnView];
    [scnView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(10);
        make.centerX.equalTo(self.mas_centerX).offset(0);
        make.height.and.width.equalTo(@250);
    }];
    scnView.scene = scene;
    scnView.allowsCameraControl = NO;
    scnView.backgroundColor = [UIColor clearColor];
    scnView.autoenablesDefaultLighting = true;
    scnView.playing = true;
    scnView.allowsCameraControl = NO;
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"taiPingYangShall5" withExtension:@"usdz"];
    if (modelURL) {
        SCNScene *modelScene = [SCNScene sceneWithURL:modelURL options:nil error:nil];
        if (modelScene) {
            SCNNode *modelNode = [modelScene.rootNode clone];
            if (modelNode) {
                [self.scnView.scene.rootNode addChildNode:modelNode];
                modelNode.position = SCNVector3Make(0, 0, 0);
                modelNode.scale = SCNVector3Make(1.5, 1.5, 1.5);
                modelNode.rotation = SCNVector4Make(1, 0, 0, M_PI_2);
                self.modelNode = modelNode;
            }
        } else {
            NSLog(@"Error loading model scene.");
        }
    } else {
        NSLog(@"Model file not found.");
    }
    
    UILabel *yiFangRuLabel = [[UILabel alloc] init];
    [self addSubview:yiFangRuLabel];
    [yiFangRuLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(scnView.mas_bottom).offset(10);
        make.centerX.equalTo(self.mas_centerX).offset(0);
        make.height.equalTo(@50);
        make.width.equalTo(@(self.bounds.size.width));
    }];
    yiFangRuLabel.textColor = [UIColor blueColor];
    yiFangRuLabel.text = @"贝壳已放入背包";
    yiFangRuLabel.textAlignment = NSTextAlignmentCenter;
}

@end
