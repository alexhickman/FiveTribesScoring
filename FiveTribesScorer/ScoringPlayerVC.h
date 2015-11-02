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

@interface ScoringPlayerVC : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, manualInputProtocol>

@property (weak, nonatomic) IBOutlet UIPickerView *pickerViewScores;
@property (strong, nonatomic) Player *currentPlayer;

@end
