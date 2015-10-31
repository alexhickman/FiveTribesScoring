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

-(void)viewDidLoad
{
    [super viewDidLoad];
}

-(CurrentGameTVCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"playerCell";
    CurrentGameTVCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[CurrentGameTVCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.labelName.text = ((Player *)self.currentGame.currentPlayers[indexPath.row]).name;
    cell.labelScore.text = [NSString stringWithFormat:@"%d", ((Player *)self.currentGame.currentPlayers[indexPath.row]).totalScore];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.currentGame.currentPlayers count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"segueScoring" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ScoringPlayerVC *scoringPVC = [segue destinationViewController];
    
}

@end
