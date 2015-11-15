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
{
    NSArray *cards;
}
@end

@implementation MerchandiseTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"MerchandiseTVCell" bundle:nil] forCellReuseIdentifier:@"merchTVCell"];
      cards = [[NSArray alloc]initWithObjects:@"Cloth", @"Fish", @"Gems", @"Gold", @"Ivory", @"Paper", @"Pots", @"Spices", @"Wheat", @"Fakiers", nil];
}

-(MerchandiseTVCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"merchTVCell";
    MerchandiseTVCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell)
    {
        cell = [[MerchandiseTVCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.labelCardName.text = [cards objectAtIndex:indexPath.row];
    cell.labelCardName.backgroundColor = [UIColor brownColor];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (IBAction)buttonSave:(id)sender
{

}

- (IBAction)buttonCancel:(id)sender
{
    [self.navigationController popViewControllerAnimated:true];
}



@end
