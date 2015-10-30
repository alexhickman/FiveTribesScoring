//
//  NewGameVC.m
//  FiveTribesScorer
//
//  Created by Hickman on 10/29/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import "NewGameVC.h"

@implementation NewGameVC

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

- (IBAction)buttonHome:(id)sender {
}


@end
