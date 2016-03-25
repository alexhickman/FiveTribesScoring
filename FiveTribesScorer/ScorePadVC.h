//
//  ScorePadVC.h
//  FiveTribesScorer
//
//  Created by Hickman on 3/11/16.
//  Copyright © 2016 Hickman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"

@interface ScorePadVC : UIViewController

@property (strong, nonatomic) Game *currentGame;
@property (weak, nonatomic) IBOutlet UILabel *labelPlayerOne;
@property (weak, nonatomic) IBOutlet UILabel *labelPlayerTwo;
@property (weak, nonatomic) IBOutlet UILabel *labelPlayerThree;
@property (weak, nonatomic) IBOutlet UILabel *labelPlayerFour;

@end
