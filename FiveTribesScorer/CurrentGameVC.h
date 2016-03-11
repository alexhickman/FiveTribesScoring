//
//  CurrentGameVC.h
//  FiveTribesScorer
//
//  Created by Hickman on 10/29/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"
#import "ScoringPlayerVC.h"
#import <KBRoundedButton/KBRoundedButton.h>

@interface CurrentGameVC : UIViewController <UITableViewDelegate, UITableViewDataSource, savingCurrentScoresDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableViewCurrentGame;
@property (weak, nonatomic) IBOutlet UILabel *labelScoreTitle;
@property (strong, nonatomic) Game *currentGame;
@property (weak, nonatomic) IBOutlet UILabel *labelError;
@property (weak, nonatomic) IBOutlet KBRoundedButton *buttonEndGame;

@end
