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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ScoringPlayerVC *scoringPVC = [segue destinationViewController];
    scoringPVC.currentPlayer = selectedPlayer;
    scoringPVC.playerIndex = playerIndex;
    scoringPVC.delegateCustom = self;
    
}

@end
