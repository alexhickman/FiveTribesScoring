//
//  NewGameVC.h
//  FiveTribesScorer
//
//  Created by Hickman on 10/29/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditPlayerVC.h"


@interface NewGameVC : UIViewController <editPlayerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *buttonPlayerOne;
@property (weak, nonatomic) IBOutlet UIButton *buttonPlayerTwo;
@property (weak, nonatomic) IBOutlet UIButton *buttonPlayerThree;
@property (weak, nonatomic) IBOutlet UIButton *buttonPlayerFour;

@property (weak, nonatomic) IBOutlet UILabel *labelError;





@end
