//
//  ScoringPlayerVC.h
//  FiveTribesScorer
//
//  Created by Hickman on 10/29/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ManualInputVC.h"
#import "Player.h"
#import "MerchandiseTVC.h"
#import "DjinnVC.h"
#import <KBRoundedButton/KBRoundedButton.h>

@protocol savingCurrentScoresDelegate

-(void)passingScoresBack:(Player *)scoredPlayer atIndex:(NSInteger)index;

@end

@interface ScoringPlayerVC : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, manualInputProtocol, merchandiseProtocol, djinnProtocol>

@property (strong, nonatomic) NSString *ownerOfAlAmin;
@property (strong, nonatomic) NSString *ownerOfHaurvatat;
@property (strong, nonatomic) NSString *ownerOfJafaar;
@property (strong, nonatomic) NSString *ownerOfShamhat;

@property (weak, nonatomic) IBOutlet UILabel *labelMerchandise;
@property (weak, nonatomic) IBOutlet UILabel *labelDjinn;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerViewScores;
@property (strong, nonatomic) Player *currentPlayer;
@property (nonatomic) NSInteger playerIndex;
@property (weak, nonatomic) IBOutlet KBRoundedButton *buttonMerchandise;
@property (weak, nonatomic) IBOutlet KBRoundedButton *buttonDjinn;

@property(strong, nonatomic) id <savingCurrentScoresDelegate> delegateCustom;


@end
