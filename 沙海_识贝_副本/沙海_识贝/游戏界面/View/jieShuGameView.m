//
//  jieShuGameView.m
//  沙海_识贝
//
//  Created by Eleven on 2024/4/9.
//

#import "jieShuGameView.h"
#import "Masonry.h"

@implementation jieShuGameView

- (void)initView {
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];

    UILabel *jieShuLabel = [[UILabel alloc] init];
    [self addSubview:jieShuLabel];
    [jieShuLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(200);
        make.left.offset(0);
        make.height.equalTo(@100);
        make.width.equalTo(@(self.bounds.size.width));
    }];
    jieShuLabel.text = @"游戏结束";
    jieShuLabel.font = [UIFont systemFontOfSize:100];
    jieShuLabel.textColor = [UIColor redColor];
    jieShuLabel.textAlignment = NSTextAlignmentCenter;
    
    UILabel *chaKanLabel = [[UILabel alloc] init];
    [self addSubview:chaKanLabel];
    [chaKanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(jieShuLabel.mas_bottom).offset(50);
        make.left.equalTo(0);
        make.height.equalTo(@50);
        make.width.equalTo(@(self.bounds.size.width));
    }];
    chaKanLabel.text = @"捕获的贝壳";
    chaKanLabel.font = [UIFont systemFontOfSize:50];
    chaKanLabel.textColor = [UIColor blueColor];
    chaKanLabel.textAlignment = NSTextAlignmentCenter;
    
    self.tableView = [[UITableView alloc] init];
    [self addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(chaKanLabel.mas_bottom).offset(30);
        make.left.equalTo(self.mas_left).offset(50);
        make.right.equalTo(self.mas_right).offset(-50);
        make.bottom.equalTo(self.mas_bottom).offset(200);
    }];
    
    self.fanHuiButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.fanHuiButton];
    [self.fanHuiButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tableView.mas_bottom).offset(30);
        make.left.equalTo(self.mas_left).offset(100);
        make.width.equalTo(@200);
        make.height.equalTo(@80);
    }];
    self.fanHuiButton.layer.cornerRadius = 10.0;
    self.fanHuiButton.clipsToBounds = YES;
    self.fanHuiButton.layer.shadowColor = [UIColor blackColor].CGColor;
    self.fanHuiButton.layer.shadowOpacity = 0.5;
    self.fanHuiButton.layer.shadowOffset = CGSizeMake(0, 2);
    self.fanHuiButton.layer.shadowRadius = 3.0;
    self.fanHuiButton.layer.masksToBounds = NO;

}

@end
