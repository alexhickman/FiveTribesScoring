//
//  DjinnVC.h
//  FiveTribesScorer
//
//  Created by Hickman on 11/16/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"

@protocol djinnProtocol

-(void)passingDjinnBack:(Player *)scoredPlayer;

@end

@interface DjinnVC : UIViewController

@property (strong, nonatomic) Player *currentPlayer;

@property (weak, nonatomic) IBOutlet UISwitch *switchAlAmin;
@property (weak, nonatomic) IBOutlet UISwitch *switchHaurvatat;
@property (weak, nonatomic) IBOutlet UISwitch *switchJafaar;
@property (weak, nonatomic) IBOutlet UISwitch *switchShamhat;
@property (strong, nonatomic) id <djinnProtocol> delegateCustom;




@end
