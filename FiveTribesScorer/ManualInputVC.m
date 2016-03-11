//
//  ManualInputVC.m
//  FiveTribesScorer
//
//  Created by Hickman on 10/31/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import "ManualInputVC.h"

@implementation ManualInputVC

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.textField becomeFirstResponder];
    self.view.backgroundColor = [UIColor colorWithRed:151.0/255 green:80.0/255 blue:8.0/255 alpha:1.0f];
}

- (IBAction)buttonSubmit:(id)sender
{
    NSInteger valueEntered = (self.textField.text).integerValue;
    if (self.component == 0 || self.component == 3 || self.component == 6)
    {
        if (valueEntered <= 100)
        {
            [self.delegateCustom valueChosen:valueEntered currentComponent:self.component];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        else
        {
            self.labelError.text = @"Not Valid Amount";
            self.textField.text = @"";
        }
    }
    else
    {
        if (valueEntered <= 10)
        {
            [self.delegateCustom valueChosen:valueEntered currentComponent:self.component];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        else
        {
            self.labelError.text = @"Not Valid Amount";
            self.textField.text = @"";
        }
    }
}

- (IBAction)buttonCancel:(id)sender
{
    [self.delegateCustom valueChosen:0 currentComponent:self.component];
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
