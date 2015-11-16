//
//  EndGameVC.m
//  FiveTribesScorer
//
//  Created by Hickman on 11/14/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import "EndGameVC.h"

@interface EndGameVC ()

@end

@implementation EndGameVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
    self.labelWinnerMessage.text = self.currentGame.winningMessage;
}

- (IBAction)buttonPlayAgain:(id)sender
{

}

- (IBAction)buttonNewGame:(id)sender
{
    [self performSegueWithIdentifier:@"unwindSegueToNewGame" sender:self];
}

//just dismisses for now
- (IBAction)buttonUpload:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
