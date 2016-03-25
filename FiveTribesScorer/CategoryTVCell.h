//
//  CategoryTVCell.h
//  FiveTribesScorer
//
//  Created by Hickman on 3/15/16.
//  Copyright © 2016 Hickman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryTVCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelScore;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UIButton *buttonForThings;

@end
