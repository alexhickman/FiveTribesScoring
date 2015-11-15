//
//  CurrentGameVC.m
//  FiveTribesScorer
//
//  Created by Hickman on 10/29/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import "CurrentGameVC.h"
#import "CurrentGameTVCell.h"
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
    self.view.backgroundColor = [UIColor brownColor];
    self.labelScoreTitle.backgroundColor = [UIColor brownColor];
    selectedPlayer = [Player newPlayer];
    self.tableViewCurrentGame.frame = CGRectMake(0, 100, self.view.frame.size.width, 300);
}

-(CurrentGameTVCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"playerCell";
    CurrentGameTVCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[CurrentGameTVCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.labelName.backgroundColor = [UIColor brownColor];
    cell.labelScore.backgroundColor = [UIColor brownColor];
    cell.backgroundColor = [UIColor brownColor];
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
    [self.tableViewCurrentGame reloadData];
}

-(void)determineWinner
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
}

- (IBAction)buttonLeaveGame:(id)sender
{
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)buttonSaveGame:(id)sender
{
    self.currentGame.completedDate = [NSDate date];
    Game *gameToSave = [[Game alloc]init];
    [self determineWinner];
    
    gameToSave = self.currentGame;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"saveGame" object:gameToSave];
    [self performSegueWithIdentifier:@"segueEndGame" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"segueScoring"])
    {
        ScoringPlayerVC *scoringPVC = [segue destinationViewController];
        scoringPVC.currentPlayer = selectedPlayer;
        scoringPVC.playerIndex = playerIndex;
        scoringPVC.delegateCustom = self;
    }
    
    if ([segue.identifier isEqualToString:@"segueEndGame"])
    {
        EndGameVC *endGameVC = [segue destinationViewController];
        Game *gameToPass = [[Game alloc]init];
        gameToPass = self.currentGame;
        endGameVC.currentGame = gameToPass;
    }
}

@end
