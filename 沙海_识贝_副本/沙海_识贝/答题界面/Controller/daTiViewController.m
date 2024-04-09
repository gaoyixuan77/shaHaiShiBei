//
//  daTiViewController.m
//  沙海_识贝
//
//  Created by Eleven on 2024/4/9.
//

#import "daTiViewController.h"
#import "daTiView.h"

@interface daTiViewController ()

@property (nonatomic, strong) daTiView *daTiview;

@end

@implementation daTiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.daTiview = [[daTiView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.daTiview];
    [self.daTiview initview];
    
    self.daTiview.ScrollView.delegate = self;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.daTiview.ScrollView) {
        CGPoint offset = scrollView.contentOffset;
        
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
