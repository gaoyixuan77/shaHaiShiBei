//
//  jieShuGameViewController.m
//  沙海_识贝
//
//  Created by Eleven on 2024/4/9.
//

#import "jieShuGameViewController.h"
#import "jieShuGameView.h"

@interface jieShuGameViewController ()

@property (nonatomic, strong) jieShuGameView *jieShuView;

@end

@implementation jieShuGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.jieShuView = [[jieShuGameView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.jieShuView];
    [self.jieShuView initView];
        
    self.jieShuView.tableView.delegate = self;
    self.jieShuView.tableView.dataSource = self;
    [self.jieShuView.fanHuiButton addTarget:self action:@selector(fanHuiPress) forControlEvents:UIControlEventTouchUpInside];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = @"%@ * %d";
    return cell;
}

- (void) fanHuiPress{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
