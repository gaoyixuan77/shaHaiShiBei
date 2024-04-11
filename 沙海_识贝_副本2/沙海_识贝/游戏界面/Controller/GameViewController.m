//
//  GameViewController.m
//  沙海_识贝
//
//  Created by Eleven on 2024/4/9.
//

#import "GameViewController.h"
#import <SceneKit/SceneKit.h>
#import "ParticleSystemsHeadView.h"
#import "jieShuGameViewController.h"
#import "FMDBModel.h"

/** 颜色相关 */
#define SC_RGBColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)] // RGB
/** 随机颜色 */
#define SC_RandomlyColor SC_RGBColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), 1)


@interface GameViewController ()<SCNSceneRendererDelegate>

@property (nonatomic, weak) SCNScene *scene;
@property (nonatomic, weak) SCNView  *scnView;
@property (nonatomic, assign) NSTimeInterval timeInterval;

@property (nonatomic, weak) ParticleSystemsHeadView *headView;
@property (nonatomic, strong) UILabel *daoJIShilabel;
@property (nonatomic, strong) NSTimer *startTimer;
@property (nonatomic, strong) NSTimer *gameTimer;
@property (nonatomic, strong) UIProgressView *progressView;

@property (nonatomic, strong) FMDBModel* fmdbModel;
@property (nonatomic, copy) NSArray *shallArray;
@end

static int daojiShiNum = 3;
static int gameTimeNum = 30;
@implementation GameViewController

- (void)viewDidLoad {
    self.startTimer = [NSTimer scheduledTimerWithTimeInterval:1 target: self selector: @selector(updateTimer:) userInfo:nil repeats: YES];
    self.daoJIShilabel = [[UILabel alloc] init];
    self.daoJIShilabel.frame = CGRectMake(0, 300, 394, 100);
    self.daoJIShilabel.textAlignment = NSTextAlignmentCenter;
    self.daoJIShilabel.textColor = [UIColor redColor];
    self.daoJIShilabel.font = [UIFont systemFontOfSize:100];
    [self.view addSubview:self.daoJIShilabel];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"haiLang.jpg"]];
    
    self.fmdbModel = [FMDBModel shareFMDB];
    [self.fmdbModel creatFMDB];
    self.shallArray = [self.fmdbModel findDataWithSea:self.sea];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    self.navigationItem.hidesBackButton = YES;
    self.tabBarController.tabBar.hidden = YES;
}

- (void) updateTimer: (NSTimer*)timer {
    if (daojiShiNum == 0) {
        self.daoJIShilabel.text = @"GO !";
        if (self.startTimer != nil) {
            [self.startTimer invalidate];
            [self loadModel];
        }
    } else {
        self.daoJIShilabel.text = [NSString stringWithFormat:@"%d !", daojiShiNum];
        daojiShiNum--;
    }
}

- (void) loadModel {
    self.gameTimer = [NSTimer scheduledTimerWithTimeInterval:1 target: self selector: @selector(gameTimePress) userInfo: nil repeats: YES];
    _progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(-170, 350, 400, 100)]; // 调整进度条的宽度和高度
    _progressView.transform = CGAffineTransformMakeRotation(-M_PI_2); // 逆时针旋转90度，即竖直方向
    _progressView.progressTintColor = [UIColor blueColor];
    _progressView.progress = 1;
    _progressView.progressViewStyle = UIProgressViewStyleDefault;
    _progressView.backgroundColor = [UIColor redColor];
    
    // 1.创建一个维度空间
    SCNScene *scene = [SCNScene new];
    scene.background.contents = [UIImage imageNamed:@"gameBackground.jpg"];
    
    // 2.创建一个承载维度的平台
    SCNView *scnView = [[SCNView alloc] initWithFrame:self.view.bounds];
    [scnView addSubview:self.progressView];
    // 2.1将维度添加到该平台上
    scnView.scene = _scene = scene;
    // 2.2显示统计数据
    scnView.showsStatistics = true;
    // 2.3打开相机控制
    scnView.allowsCameraControl = true;
    // 2.4 打开默认光源 _  如果该选项不打开 几何体的效果将无法显示
    scnView.autoenablesDefaultLighting = true;
    // 2.
    [self.view addSubview:_scnView = scnView];
    // 2.5设置代理
    scnView.delegate = self;
    // 2.6默认情况下,如果一个场景中没有任何改变时,Scene Kit会进入"paused"(暂停)状态,渲染循环暂停后代理方法将不会继续调用,为了防止这种情况,需要在创建SCNView实例时设置playing属性为true 这样渲染循环的代理就会一直调用
    scnView.playing = true;
    
    
    //3. 创建一个节点
    SCNNode *node = [SCNNode new];
    // 3.1创建一个相机节点
    node.camera = [SCNCamera new];
    // 3.2设置相机节点的在父控件的位数
    node.position = SCNVector3Make(0, 5, 10);
    // 3.3将其添加到维度的根节点上
    [scene.rootNode addChildNode:node];
    
    // 添加头部 控件
    [self.view addSubview:_headView = [ParticleSystemsHeadView headVeiw]];
    
}

- (void)gameTimePress {
    gameTimeNum--;
    
    if (gameTimeNum >= 0) {
        CGFloat progress = (CGFloat)gameTimeNum / 30.0;
        [_progressView setProgress:progress animated:YES];
    } else {
        [self.gameTimer invalidate];
        self.gameTimer = nil;
        _progressView.progress = 0;
        jieShuGameViewController *jieShu = [[jieShuGameViewController alloc] init];
        [self.navigationController pushViewController:jieShu animated:YES];
    }
}


- (void)addNode{
    
    NSURL *modelURL;
    
    // 4.1 具体是什么几何体
    NSInteger randomNum = arc4random_uniform(10);
    if (randomNum == 0) {
        modelURL = [[NSBundle mainBundle] URLForResource:@"rubbish1" withExtension:@"usdz"];
    } else if (randomNum == 1) {
        modelURL = [[NSBundle mainBundle] URLForResource:@"rubbish2" withExtension:@"usdz"];
    } else if (randomNum == 2) {
        modelURL = [[NSBundle mainBundle] URLForResource:@"rubbish3" withExtension:@"usdz"];
    } else if (randomNum == 3) {
        modelURL = [[NSBundle mainBundle] URLForResource:self.shallArray[randomNum-3][@"shall"] withExtension:@"usdz"];
    } else if (randomNum == 4) {
        modelURL = [[NSBundle mainBundle] URLForResource:self.shallArray[randomNum-3][@"shall"] withExtension:@"usdz"];
    } else if (randomNum == 5) {
        modelURL = [[NSBundle mainBundle] URLForResource:self.shallArray[randomNum-3][@"shall"] withExtension:@"usdz"];
    } else if (randomNum == 6) {
        modelURL = [[NSBundle mainBundle] URLForResource:self.shallArray[randomNum-3][@"shall"] withExtension:@"usdz"];
    } else if (randomNum == 7) {
        modelURL = [[NSBundle mainBundle] URLForResource:self.shallArray[randomNum-3][@"shall"] withExtension:@"usdz"];
    } else if (randomNum == 8) {
        modelURL = [[NSBundle mainBundle] URLForResource:self.shallArray[randomNum-3][@"shall"] withExtension:@"usdz"];
    } else if (randomNum == 9) {
        modelURL = [[NSBundle mainBundle] URLForResource:@"pangXie" withExtension:@"usdz"];
    }

    
    // 4.3创建一个节点来承接该几何体
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (modelURL) {
            SCNScene *modelScene = [SCNScene sceneWithURL:modelURL options:nil error:nil];
            if (modelScene) {
                // 4. 创建模型节点
                SCNNode *modelNode = [modelScene.rootNode flattenedClone];
                if (modelNode) {
                    modelNode.scale = SCNVector3Make(1.5, 1.5, 1.5);
                    NSInteger X = (NSInteger)(arc4random_uniform(5)) - 2;; // [-2 , 2]
                    NSInteger Y = 10 + arc4random() % (18 - 10 + 1); // [10 , 18];
                    modelNode.physicsBody = [SCNPhysicsBody bodyWithType:SCNPhysicsBodyTypeDynamic shape:nil];
                    [modelNode.physicsBody applyForce:SCNVector3Make(X, Y, 0) atPosition:SCNVector3Make(0.05, 0.05, 0.05) impulse:true];
                    
                    UIColor *color = SC_RandomlyColor;
                    SCNGeometry *geometer = [SCNSphere sphereWithRadius:0.5];
                    geometer.materials.firstObject.diffuse.contents = color;

                    // 5.0创建一个粒子
                    SCNParticleSystem * parrticleSystem = [self creatParticleSystemWithColor:color geometry:geometer];
                    
                    // 6.0设置节点命名的方式来确定哪些节点的逻辑类型
                    modelNode.name = [NSString stringWithFormat:@"%ld", (long)randomNum];
                                
                    [modelNode addParticleSystem:parrticleSystem];
                    // 5. 将模型节点添加到场景的根节点上
                    [self.scene.rootNode addChildNode:modelNode];
                }
            } else {
                NSLog(@"Failed to load model scene from URL: %@", modelURL);
            }
        } else {
            NSLog(@"Model file not found.");
        }
    });
}

// 移除超出屏幕的节点 - 以防节点越来越多 造成内存的持续增加
- (void)removeFromParentNode{
    
    // 1.遍历根节点中的子节点
    for (SCNNode *node in self.scene.rootNode.childNodes) {
        
        // 2.0判读子节点的 在父节点的位置
        if (node.presentationNode.position.y < 0) {
            // 3.移除超出屏幕额 子节点
            [node removeFromParentNode];
//            NSLog(@"___________我移除了一个节点___");
        }
    }
}



/**
 处理节点被点击的事宜

 @param node <#node description#>
 */
- (void)delewithLifeAndClickNum:(SCNNode *)node{
    
    
    if ([node.name isEqualToString:@"0"] || [node.name isEqualToString:@"1"] || [node.name isEqualToString:@"2"]) {
        self.headView.lifeNum--;
    } else if ([node.name isEqualToString:@"9"]){
        gameTimeNum += 1.5;
        self.headView.pangXieNum++;
    } else {
        self.headView.clickNodeNum++;
        if ([node.name isEqualToString:@"3"]) {
            
        }
        if ([node.name isEqualToString:@"4"]) {
            
        }
        if ([node.name isEqualToString:@"5"]) {
            
        }
        if ([node.name isEqualToString:@"6"]) {
            
        }
        if ([node.name isEqualToString:@"7"]) {
            
        }
        if ([node.name isEqualToString:@"8"]) {
            
        }
    }
    
    if (self.headView.lifeNum == 0) {
        jieShuGameViewController *jieShu = [[jieShuGameViewController alloc] init];
        CATransition *amin = [CATransition animation];
        amin.duration = 1.0;
        amin.type = @"cube";
        amin.subtype = kCATransitionFromBottom;
        amin.timingFunction = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseOut];
        [self.navigationController.view.layer addAnimation: amin forKey: nil];
        [self.navigationController pushViewController:jieShu animated:YES];
        return;
    }
    
    // .从屏幕中国消失
    [node removeFromParentNode];
}


// 点击屏幕
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self clickNodeWith:touches withEvent:event];
}

- (void)clickNodeWith:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches allObjects].firstObject;
    CGPoint location = [touch locationInView:self.scnView];
    NSArray *hitResultsAray = [self.scnView hitTest:location options:nil];
    SCNHitTestResult *hitResults = [hitResultsAray firstObject];

    if (hitResultsAray.count) {
        [self delewithLifeAndClickNum:hitResults.node];
    }
}




//- (void)clickNodeWith:()



#pragma mark - SCNSceneRendererDelegate

/// 维度渲染一次就调用一次
- (void)renderer:(id<SCNSceneRenderer>)renderer updateAtTime:(NSTimeInterval)time{
    
    // 判读时间 控制子节点 控制子节点增加的 个数 及速度
    if (time > self.timeInterval) {
        // 添加 子节点
        [self addNode];
        
        // 延长时间
        self.timeInterval = time + 0.5;
    }
    
    // 检查所有的子节点
    [self removeFromParentNode];
}


#pragma mark - 粒子相关 SCNParticleSystem


/**
 创建粒子
 
 @param color 粒子的颜色
 @param geometry 粒子发射器
 @return
 */
- (SCNParticleSystem *)creatParticleSystemWithColor:(UIColor *)color geometry:(SCNGeometry *)geometry{
    
    
    // 创建粒子 直接使用系统的粒子 具体创建在笔记中有介绍
    SCNParticleSystem *particleSystem = [SCNParticleSystem particleSystemNamed:@"Rain.scnp" inDirectory:nil];
    
    // 设置粒子颜色 保证粒子的颜色与发射器几何体的颜色是一致的
    particleSystem.particleColor = color;
    // 指定发射器的形状 此处将传来的几何体作为粒子的发射器
    particleSystem.emitterShape = geometry;
    
    return particleSystem;
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
