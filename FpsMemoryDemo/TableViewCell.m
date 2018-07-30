//
//  TableViewCell.m
//  FpsMemoryDemo
//
//  Created by Alter on 2018/7/23.
//  Copyright © 2018年 Netease. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.header.layer.cornerRadius = 15;
    self.header.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
