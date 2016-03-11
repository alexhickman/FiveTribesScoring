//
//  EndGameVC.h
//  FiveTribesScorer
//
//  Created by Hickman on 11/14/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"
#import <KBRoundedButton/KBRoundedButton.h>

@interface EndGameVC : UIViewController
@property (strong, nonatomic) Game *currentGame;

@property (weak, nonatomic) IBOutlet UILabel *labelWinnerMessage;

@property (weak, nonatomic) IBOutlet KBRoundedButton *buttonPlayAgain;
@property (weak, nonatomic) IBOutlet KBRoundedButton *buttonNewGame;


@end
