//
//  MerchandiseTVC.m
//  FiveTribesScorer
//
//  Created by Hickman on 11/14/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import "MerchandiseTVC.h"
#import "MerchandiseTVCell.h"

@interface MerchandiseTVC ()

@end

@implementation MerchandiseTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"MerchandiseTVCell" bundle:nil] forCellReuseIdentifier:@"merchTVCell"];
    self.tableView.backgroundColor = [UIColor brownColor];
}

-(MerchandiseTVCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"merchTVCell";
    MerchandiseTVCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell)
    {
        cell = [[MerchandiseTVCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.labelCardName.text = @"Yahoo!";
    cell.labelCardName.backgroundColor = [UIColor brownColor];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}





@end
