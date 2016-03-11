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
@property (weak, nonatomic) IBOutlet UILabel *labelAlAminOwner;
@property (weak, nonatomic) IBOutlet UILabel *labelHaurvatatOwner;
@property (weak, nonatomic) IBOutlet UILabel *labelJafaarOwner;
@property (weak, nonatomic) IBOutlet UILabel *labelShamhatOwner;

@property (strong, nonatomic) NSString *ownerOfAlAmin;
@property (strong, nonatomic) NSString *ownerOfHaurvatat;
@property (strong, nonatomic) NSString *ownerOfJafaar;
@property (strong, nonatomic) NSString *ownerOfShamhat;

@property (strong, nonatomic) id <djinnProtocol> delegateCustom;




@end
