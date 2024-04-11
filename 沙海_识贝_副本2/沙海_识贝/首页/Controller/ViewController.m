//
//  ViewController.m
//  沙海_识贝
//
//  Created by Eleven on 2024/4/9.
//

#import "ViewController.h"
#import "shouYeView.h"
#import "GameViewController.h"
#import "shallTuJianViewController.h"
#import "daTiViewController.h"
#import "FMDBModel.h"

@interface ViewController ()

@property (nonatomic, strong) shouYeView *shouYeview;
@property (nonatomic, strong) FMDBModel* fmdbModel;
@property (nonatomic, copy) NSArray *seaArray;

@end

static int page = 0;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.shouYeview = [[shouYeView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview: self.shouYeview];
    [self.shouYeview initView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(buttonTouchPress:) name:@"buttonTouch" object:nil];
    
    self.seaArray = @[@"太平洋", @"大西洋", @"北冰洋", @"南冰洋", @"印度洋", @"加勒比海"];
//    self.fmdbModel = [FMDBModel shareFMDB];
//    [self.fmdbModel creatFMDB];
//    NSArray *shallArray = @[@"taiPingYangShall1", @"taiPingYangShall2", @"taiPingYangShall3", @"taiPingYangShall4", @"taiPingYangShall5", @"taiPingYangShall6"];
//    NSArray *numArray = @[@"14", @"21", @"7", @"6", @"22", @"18"];
//    for (int i = 0; i < 1; i++) {
//        for (int j = 0; j < [shallArray count]; j++) {
//            [self.fmdbModel insertDataFMDBWithSea:self.seaArray[i] Shall:shallArray[j] num:numArray[j]];
//        }
//    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    self.navigationItem.hidesBackButton = YES;
    self.tabBarController.tabBar.hidden = NO;
}

- (void)buttonTouchPress: (NSNotification*)sender {
    if ([sender.userInfo[@"button"] isEqual: @111]) {
        if (page == 0) {
            page = 6;
            SCNAction *rotationAction = [SCNAction rotateByX:0 y: 2 * M_PI/6 z:0 duration:0.2];
            [self.shouYeview.modelNode runAction: rotationAction];
        } else {
            page--;
            SCNAction *rotationAction = [SCNAction rotateByX:0 y: 2 * M_PI/6 z:0 duration:0.2];
            [self.shouYeview.modelNode runAction: rotationAction];
        }
        [self.shouYeview.scrollView setContentOffset:CGPointMake(page * 250, 0) animated:YES];
    }
    if ([sender.userInfo[@"button"] isEqual: @222]) {
        if (page == 6) {
            page = 0;
            SCNAction *rotationAction = [SCNAction rotateByX:0 y: -(2 * M_PI/6) z:0 duration:0.2];
            [self.shouYeview.modelNode runAction: rotationAction];
        } else {
            page++;
            SCNAction *rotationAction = [SCNAction rotateByX:0 y: -(2 * M_PI/6) z:0 duration:0.2];
            [self.shouYeview.modelNode runAction: rotationAction];
        }
        [self.shouYeview.scrollView setContentOffset:CGPointMake(page * 250, 0) animated:YES];
    }
    if ([sender.userInfo[@"button"] isEqual: @333]) {
        GameViewController *game = [[GameViewController alloc] init];
        game.sea = self.seaArray[page];
        [self.navigationController pushViewController:game animated:YES];
    }
    if ([sender.userInfo[@"button"] isEqual: @444]) {
        shallTuJianViewController *shallTuJian = [[shallTuJianViewController alloc] init];
        shallTuJian.isShouYe = YES;
        [self.navigationController pushViewController:shallTuJian animated:YES];
    }
    if ([sender.userInfo[@"button"] isEqual: @555]) {
        daTiViewController *daTi = [[daTiViewController alloc] init];
        [self.navigationController pushViewController:daTi animated:YES];
    }
}

@end
