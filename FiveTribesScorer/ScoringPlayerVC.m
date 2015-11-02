//
//  ScoringPlayerVC.m
//  FiveTribesScorer
//
//  Created by Hickman on 10/29/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import "ScoringPlayerVC.h"
#import "ManualInputVC.h"

@implementation ScoringPlayerVC
{
    NSArray *pickerData;
    NSInteger numberOfRows;
    NSInteger currentComponent;
    
    NSInteger gold;
    NSInteger yellowVizier;
    NSInteger whiteElder;
    NSInteger palmTrees;
    NSInteger palaces;
    NSInteger tiles;

}

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
    UIImageView *keypad = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"keypad"]];
    pickerData = [[NSArray alloc]init];
    pickerData = [NSArray arrayWithObjects:keypad, @"0",@"1", @"2", @"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",
                  nil];
    numberOfRows = 3*[pickerData count];
    
    gold = self.currentPlayer.gold;
    yellowVizier = self.currentPlayer.yellowVizier;
    whiteElder = self.currentPlayer.whiteElder;
    palmTrees = self.currentPlayer.palmTrees;
    palaces = self.currentPlayer.palace;
    tiles = self.currentPlayer.tiles;
    
    [self.pickerViewScores selectRow:1 + gold + [pickerData count] inComponent:0 animated:NO];
    [self.pickerViewScores selectRow:1 + yellowVizier + [pickerData count] inComponent:1 animated:NO];
    [self.pickerViewScores selectRow:1 + whiteElder + [pickerData count] inComponent:2 animated:NO];
    [self.pickerViewScores selectRow:1 + palmTrees + [pickerData count] inComponent:3 animated:NO];
    [self.pickerViewScores selectRow:1 + palaces + [pickerData count] inComponent:4 animated:NO];
    [self.pickerViewScores selectRow:1 + tiles + [pickerData count] inComponent:5 animated:NO];
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UIView *pickerCustomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
    
    if ((row % [pickerData count])==0) {
        UIView * myView = (UIImageView *)pickerData[(row % [pickerData count])];
        [myView setFrame:CGRectMake(0, 0, 30, 30)];
        
        // first convert to a UIImage
        UIGraphicsBeginImageContextWithOptions(myView.bounds.size, NO, 0);
        [myView.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        // then convert back to a UIImageView and return it
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        [pickerCustomView addSubview:imageView];
    }
    else
    {
        UILabel *mytext = [[UILabel alloc] init];
        mytext.textColor = [UIColor yellowColor];
        
        mytext.text = pickerData[(row % [pickerData count])];
        [mytext setFrame:CGRectMake(0,0,30,30)];
        mytext.textAlignment = 1;
        [pickerCustomView addSubview:mytext];
    }
    return pickerCustomView;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return numberOfRows;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 6;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if ((row % [pickerData count]) == 0) {
        currentComponent = component;
        [self performSegueWithIdentifier:@"segueManualInput" sender:self];
    }
    if (component==0)
    {
        gold = row % [pickerData count] - 1;
    }
    else if (component == 1)
    {
        yellowVizier = row % [pickerData count] - 1;
    }
    else if (component == 2)
    {
        whiteElder = row % [pickerData count] - 1;
    }
    else if (component == 3)
    {
        palmTrees = row % [pickerData count] - 1;
    }
    else if (component == 4)
    {
        palaces = row % [pickerData count] - 1;
    }
    else if (component == 5)
    {
        tiles = row % [pickerData count] - 1;
    }
    
    //we want the selection to always be in the SECOND set (so that it looks like it has stuff before and after)
    if (row < [pickerData count] || row >= (2 * [pickerData count]) ) {
        row = row % [pickerData count];
        row += [pickerData count];
        [pickerView selectRow:row inComponent:component animated:NO];
    }
}

-(void)valueChosen:(NSInteger)newRow currentComponent:(NSInteger)component
{
    if (component==0)
    {
        gold = newRow;
    }
    else if (component == 1)
    {
        yellowVizier = newRow;
    }
    else if (component == 2)
    {
        whiteElder = newRow;
    }
    else if (component == 3)
    {
        palmTrees = newRow;
    }
    else if (component == 4)
    {
        palaces = newRow;
    }
    else if (component == 5)
    {
        tiles = newRow;
    }
    [self.pickerViewScores selectRow:newRow + 1 inComponent:component animated:NO];
}

- (IBAction)buttonSave:(id)sender {
    self.currentPlayer.gold = gold;
    self.currentPlayer.yellowVizier = yellowVizier;
    self.currentPlayer.whiteElder = whiteElder;
    self.currentPlayer.palmTrees = palmTrees;
    self.currentPlayer.palace = palaces;
    self.currentPlayer.tiles = tiles;
    self.currentPlayer.totalScore = gold + yellowVizier + whiteElder + palmTrees + palaces + tiles;
    [self.navigationController popViewControllerAnimated:true];
    [self.delegateCustom passingScoresBack:self.currentPlayer atIndex:self.playerIndex];
}

- (IBAction)buttonCancel:(id)sender {
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)buttonMerchandise:(id)sender {
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ManualInputVC *mivc = [segue destinationViewController];
    mivc.delegateCustom = self;
    mivc.component = currentComponent;
}

@end
