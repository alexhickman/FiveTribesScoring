//
//  CategoryTVC.h
//  FiveTribesScorer
//
//  Created by Hickman on 3/13/16.
//  Copyright © 2016 Hickman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"
#import "Player.h"

@interface CategoryTVC : UITableViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) Game *currentGame;

@end
