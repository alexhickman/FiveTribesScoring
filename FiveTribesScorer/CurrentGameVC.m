//
//  CurrentGameVC.m
//  FiveTribesScorer
//
//  Created by Hickman on 10/29/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import "CurrentGameVC.h"
#import "ScoringPlayerVC.h"

@implementation CurrentGameVC

-(void)viewDidLoad
{
    [super viewDidLoad];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"historyCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = @"test";
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
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
