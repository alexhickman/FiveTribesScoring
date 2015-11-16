//
//  MerchandiseTVC.h
//  FiveTribesScorer
//
//  Created by Hickman on 11/14/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CPPickerViewCell.h>
#import "Player.h"

@interface MerchandiseTVC : UITableViewController <CPPickerViewCellDataSource, CPPickerViewCellDelegate>

@property (strong, nonatomic) Player *currentPlayer;

@end
