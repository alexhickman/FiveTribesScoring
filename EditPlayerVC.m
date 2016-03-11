//
//  EditPlayerVC.m
//  FiveTribesScorer
//
//  Created by Hickman on 10/30/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import "EditPlayerVC.h"

@implementation EditPlayerVC

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:151.0/255 green:80.0/255 blue:8.0/255 alpha:1.0f];
    self.textField.placeholder = self.buttonName;
    [self.textField becomeFirstResponder];
    self.textField.delegate = self;
    self.buttonSubmit.shadowEnabled = true;
    self.buttonRemove.shadowEnabled = true;
    self.buttonCancel.shadowEnabled = true;
}

//touch outside of textfield gets rid of keyboard
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[self view] endEditing:YES];
}

- (IBAction)buttonRemove:(id)sender
{
    [self.delegateCustom nameChange:@"+ New Player"];
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)buttonCancel:(id)sender
{
    [self dismissViewControllerAnimated:true completion:nil];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self checkIfValidName];
    return YES;
}

- (IBAction)buttonSubmit:(id)sender
{
    [self checkIfValidName];
}

- (void)checkIfValidName
{
    if ([self.textField.text isEqualToString:@""] || [self.textField.text isEqualToString:@"+ New Player"]) {
        [self.textField becomeFirstResponder];
        self.labelError.text = @"Please enter valid player name";
    }
    else if ([self.textField.text isEqualToString:self.buttonName])
    {
        [self.delegateCustom nameChange:self.textField.text];
        [self dismissViewControllerAnimated:true completion:nil];
    }
    else if ([self.textField.text isEqualToString:self.playerOneName] || [self.textField.text isEqualToString:self.playerTwoName] || [self.textField.text isEqualToString:self.playerThreeName] || [self.textField.text isEqualToString:self.playerFourName])
    {
        self.labelError.text = @"Please enter unique player name";
    }
    else
    {
        [self.delegateCustom nameChange:self.textField.text];
        [self dismissViewControllerAnimated:true completion:nil];
    }
}

@end
