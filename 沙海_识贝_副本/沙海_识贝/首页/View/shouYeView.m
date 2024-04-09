//
//  shouYeView.m
//  沙海_识贝
//
//  Created by Eleven on 2024/4/9.
//

#import "shouYeView.h"
#import "Masonry.h"

@interface shouYeView ()<SCNSceneRendererDelegate>

@end

@implementation shouYeView

- (void)initView {
    
    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"shouYeBackground.jpg"]];
    
    UIImageView *titleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title.png"]];
    [self addSubview:titleImageView];
    [titleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(100);
        make.centerX.equalTo(self.mas_centerX).offset(0);
        make.height.equalTo(@120);
        make.width.equalTo(@380);
    }];
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:leftButton];
    [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleImageView.mas_bottom).offset(50);
        make.left.equalTo(self).offset(10);
        make.height.and.width.equalTo(@80);
    }];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"jiantou_xiangzuoliangci.png"] forState:UIControlStateNormal];
    
    self.scrollView = [[UIScrollView alloc] init];
    [self addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleImageView.mas_bottom).offset(0);
        make.left.equalTo(leftButton.mas_right).offset(5);
        make.height.and.width.equalTo(@200);
    }];
    self.scrollView.backgroundColor = [UIColor clearColor];
    self.scrollView.contentSize = CGSizeMake(200 * 7, 200);
    NSArray *array = @[@"太平洋", @"大西洋", @"北冰洋", @"南冰洋", @"印度洋", @"地中海", @"加勒比海"];
    for (int i = 0; i < 7; i++) {
        UIView  *view = [[UIView alloc] initWithFrame:CGRectMake(i * 200, 0, 200, 200)];
        [self.scrollView addSubview:view];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", array[i]]]];
        [view addSubview:imageView];
    }
    [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    self.scrollView.pagingEnabled = YES;
    
    SCNScene *scene = [SCNScene new];
    SCNView *scnView = [[SCNView alloc] init];
    [self addSubview:_scnView = scnView];
    [scnView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleImageView.mas_bottom).offset(0);
        make.left.equalTo(leftButton.mas_right).offset(5);
        make.height.and.width.equalTo(@200);
    }];
    scnView.scene = scene;
    scnView.allowsCameraControl = NO;
    scnView.backgroundColor = [UIColor clearColor];
    scnView.autoenablesDefaultLighting = true;
    scnView.delegate = self;
    scnView.playing = true;
    scnView.allowsCameraControl = NO;
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"earth" withExtension:@"usdz"];
    if (modelURL) {
        SCNScene *modelScene = [SCNScene sceneWithURL:modelURL options:nil error:nil];
        if (modelScene) {
            SCNNode *modelNode = [modelScene.rootNode clone];
            if (modelNode) {
                SCNCamera *camera = [SCNCamera camera];
                SCNNode *cameraNode = [SCNNode node];
                cameraNode.camera = camera;
                cameraNode.position = SCNVector3Make(0, 0, 0);
                [modelNode addChildNode:cameraNode];
                [self.scnView.scene.rootNode addChildNode:modelNode];
                modelNode.position = SCNVector3Make(0, 0, 0);
                modelNode.scale = SCNVector3Make(3, 3, 3);
                modelNode.rotation = SCNVector4Make(-1, 0, 0, M_PI_2);
                self.modelNode = modelNode;
            }
        } else {
            NSLog(@"Error loading model scene.");
        }
    } else {
        NSLog(@"Model file not found.");
    }
    
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:rightButton];
    [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleImageView.mas_bottom).offset(50);
        make.left.equalTo(scnView.mas_right).offset(5);
        make.height.and.width.equalTo(@80);
    }];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"jiantou_xiangyouliangci.png"] forState:UIControlStateNormal];
    
    UIButton *startButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [startButton setTitle:@"开始游戏" forState:UIControlStateNormal];
    [startButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [startButton setBackgroundColor:[UIColor orangeColor]];
    startButton.layer.cornerRadius = 25;
    startButton.layer.shadowColor = [UIColor blackColor].CGColor;
    startButton.layer.shadowOffset = CGSizeMake(0, 2);
    startButton.layer.shadowOpacity = 0.5;
    startButton.layer.shadowRadius = 2;
    [self addSubview:startButton];
    [startButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(scnView.mas_bottom).offset(10);
        make.left.equalTo(scnView).offset(10);
        make.height.equalTo(@50);
        make.width.equalTo(@200);
    }];

    UIButton *lookShallButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [lookShallButton setTitle:@"查看贝壳" forState:UIControlStateNormal];
    [lookShallButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [lookShallButton setBackgroundColor:[UIColor orangeColor]];
    lookShallButton.layer.cornerRadius = 25;
    lookShallButton.layer.shadowColor = [UIColor blackColor].CGColor;
    lookShallButton.layer.shadowOffset = CGSizeMake(0, 2);
    lookShallButton.layer.shadowOpacity = 0.5;
    lookShallButton.layer.shadowRadius = 2;
    [self addSubview:lookShallButton];
    [lookShallButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(startButton.mas_bottom).offset(10);
        make.left.equalTo(scnView).offset(10);
        make.height.equalTo(@50);
        make.width.equalTo(@200);
    }];

    UIButton *knowledgeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [knowledgeButton setTitle:@"知识学习" forState:UIControlStateNormal];
    [knowledgeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [knowledgeButton setBackgroundColor:[UIColor orangeColor]];
    knowledgeButton.layer.cornerRadius = 25;
    knowledgeButton.layer.shadowColor = [UIColor blackColor].CGColor;
    knowledgeButton.layer.shadowOffset = CGSizeMake(0, 2);
    knowledgeButton.layer.shadowOpacity = 0.5;
    knowledgeButton.layer.shadowRadius = 2;
    [self addSubview:knowledgeButton];
    [knowledgeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lookShallButton.mas_bottom).offset(10);
        make.left.equalTo(scnView).offset(10);
        make.height.equalTo(@50);
        make.width.equalTo(@200);
    }];

    leftButton.tag = 111;
    rightButton.tag = 222;
    startButton.tag = 333;
    lookShallButton.tag = 444;
    knowledgeButton.tag = 555;
    
    [leftButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    [rightButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    [startButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    [lookShallButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    [knowledgeButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];

}

- (void) buttonPress: (UIButton*)button {
    NSDictionary *dict = @{@"button": @(button.tag)};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"buttonTouch" object:nil userInfo:dict];
}

@end
