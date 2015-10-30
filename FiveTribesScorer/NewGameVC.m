//
//  NewGameVC.m
//  FiveTribesScorer
//
//  Created by Hickman on 10/29/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import "NewGameVC.h"
#import "NewPlayerTVCell.h"

@implementation NewGameVC

-(void)viewDidLoad
{
    [super viewDidLoad];
    
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
    return 3;
}

- (IBAction)buttonHome:(id)sender {
    [self.navigationController popViewControllerAnimated:true];
}


@end
