//
//  NewGameVC.h
//  FiveTribesScorer
//
//  Created by Hickman on 10/29/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditPlayerVC.h"
#import <KBRoundedButton/KBRoundedButton.h>

@interface NewGameVC : UIViewController <editPlayerDelegate>

@property (weak, nonatomic) IBOutlet KBRoundedButton *buttonPlayerOne;
@property (weak, nonatomic) IBOutlet KBRoundedButton *buttonPlayerTwo;
@property (weak, nonatomic) IBOutlet KBRoundedButton *buttonPlayerThree;
@property (weak, nonatomic) IBOutlet KBRoundedButton *buttonPlayerFour;

@property (weak, nonatomic) IBOutlet UILabel *labelError;

@end
