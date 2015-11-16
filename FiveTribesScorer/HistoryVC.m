//
//  HistoryVC.m
//  FiveTribesScorer
//
//  Created by Hickman on 10/29/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import "HistoryVC.h"
#import "Game.h"
#import "CurrentGameVC.h"

@implementation HistoryVC
{
    NSMutableArray *historyArray;
    Game *oldGameToView;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    historyArray = self.gameHistory;
    self.view.backgroundColor = [UIColor brownColor];
    self.navigationItem.rightBarButtonItem = [self editButtonItem];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"historyCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.timeStyle = NSDateFormatterNoStyle;
    dateFormatter.dateStyle = NSDateFormatterShortStyle;
    NSDate *date = ((Game *)(historyArray[indexPath.row])).completedDate;
    
    cell.backgroundColor = [UIColor brownColor];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", [dateFormatter stringFromDate:date]];
    cell.detailTextLabel.textColor = [UIColor yellowColor];
    cell.textLabel.text = ((Game *)(historyArray[indexPath.row])).winningMessage;
    cell.textLabel.textColor = [UIColor yellowColor];
    cell.textLabel.numberOfLines = 4;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [historyArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    oldGameToView = [historyArray objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"segueOldGameView" sender:self];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *arrayOfPaths = @[indexPath];
    [tableView beginUpdates];
    [self.tableView deleteRowsAtIndexPaths:arrayOfPaths withRowAnimation:UITableViewRowAnimationRight];
    
    [historyArray removeObjectAtIndex:indexPath.row];
    
    [tableView endUpdates];
    [self.delegateCustom deleteGamesFromHistory:historyArray];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CurrentGameVC *cgvc = [segue destinationViewController];
    cgvc.currentGame = oldGameToView;
}

@end
