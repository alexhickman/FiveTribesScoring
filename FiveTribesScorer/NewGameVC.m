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

@implementation NewGameVC

{
    Game *newGame;
    NSString *nameToPass;
    NSInteger whichNameChanged;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [self.buttonPlayerOne setTitle:[defaults objectForKey:@"playerOneButton"] forState:UIControlStateNormal];
    [self.buttonPlayerTwo setTitle:[defaults objectForKey:@"playerTwoButton"] forState:UIControlStateNormal];
    [self.buttonPlayerThree setTitle:[defaults objectForKey:@"playerThreeButton"] forState:UIControlStateNormal];
    [self.buttonPlayerFour setTitle:[defaults objectForKey:@"playerFourButton"] forState:UIControlStateNormal];

    self.navigationItem.title = @"New Game";
}

-(void)viewWillAppear:(BOOL)animated
{
    self.labelError.textColor = [UIColor blackColor];
    self.labelError.text = @"Select 2-4 Players";
}

- (IBAction)buttonHome:(id)sender
{
    [self.navigationController popViewControllerAnimated:true];
}

-(void)nameChange:(NSString *)message
{
    if (whichNameChanged == 1) {
        [self.buttonPlayerOne setTitle:message forState:UIControlStateNormal];
    }
    if (whichNameChanged == 2) {
        [self.buttonPlayerTwo setTitle:message forState:UIControlStateNormal];
    }
    if (whichNameChanged == 3) {
        [self.buttonPlayerThree setTitle:message forState:UIControlStateNormal];
    }
    if (whichNameChanged == 4) {
        [self.buttonPlayerFour setTitle:message forState:UIControlStateNormal];
    }
}

- (IBAction)buttonPlayerOne:(id)sender
{
    whichNameChanged = 1;
    nameToPass = self.buttonPlayerOne.currentTitle;
    [self performSegueWithIdentifier:@"segueEditPlayerModal" sender:self];    
}

- (IBAction)buttonPlayerTwo:(id)sender
{
    whichNameChanged = 2;
    nameToPass = self.buttonPlayerTwo.currentTitle;
    [self performSegueWithIdentifier:@"segueEditPlayerModal" sender:self];
}

- (IBAction)buttonPlayerThree:(id)sender
{
    whichNameChanged = 3;
    nameToPass = self.buttonPlayerThree.currentTitle;
    [self performSegueWithIdentifier:@"segueEditPlayerModal" sender:self];
}

- (IBAction)buttonPlayerFour:(id)sender
{
    whichNameChanged = 4;
    nameToPass = self.buttonPlayerFour.currentTitle;
    [self performSegueWithIdentifier:@"segueEditPlayerModal" sender:self];
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
        [self saveTheThings];
        [self performSegueWithIdentifier:@"segueCurrentGameVC" sender:self];
    }
    else
    {
        self.labelError.textColor = [UIColor redColor];
        self.labelError.text = @"You do not have enough players";
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
        epvc.buttonName = nameToPass;
        epvc.delegateCustom = self;
    }
}

-(void)saveTheThings
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:self.buttonPlayerOne.currentTitle forKey:@"playerOneButton"];
    [defaults setObject:self.buttonPlayerTwo.currentTitle forKey:@"playerTwoButton"];
    [defaults setObject:self.buttonPlayerThree.currentTitle forKey:@"playerThreeButton"];
    [defaults setObject:self.buttonPlayerFour.currentTitle forKey:@"playerFourButton"];
    
    [defaults synchronize];
}

@end
