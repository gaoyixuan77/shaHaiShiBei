//
//  daTiViewController.m
//  沙海_识贝
//
//  Created by Eleven on 2024/4/9.
//

#import "daTiViewController.h"
#import "daTiView.h"
#import "afterDaTiViewController.h"

@interface daTiViewController ()

@property (nonatomic, strong) daTiView *daTiview;

@end

@implementation daTiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.daTiview = [[daTiView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.daTiview];
    [self.daTiview initview];
    
    self.daTiview.questionArray = @[@"题目1题目1题目1题目1题目1题目1题目1题目1题目1题目1题目1", @"题目2题目2题目2题目2题目2题目2题目2题目2题目2题目2", @"题目3题目3题目3题目3题目3题目3题目3题目3题目3题目3", @"题目4题目4题目4题目4题目4题目4题目4题目4题目4题目4", @"题目5题目5题目5题目5题目5题目5题目5题目5题目5题目5"];
    NSDictionary *dict = @{@"0": @"选项A", @"1": @"选项B", @"2": @"选项C", @"3": @"选项D"};
    self.daTiview.answerArray = @[dict, dict, dict, dict, dict];
    self.daTiview.ScrollView.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    self.navigationItem.hidesBackButton = YES;
    self.tabBarController.tabBar.hidden = YES;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.daTiview.ScrollView) {
        CGPoint offset = scrollView.contentOffset;
        if (offset.y > 3500) {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"确认提交？" message:@"是否要现在提交你的答案？" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *YESaction = [UIAlertAction actionWithTitle:@"确定提交" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                afterDaTiViewController *afterDaTi = [[afterDaTiViewController alloc] init];
                [self.navigationController pushViewController:afterDaTi animated:YES];
                [self dismissViewControllerAnimated:YES completion:nil];
            }];
            UIAlertAction *Noaction = [UIAlertAction actionWithTitle:@"我再想想" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [self dismissViewControllerAnimated:YES completion:nil];
            }];
            [alertController addAction:YESaction];
            [alertController addAction:Noaction];
            [self presentViewController:alertController animated:YES completion:nil];
        }
    }
}



@end
