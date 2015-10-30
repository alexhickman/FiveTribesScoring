//
//  NewGameVC.m
//  FiveTribesScorer
//
//  Created by Hickman on 10/29/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import "NewGameVC.h"
#import "NewPlayerTVCell.h"
#import "Game.h"

@implementation NewGameVC
{
    Game *newGame;
}


-(void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"New Game";
    newGame = [[Game alloc]initWithPlayers:2];
    newGame.numberOfPlayers = 2;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"playerCell";
    NewPlayerTVCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[NewPlayerTVCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.labelPlayerCount.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row + 1];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return newGame.numberOfPlayers;
}

- (IBAction)buttonHome:(id)sender {
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)buttonStartGame:(id)sender {
    
}

@end
