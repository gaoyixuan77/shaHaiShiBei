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

@interface ViewController ()

@property (nonatomic, strong) shouYeView *shouYeview;

@end

static int page = 0;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    page = 0;
    
    self.shouYeview = [[shouYeView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview: self.shouYeview];
    [self.shouYeview initView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(buttonTouchPress:) name:@"buttonTouch" object:nil];
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
            SCNAction *rotationAction = [SCNAction rotateByX:0 y: -M_PI/7 z:0 duration:0.5];
            [self.shouYeview.modelNode runAction: rotationAction];
        } else {
            page--;
            SCNAction *rotationAction = [SCNAction rotateByX:0 y: M_PI/7 z:0 duration:0.5];
            [self.shouYeview.modelNode runAction: rotationAction];
        }
        [self.shouYeview.scrollView setContentOffset:CGPointMake(page * 200, 0) animated:YES];
    }
    if ([sender.userInfo[@"button"] isEqual: @222]) {
        if (page == 6) {
            page = 0;
            SCNAction *rotationAction = [SCNAction rotateByX:0 y: M_PI/7 z:0 duration:0.5];
            [self.shouYeview.modelNode runAction: rotationAction];
        } else {
            page++;
            SCNAction *rotationAction = [SCNAction rotateByX:0 y: -M_PI/7 z:0 duration:0.5];
            [self.shouYeview.modelNode runAction: rotationAction];
        }
        [self.shouYeview.scrollView setContentOffset:CGPointMake(page * 200, 0) animated:YES];
    }
    if ([sender.userInfo[@"button"] isEqual: @333]) {
        GameViewController *game = [[GameViewController alloc] init];
        [self.navigationController pushViewController:game animated:YES];
    }
    if ([sender.userInfo[@"button"] isEqual: @444]) {
        shallTuJianViewController *shallTuJian = [[shallTuJianViewController alloc] init];
        [self.navigationController pushViewController:shallTuJian animated:YES];
    }
    if ([sender.userInfo[@"button"] isEqual: @555]) {
        daTiViewController *daTi = [[daTiViewController alloc] init];
        [self.navigationController pushViewController:daTi animated:YES];
    }
}

@end
