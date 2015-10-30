//
//  CurrentGameVC.h
//  FiveTribesScorer
//
//  Created by Hickman on 10/29/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"

@interface CurrentGameVC : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableViewCurrentGame;
@property (strong, nonatomic) Game *currentGame;

@end
