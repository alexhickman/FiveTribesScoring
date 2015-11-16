//
//  HomeScreenVC.h
//  FiveTribesScorer
//
//  Created by Hickman on 10/29/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HistoryVC.h"

@interface HomeScreenVC : UIViewController <NSCoding, deletedGameDelegate>

@property (strong, nonatomic) NSMutableArray *gameHistory;

@end
