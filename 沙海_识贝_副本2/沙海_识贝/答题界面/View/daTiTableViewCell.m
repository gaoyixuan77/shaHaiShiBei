//
//  daTiTableViewCell.m
//  沙海_识贝
//
//  Created by Eleven on 2024/4/9.
//

#import "daTiTableViewCell.h"
#import "Masonry.h"

@implementation daTiTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:self.button];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
        make.height.and.width.equalTo(@30);
    }];
    [self.button setBackgroundImage:[UIImage imageNamed:@"xuanxiang.png"] forState:UIControlStateNormal];
    [self.button setBackgroundImage:[UIImage imageNamed:@"xuanze.png"] forState:UIControlStateSelected];
    
    self.answerLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.answerLabel];
    [self.answerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.button.mas_right).offset(5);
        make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.height.equalTo(@(self.contentView.bounds.size.height));
    }];
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
