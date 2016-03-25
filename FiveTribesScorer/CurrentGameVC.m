//
//  CurrentGameVC.m
//  FiveTribesScorer
//
//  Created by Hickman on 10/29/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import "CurrentGameVC.h"
#import "CurrentGameTVCell.h"
#import "CategoryTVC.h"
#import "ScoringPlayerVC.h"
#import "Player.h"
#import "EndGameVC.h"
#import "Game.h"


@implementation CurrentGameVC
{
    Player *selectedPlayer;
    NSInteger playerIndex;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:151.0/255 green:80.0/255 blue:8.0/255 alpha:1.0f];
    self.labelScoreTitle.backgroundColor = [UIColor colorWithRed:151.0/255 green:80.0/255 blue:8.0/255 alpha:1.0f];
    self.buttonEndGame.shadowEnabled = true;
    selectedPlayer = [Player newPlayer];
    self.tableViewCurrentGame.frame = CGRectMake(0, 100, self.view.frame.size.width, 300);
}
-(void)viewWillAppear:(BOOL)animated
{
    self.labelError.text = @"";
}

-(CurrentGameTVCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"playerCell";
    CurrentGameTVCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[CurrentGameTVCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.labelName.backgroundColor = [UIColor colorWithRed:151.0/255 green:80.0/255 blue:8.0/255 alpha:1.0f];
    cell.labelScore.backgroundColor = [UIColor colorWithRed:151.0/255 green:80.0/255 blue:8.0/255 alpha:1.0f];
    cell.backgroundColor = [UIColor colorWithRed:151.0/255 green:80.0/255 blue:8.0/255 alpha:1.0f];
    cell.labelName.text = ((Player *)self.currentGame.currentPlayers[indexPath.row]).name;
    cell.labelScore.text = [NSString stringWithFormat:@"%ld", (long)((Player *)self.currentGame.currentPlayers[indexPath.row]).totalScore];
    
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *tableCustomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    return tableCustomView;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *tableCustomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    return tableCustomView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.currentGame.currentPlayers count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    selectedPlayer = self.currentGame.currentPlayers[indexPath.row];
    playerIndex = indexPath.row;
    [self performSegueWithIdentifier:@"segueScoring" sender:self];
}

-(void)passingScoresBack:(Player *)scoredPlayer atIndex:(NSInteger)index
{
    self.currentGame.currentPlayers[index] = scoredPlayer;
    
    //check for Djinn ownership
    if (scoredPlayer.hasAlAmin)
    {
        self.currentGame.ownerOfAlAmin = scoredPlayer.name;
    }
    else if ([self.currentGame.ownerOfAlAmin isEqualToString:scoredPlayer.name])
    {
        self.currentGame.ownerOfAlAmin = @"";
    }
    if (scoredPlayer.hasHaurvatat)
    {
        self.currentGame.ownerOfHaurvatat = scoredPlayer.name;
    }
    else if ([self.currentGame.ownerOfHaurvatat isEqualToString:scoredPlayer.name])
    {
        self.currentGame.ownerOfHaurvatat = @"";
    }
    if (scoredPlayer.hasJafaar)
    {
        self.currentGame.ownerOfJafaar = scoredPlayer.name;
    }
    else if ([self.currentGame.ownerOfJafaar isEqualToString:scoredPlayer.name])
    {
        self.currentGame.ownerOfJafaar = @"";
    }
    if (scoredPlayer.hasShamhat)
    {
        self.currentGame.ownerOfShamhat = scoredPlayer.name;
    }
    else if ([self.currentGame.ownerOfShamhat isEqualToString:scoredPlayer.name])
    {
        self.currentGame.ownerOfShamhat = @"";
    }
    
    [self.tableViewCurrentGame reloadData];
}

-(BOOL)determineWinner
{
    //put scores into separate array
    NSMutableArray *endScores = [[NSMutableArray alloc]initWithCapacity:4];
    [endScores addObject:[NSNumber numberWithInteger:0]];
    [endScores addObject:[NSNumber numberWithInteger:0]];
    [endScores addObject:[NSNumber numberWithInteger:0]];
    [endScores addObject:[NSNumber numberWithInteger:0]];
    for (NSInteger i = 0; i < self.currentGame.numberOfPlayers; i++) {
        [endScores replaceObjectAtIndex:i withObject:[NSNumber numberWithInteger: ((Player *)self.currentGame.currentPlayers[i]).totalScore]];
    }
    
    //find largest score
    NSInteger highScore = 0;
    NSInteger scoreIndex = 0;
    for (NSNumber *score in endScores)
    {
        if ([score integerValue] > highScore)
        {
            highScore = [score integerValue];
            scoreIndex = [endScores indexOfObject:score];
        }
    }
    if (highScore == 0) {
        return false;
    }
    
    ((Player *)self.currentGame.currentPlayers[scoreIndex]).winner = YES;
    NSString *winnerName = ((Player *)self.currentGame.currentPlayers[scoreIndex]).name;
    
    //check for ties, they share victory
    bool isThereATie = false;
    for (NSInteger j = scoreIndex+1; j < 4; j++)
    {
        if ([endScores[j] integerValue] == highScore)
        {
            isThereATie = true;
            ((Player *)self.currentGame.currentPlayers[j]).winner = YES;
            winnerName = [NSString stringWithFormat:@"%@, %@", winnerName, ((Player *)self.currentGame.currentPlayers[j]).name];
        }
    }
    
    if (isThereATie)
    {
        self.currentGame.winningMessage = [NSString stringWithFormat:@"There is a Tie!\nWinners\n%@", winnerName];
    }
    else
    {
        self.currentGame.winningMessage = [NSString stringWithFormat:@"The Winner\n%@", ((Player *)self.currentGame.currentPlayers[scoreIndex]).name];
    }
    return true;
}

- (IBAction)buttonLeaveGame:(id)sender
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Leave Game?" message:@"This will remove scored players!" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *leaveGame = [UIAlertAction actionWithTitle:@"I'm sure." style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:true];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:leaveGame];
    [alert addAction:cancelAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)buttonEndGame:(id)sender
{
    self.currentGame.completedDate = [NSDate date];
    Game *gameToSave = [[Game alloc]init];
    if ([self determineWinner])
    {
    gameToSave = self.currentGame;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"saveGame" object:gameToSave];
    [self performSegueWithIdentifier:@"segueEndGame" sender:self];
    }
    else
    {
    self.labelError.text = @"Please enter some scores";
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"segueScoring"])
    {
        ScoringPlayerVC *scoringPVC = [segue destinationViewController];
        scoringPVC.currentPlayer = selectedPlayer;
        scoringPVC.playerIndex = playerIndex;
        scoringPVC.ownerOfAlAmin = self.currentGame.ownerOfAlAmin;
        scoringPVC.ownerOfHaurvatat = self.currentGame.ownerOfHaurvatat;
        scoringPVC.ownerOfJafaar = self.currentGame.ownerOfJafaar;
        scoringPVC.ownerOfShamhat = self.currentGame.ownerOfShamhat;
        scoringPVC.delegateCustom = self;
    }
    
    if ([segue.identifier isEqualToString:@"segueEndGame"])
    {
        EndGameVC *endGameVC = [segue destinationViewController];
        Game *gameToPass = [[Game alloc]init];
        gameToPass = self.currentGame;
        endGameVC.currentGame = gameToPass;
    }
    if ([segue.identifier isEqualToString:@"segueCategory"])
    {
        CategoryTVC *categoryTVC = [segue destinationViewController];
        categoryTVC.currentGame = self.currentGame;
    }
}

@end
