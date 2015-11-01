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
    for (int i=0; i<6; i++) {
        [self.pickerViewScores selectRow:1+[pickerData count] inComponent:i animated:NO];
    }
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    //    UIView *tmpView =
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
        [self performSegueWithIdentifier:@"segueManualInput" sender:self];
    }
    //we want the selection to always be in the SECOND set (so that it looks like it has stuff before and after)
    if (row < [pickerData count] || row >= (2 * [pickerData count]) ) {
        row = row % [pickerData count];
        row += [pickerData count];
        [pickerView selectRow:row inComponent:component animated:NO];
    }
}


- (IBAction)buttonSave:(id)sender {
}

- (IBAction)buttonCancel:(id)sender {
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)buttonMerchandise:(id)sender {
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ManualInputVC *mivc = [segue destinationViewController];
}

@end
