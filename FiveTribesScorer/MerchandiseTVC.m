//
//  MerchandiseTVC.m
//  FiveTribesScorer
//
//  Created by Hickman on 11/14/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import "MerchandiseTVC.h"

@interface MerchandiseTVC ()
{
    NSArray *cards;
    NSArray *numberOfCards;
}
@end

@implementation MerchandiseTVC


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
    self.tableView.allowsSelection = false;
    self.tableView.bounces = false;
    self.tableView.scrollEnabled = false;
    
    cards = [[NSArray alloc]initWithObjects:@"Wheat", @"Fish", @"Pottery", @"Silk", @"Papyrus", @"Spices", @"Jewels", @"Gold", @"Ivory", @"Fakiers", nil];
    NSNumber *sixCards = [NSNumber numberWithInteger:7];
    NSNumber *fourCards = [NSNumber numberWithInteger:5];
    NSNumber *twoCards = [NSNumber numberWithInteger:3];
    NSNumber *eighteenCards = [NSNumber numberWithInteger:19];
    numberOfCards = [[NSArray alloc]initWithObjects:sixCards, sixCards, sixCards, fourCards, fourCards, fourCards, twoCards, twoCards, twoCards, eighteenCards, nil];
}

-(CPPickerViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"merchCPPCell";
    CPPickerViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell)
    {
        cell = [[CPPickerViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.dataSource = self;
    cell.delegate = self;
    cell.currentIndexPath = indexPath;
    cell.textLabel.text = [cards objectAtIndex:indexPath.row];
    cell.textLabel.textColor = [UIColor yellowColor];
    cell.selectedBackgroundView = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor brownColor];
    [cell reloadData];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [cards count];
}

-(NSInteger)numberOfItemsInPickerViewAtIndexPath:(NSIndexPath *)pickerPath
{
    return ((NSNumber *)[numberOfCards objectAtIndex:pickerPath.row]).intValue;
}

-(NSString *)pickerViewAtIndexPath:(NSIndexPath *)pickerPath titleForItem:(NSInteger)item
{
    return [NSString stringWithFormat:@"%ld", (long)item];
}

-(void)pickerViewAtIndexPath:(NSIndexPath *)pickerPath didSelectItem:(NSInteger)item
{
    if (pickerPath.row == 9) {
        self.currentPlayer.fakirs = item;
    }
    else
    {
        [self.currentPlayer.merchandise replaceObjectAtIndex:pickerPath.row withObject:[NSNumber numberWithInteger:item]];
    }
}

- (IBAction)buttonSave:(id)sender
{
    
}

- (IBAction)buttonCancel:(id)sender
{
    [self.navigationController popViewControllerAnimated:true];
}



@end
