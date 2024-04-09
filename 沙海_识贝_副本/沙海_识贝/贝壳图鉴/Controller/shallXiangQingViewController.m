//
//  shallXiangQingViewController.m
//  沙海_识贝
//
//  Created by Eleven on 2024/4/9.
//

#import "shallXiangQingViewController.h"
#import <SceneKit/SceneKit.h>

@interface shallXiangQingViewController ()<SCNSceneRendererDelegate>

@property (nonatomic, weak) SCNView  *scnView;
@property (nonatomic, strong) SCNNode *modelNode;

@end

@implementation shallXiangQingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, self.view.bounds.size.width, 200)];
    label.text = @"青花瓷盘";
    label.font = [UIFont systemFontOfSize:80];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    
    // 1. 创建一个维度空间
    SCNScene *scene = [SCNScene new];
    // 2. 创建一个承载维度的平台
    SCNView *scnView = [[SCNView alloc] initWithFrame:self.view.bounds];
    scnView.scene = scene;
    [scnView addSubview:label];
    
    //scnView.showsStatistics = true; //显示帧率
    scnView.allowsCameraControl = true;
    scnView.autoenablesDefaultLighting = true;
    [self.view addSubview:_scnView = scnView];
    scnView.delegate = self;
    scnView.playing = true;
    scnView.backgroundColor = [UIColor colorWithRed:0/225.0f green:55/225.0f blue:51/225.0f alpha:1];
    // 3. 加载模型文件
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"f8007b8104c1_3cf60cd02ab1_ancient_chinese_por" withExtension:@"usdz"];
    if (modelURL) {
        SCNScene *modelScene = [SCNScene sceneWithURL:modelURL options:nil error:nil];
        if (modelScene) {
            // 4. 创建模型节点
            SCNNode *modelNode = [modelScene.rootNode clone];
            if (modelNode) {
                // 5. 将模型节点添加到场景的根节点上
                [scene.rootNode addChildNode:modelNode];
                // 6. 调整模型节点的位置、缩放等属性
                modelNode.position = SCNVector3Make(0, 0, 0); // 示例位置
                modelNode.scale = SCNVector3Make(1, 1, 1); // 示例缩放
                modelNode.rotation = SCNVector4Make(-1, 0, 0, M_PI_2);
                self.modelNode = modelNode;
            }
        } else {
            NSLog(@"Failed to load model scene from URL: %@", modelURL);
        }
    } else {
        NSLog(@"Model file not found.");
    }
    SCNNode *cameraNode = [SCNNode node];
    cameraNode.camera = [SCNCamera camera];
    cameraNode.position = SCNVector3Make(0, 0, 3); // 设置相机节点的位置
    [scene.rootNode addChildNode:cameraNode]; // 将相机节点添加到场景的根节点上
    
    // 创建一个绕Y轴旋转90度的动画
    SCNAction *rotationAction = [SCNAction rotateByX:0 y:M_PI_2 z:0 duration:2]; // 在1秒内绕Y轴旋转90度

    // 创建一个无限循环的动画序列
    SCNAction *repeatAction = [SCNAction repeatActionForever:rotationAction];

    // 将动画应用到模型节点上
    [self.modelNode runAction:repeatAction];
    
    // 创建带有圆角的 UIView
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 600, self.view.bounds.size.width, 352)];
    view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    view.layer.cornerRadius = 40.0; // 设置您想要的圆角半径，例如10个点

    // 创建 UILabel 并设置其属性
    UILabel *ALabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.view.bounds.size.width - 20, 232)];
    ALabel.numberOfLines = 0;
    ALabel.text = @"青花瓷是中国传统陶瓷工艺的一种，以白色高岭土为原料，经过高温烧制而成，其特点是表面有蓝色的花纹装饰。这种瓷器在中国历史上有着重要的地位，并且在国际上也享有很高的声誉。这个瓷盘采用了典型的青花图案设计，包括花卉、动物或者人物等元素。这些图案通常具有吉祥寓意或者历史故事背景，反映了当时社会文化风貌和审美情趣。";
    ALabel.textColor = [UIColor grayColor];
    ALabel.font = [UIFont systemFontOfSize:18];

    // 将 UILabel 添加到 view 中
    [view addSubview:ALabel];

    // 将 view 添加到 scnView 中
    [scnView addSubview:view];

}

@end
