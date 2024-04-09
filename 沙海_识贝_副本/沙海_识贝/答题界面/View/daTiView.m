//
//  daTiView.m
//  沙海_识贝
//
//  Created by Eleven on 2024/4/9.
//

#import "daTiView.h"
#import "Masonry.h"
#import "daTiTableViewCell.h"

@implementation daTiView

- (void)initview {
    self.backgroundColor = [UIColor colorWithRed:95/225.0f green:224/225.0f blue:196/225.0f alpha:1];
    self.ScrollView = [[UIScrollView alloc] init];
    self.ScrollView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    self.ScrollView.contentSize = CGSizeMake(self.bounds.size.width, self.bounds.size.height * 5);
    self.ScrollView.pagingEnabled = YES;
    self.ScrollView.bounces = YES;
    self.ScrollView.alwaysBounceHorizontal = NO;
    self.ScrollView.alwaysBounceVertical = YES;
    self.ScrollView.showsHorizontalScrollIndicator = NO;
    self.ScrollView.showsVerticalScrollIndicator = NO;
    self.ScrollView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.ScrollView];
    
    for (int i = 0; i < 5; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(50, i * self.bounds.size.height + 200, self.bounds.size.width - 100, self.bounds.size.height - 400)];
        [self.ScrollView addSubview:view];
        UITableView *tableView = [[UITableView alloc] initWithFrame:view.bounds style:UITableViewStylePlain];
        tableView.tag = i;
        tableView.delegate = self;
        tableView.dataSource = self;
        [view addSubview:tableView];
    }
    
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backButton setBackgroundImage:[UIImage imageNamed:@"goutongye_zuojiantou_fanhui.png"] forState:UIControlStateNormal];
    [self addSubview:self.backButton];
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(30);
        make.top.equalTo(self).offset(650);
        make.width.and.height.equalTo(@80);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 80;
    }
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    for (int i = 0; i < 5; i++) {
        if (tableView.tag == i) {
            if (indexPath.section == 0) {
                UITableViewCell *questionCell = [tableView dequeueReusableCellWithIdentifier:@"question" forIndexPath:indexPath];
                questionCell.selectionStyle = UITableViewCellSelectionStyleNone;
                questionCell.backgroundColor = [UIColor colorWithRed:0/225.0 green:113/225.0 blue:93/225.0 alpha:1.0];
                questionCell.selectionStyle = UITableViewCellSelectionStyleNone;
                questionCell.textLabel.text = self.questionArray[i];
                questionCell.textLabel.numberOfLines = 0;
                return questionCell;
            } else {
                daTiTableViewCell *answer = [tableView dequeueReusableCellWithIdentifier:@"answer" forIndexPath:indexPath];
                answer.selectionStyle = UITableViewCellSelectionStyleNone;
                answer.backgroundColor = [UIColor colorWithRed:0/225.0 green:113/225.0 blue:93/225.0 alpha:1.0];
                answer.selectionStyle = UITableViewCellSelectionStyleNone;
                NSString *keyStr = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
                answer.answerLabel.text = self.answerArray[i][keyStr];
                return answer;
            }
        }
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    for (UITableViewCell *cell in tableView.visibleCells) {
        if ([cell isKindOfClass:[daTiTableViewCell class]]) {
            daTiTableViewCell *answerCell = (daTiTableViewCell *)cell;
            if (![cell isEqual:[tableView cellForRowAtIndexPath:indexPath]]) {
                [answerCell.button setSelected:NO];
            }
        }
    }
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    if ([selectedCell isKindOfClass:[daTiTableViewCell class]]) {
        daTiTableViewCell *answerCell = (daTiTableViewCell *)selectedCell;
        [answerCell.button setSelected:YES];
    }
}


@end
