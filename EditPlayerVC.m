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
    self.textField.placeholder = self.buttonName;
    [self.textField becomeFirstResponder];
    self.textField.delegate = self;
}

- (IBAction)buttonClear:(id)sender
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
    if ([self.textField.text isEqualToString:@""]) {
        [self.textField becomeFirstResponder];
        self.labelError.text = @"Please enter valid player name";
    }
    else
    {
        [self.delegateCustom nameChange:self.textField.text];
        [self dismissViewControllerAnimated:true completion:nil];
    }
    return YES;
}

- (IBAction)buttonSubmit:(id)sender
{
    if ([self.textField.text isEqualToString:@""]) {
        [self.textField becomeFirstResponder];
        self.labelError.text = @"Please enter valid player name";
    }
    else
    {
        [self.delegateCustom nameChange:self.textField.text];
        [self dismissViewControllerAnimated:true completion:nil];
    }
}


@end
