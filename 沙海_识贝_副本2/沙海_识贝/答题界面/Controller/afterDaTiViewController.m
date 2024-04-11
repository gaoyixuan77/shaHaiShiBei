//
//  afterDaTiViewController.m
//  沙海_识贝
//
//  Created by Eleven on 2024/4/9.
//

#import "afterDaTiViewController.h"
#import "afterDaTiView.h"
#import <SceneKit/SceneKit.h>
#import "jiangLiView.h"
#import "Masonry.h"

@interface afterDaTiViewController ()<SCNSceneRendererDelegate>

@property (nonatomic, strong) afterDaTiView *afterview;
@property (nonatomic, strong) UIButton *button;

@end

@implementation afterDaTiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.afterview = [[afterDaTiView alloc] initWithFrame:self.view.bounds];
    [self.afterview initView];
    [self.view addSubview:self.afterview];
    
    self.afterview.scnView.delegate = self;
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame = CGRectMake(100, 600, 200, 80);
    self.button.backgroundColor = [UIColor orangeColor];
    self.button.layer.cornerRadius = 10.0;
    self.button.layer.shadowColor = [UIColor blackColor].CGColor;
    self.button.layer.shadowOffset = CGSizeMake(0, 2);
    self.button.layer.shadowOpacity = 0.5;
    self.button.layer.shadowRadius = 2.0;
    [self.button setTitle:@"返回首页" forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches allObjects].firstObject;
    CGPoint location = [touch locationInView:self.afterview.scnView];
    NSArray *hitResultsArray = [self.afterview.scnView hitTest:location options:nil];
    SCNHitTestResult *hitResults = [hitResultsArray firstObject];
    
    if (hitResultsArray.count) {
        SCNAction *rotationAction = [SCNAction rotateByX:0 y:6 * M_PI z:0 duration:1];
        [hitResults.node runAction:rotationAction  completionHandler:^{
            dispatch_async(dispatch_get_main_queue(), ^{
                jiangLiView *vc = [[jiangLiView alloc] init];
                [self.view addSubview:vc];
                [vc mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(self.view).offset(50);
                    make.top.equalTo(self.view).offset(150);
                    make.right.equalTo(self.view.mas_right).offset(-50);
                    make.bottom.equalTo(self.view.mas_bottom).offset(-150);
                }];
                [self.view addSubview:self.button];
                [self.button addTarget:self action:@selector(backPress) forControlEvents:UIControlEventTouchUpInside];
                [vc initView];
            });
        }];
    }
}

- (void) backPress {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
