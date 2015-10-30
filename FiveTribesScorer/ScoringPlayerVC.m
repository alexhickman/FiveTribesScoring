//
//  ScoringPlayerVC.m
//  FiveTribesScorer
//
//  Created by Hickman on 10/29/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import "ScoringPlayerVC.h"

@implementation ScoringPlayerVC

-(void)viewDidLoad
{
    [super viewDidLoad];
    
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *title = @"yup";
    return title;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 6;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 6;
}

- (IBAction)buttonSave:(id)sender {
}

- (IBAction)buttonCancel:(id)sender {
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)buttonMerchandise:(id)sender {
}

@end
