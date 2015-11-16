//
//  HistoryVC.h
//  FiveTribesScorer
//
//  Created by Hickman on 10/29/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol deletedGameDelegate

-(void)deleteGamesFromHistory:(NSMutableArray *)newHistoryArray;

@end

@interface HistoryVC : UITableViewController

@property (strong, nonatomic) NSMutableArray *gameHistory;
@property(strong, nonatomic) id <deletedGameDelegate> delegateCustom;



@end
