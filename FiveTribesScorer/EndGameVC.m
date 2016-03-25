//
//  EndGameVC.m
//  FiveTribesScorer
//
//  Created by Hickman on 11/14/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import "EndGameVC.h"
#import "ScorePadVC.h"

@interface EndGameVC ()

@end

@implementation EndGameVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:151.0/255 green:80.0/255 blue:8.0/255 alpha:1.0f];
    self.buttonNewGame.shadowEnabled = true;
    self.buttonPlayAgain.shadowEnabled = true;
    self.labelWinnerMessage.text = self.currentGame.winningMessage;
}

- (IBAction)buttonPlayAgain:(id)sender
{

}

- (IBAction)buttonNewGame:(id)sender
{
    [self performSegueWithIdentifier:@"unwindSegueToNewGame" sender:self];
}

- (IBAction)buttonScorePad:(id)sender
{
    [self performSegueWithIdentifier:@"segueScorePad" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"segueScorePad"])
    {
        ScorePadVC *spvc = [segue destinationViewController];
        spvc.currentGame = self.currentGame;
    }
}

@end
