//
//  CategoryTVCell.m
//  FiveTribesScorer
//
//  Created by Hickman on 3/15/16.
//  Copyright © 2016 Hickman. All rights reserved.
//

#import "CategoryTVCell.h"

@implementation CategoryTVCell

- (void)awakeFromNib {
    // Initialization code
    self.backgroundColor = [UIColor colorWithRed:151.0/255 green:80.0/255 blue:8.0/255 alpha:1.0f];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
