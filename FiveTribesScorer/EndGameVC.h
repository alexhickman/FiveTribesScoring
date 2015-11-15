//
//  EndGameVC.h
//  FiveTribesScorer
//
//  Created by Hickman on 11/14/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"

@interface EndGameVC : UIViewController
@property (strong, nonatomic) Game *currentGame;

@property (weak, nonatomic) IBOutlet UILabel *labelWinnerMessage;
@end
