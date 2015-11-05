//
//  ScoringPlayerVC.m
//  FiveTribesScorer
//
//  Created by Hickman on 10/29/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import "ScoringPlayerVC.h"
#import "ManualInputVC.h"
#import "MerchandiseVC.h"

@implementation ScoringPlayerVC
{
    NSMutableArray *pickerDataHundred;
    NSMutableArray *pickerDataTen;
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
    
    self.pickerViewScores.frame = CGRectMake(0, 50, self.view.frame.size.width, 400);
    
    pickerDataHundred = [[NSMutableArray alloc]init];
    pickerDataHundred = [self makeArrayOfStringsTo:100];
    [pickerDataHundred addObject:keypad];
    
    pickerDataTen = [[NSMutableArray alloc]init];
    pickerDataTen = [self makeArrayOfStringsTo:10];
    [pickerDataTen addObject:keypad];

    gold = self.currentPlayer.gold;
    yellowVizier = self.currentPlayer.yellowVizier;
    whiteElder = self.currentPlayer.whiteElder;
    palmTrees = self.currentPlayer.palmTrees;
    palaces = self.currentPlayer.palace;
    tiles = self.currentPlayer.tiles;
    
    [self.pickerViewScores selectRow:gold + [pickerDataHundred count] inComponent:0 animated:NO];
    [self.pickerViewScores selectRow:yellowVizier + [pickerDataTen count] inComponent:1 animated:NO];
    [self.pickerViewScores selectRow:whiteElder + [pickerDataTen count] inComponent:2 animated:NO];
    [self.pickerViewScores selectRow:palmTrees + [pickerDataTen count] inComponent:3 animated:NO];
    [self.pickerViewScores selectRow:palaces + [pickerDataTen count] inComponent:4 animated:NO];
    [self.pickerViewScores selectRow:tiles + [pickerDataHundred count] inComponent:5 animated:NO];
}

-(NSMutableArray *)makeArrayOfStringsTo:(int)number
{
    NSMutableArray *arrayOfNumbers = [[NSMutableArray alloc]init];
    for (int i=0; i <= number; i++)
    {
        NSString *aValue = [NSString stringWithFormat:@"%d", i];
        [arrayOfNumbers addObject:aValue];
    }
    return arrayOfNumbers;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UIView *pickerCustomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
    
    if (component == 0 || component == 5)
    {
        if ((row % [pickerDataHundred count]) == ([pickerDataHundred count]-1)) {
            UIView *myView = (UIImageView *)pickerDataHundred[(row % [pickerDataHundred count])];
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
            
            mytext.text = pickerDataHundred[(row % [pickerDataHundred count])];
            [mytext setFrame:CGRectMake(0,0,30,30)];
            mytext.textAlignment = 1;
            [pickerCustomView addSubview:mytext];
        }
        return pickerCustomView;
    }
    else
    {
        if ((row % [pickerDataTen count]) == ([pickerDataTen count]-1)) {
            UIView * myView = (UIImageView *)pickerDataTen[(row % [pickerDataTen count])];
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
            
            mytext.text = pickerDataTen[(row % [pickerDataTen count])];
            [mytext setFrame:CGRectMake(0,0,30,30)];
            mytext.textAlignment = 1;
            [pickerCustomView addSubview:mytext];
        }
        return pickerCustomView;
    }
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0 || component == 5)
    {
        return 3*[pickerDataHundred count];
    }
    else
    {
        return 3*[pickerDataTen count];
    }
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 6;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0 || component == 5)
    {
        if ((row % [pickerDataHundred count]) == ([pickerDataHundred count] - 1)) {
            currentComponent = component;
            [self performSegueWithIdentifier:@"segueManualInput" sender:self];
        }
        if (component==0)
        {
            gold = row % [pickerDataHundred count];
        }
        else if (component == 1)
        {
            yellowVizier = row % [pickerDataTen count];
        }
        else if (component == 2)
        {
            whiteElder = row % [pickerDataTen count];
        }
        else if (component == 3)
        {
            palmTrees = row % [pickerDataTen count];
        }
        else if (component == 4)
        {
            palaces = row % [pickerDataTen count];
        }
        else if (component == 5)
        {
            tiles = row % [pickerDataHundred count];
        }
        
        //we want the selection to always be in the SECOND set (so that it looks like it has stuff before and after)
        if (row < [pickerDataHundred count] || row >= (2 * [pickerDataHundred count]) )
        {
            row = row % [pickerDataHundred count];
            row += [pickerDataHundred count];
            [pickerView selectRow:row inComponent:component animated:NO];
        }
    }
    else
    {
        if ((row % [pickerDataTen count]) == ([pickerDataTen count] - 1)) {
            currentComponent = component;
            [self performSegueWithIdentifier:@"segueManualInput" sender:self];
        }
        if (component == 0)
        {
            gold = row % [pickerDataHundred count];
        }
        else if (component == 1)
        {
            yellowVizier = row % [pickerDataTen count];
        }
        else if (component == 2)
        {
            whiteElder = row % [pickerDataTen count];
        }
        else if (component == 3)
        {
            palmTrees = row % [pickerDataTen count];
        }
        else if (component == 4)
        {
            palaces = row % [pickerDataTen count];
        }
        else if (component == 5)
        {
            tiles = row % [pickerDataHundred count];
        }
        
        //we want the selection to always be in the SECOND set (so that it looks like it has stuff before and after)
        if (row < [pickerDataTen count] || row >= (2 * [pickerDataTen count]) )
        {
            row = row % [pickerDataTen count];
            row += [pickerDataTen count];
            [pickerView selectRow:row inComponent:component animated:NO];
        }
    }
}

//delegate method
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
    if (component == 0 || component == 5)
    {
        [self.pickerViewScores selectRow:newRow + [pickerDataHundred count] inComponent:component animated:NO];
    }
    else
    {
        [self.pickerViewScores selectRow:newRow + [pickerDataTen count] inComponent:component animated:NO];
    }
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

- (IBAction)buttonCancel:(id)sender
{
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)buttonMerchandise:(id)sender
{
    [self performSegueWithIdentifier:@"segueMerch" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"segueManualInput"]) {
        ManualInputVC *mivc = [segue destinationViewController];
        mivc.delegateCustom = self;
        mivc.component = currentComponent;
    }
    if ([segue.identifier isEqualToString:@"segueMerch"])
    {
        MerchandiseVC *mvc = [segue destinationViewController];
    }
    
}

@end
