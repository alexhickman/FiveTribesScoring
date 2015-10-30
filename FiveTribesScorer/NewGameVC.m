//
//  NewGameVC.m
//  FiveTribesScorer
//
//  Created by Hickman on 10/29/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import "NewGameVC.h"
#import "Game.h"
#import "Player.h"
#import "CurrentGameVC.h"
#import "EditPlayerVC.h"

@implementation NewGameVC

{
    Game *newGame;
    NSString *nameToPass;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"New Game";
    [self.buttonPlayerFour setTitle:@"poop" forState:UIControlStateNormal];
    
}

- (IBAction)buttonHome:(id)sender
{
    [self.navigationController popViewControllerAnimated:true];
}


- (IBAction)buttonPlayerOne:(id)sender
{
    nameToPass = self.buttonPlayerOne.currentTitle;
    [self performSegueWithIdentifier:@"segueEditPlayerModal" sender:self];
//    [self.buttonPlayerOne setTitle:<#(nullable NSString *)#> forState:<#(UIControlState)#>]
}

- (IBAction)buttonPlayerTwo:(id)sender
{
    nameToPass = self.buttonPlayerTwo.currentTitle;

}

- (IBAction)buttonPlayerThree:(id)sender
{
    nameToPass = self.buttonPlayerThree.currentTitle;

}

- (IBAction)buttonPlayerFour:(id)sender
{
    nameToPass = self.buttonPlayerFour.currentTitle;

}

- (IBAction)buttonStartGame:(id)sender
{
    NSMutableArray *playerNames = [[NSMutableArray alloc]init];
    int playerCount = 0;
    if (![self.buttonPlayerOne.currentTitle isEqualToString:@"+ New Player"]) {
        [playerNames addObject:self.buttonPlayerOne.currentTitle];
        playerCount++;
    }
    if (![self.buttonPlayerTwo.currentTitle isEqualToString:@"+ New Player"]) {
        [playerNames addObject:self.buttonPlayerTwo.currentTitle];
        playerCount++;
    }
    if (![self.buttonPlayerThree.currentTitle isEqualToString:@"+ New Player"]) {
        [playerNames addObject:self.buttonPlayerThree.currentTitle];
        playerCount++;
    }
    if (![self.buttonPlayerFour.currentTitle isEqualToString:@"+ New Player"]) {
        [playerNames addObject:self.buttonPlayerFour.currentTitle];
        playerCount++;
    }
    if (playerCount >= 2) {
        newGame = [[Game alloc]initWithPlayers:playerCount];
        newGame.numberOfPlayers = playerCount;
        for (int i = 0; i < playerCount; i++)
        {
            ((Player *)newGame.currentPlayers[i]).name = playerNames[i];
        }
        [self performSegueWithIdentifier:@"segueCurrentGameVC" sender:self];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"segueCurrentGameVC"]) {
        CurrentGameVC *cgvc = [segue destinationViewController];
        cgvc.currentGame = newGame;
    }
   
    if ([segue.identifier isEqualToString:@"segueEditPlayerModal"]) {
        EditPlayerVC *epvc = [segue destinationViewController];
        epvc.nameToReturn = nameToPass;
    }
}

@end
