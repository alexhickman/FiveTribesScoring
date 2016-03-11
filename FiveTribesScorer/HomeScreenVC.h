//
//  HomeScreenVC.h
//  FiveTribesScorer
//
//  Created by Hickman on 10/29/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HistoryVC.h"
#import <KBRoundedButton/KBRoundedButton.h>

@interface HomeScreenVC : UIViewController <NSCoding, deletedGameDelegate>

@property (strong, nonatomic) NSMutableArray *gameHistory;
@property (weak, nonatomic) IBOutlet KBRoundedButton *buttonNewGame;
@property (weak, nonatomic) IBOutlet KBRoundedButton *buttonHistory;

@end
