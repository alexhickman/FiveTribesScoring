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
    self.view.backgroundColor = [UIColor brownColor];
}
- (IBAction)buttonSubmit:(id)sender
{
    NSInteger valueEntered = (self.textField.text).integerValue;
    if (self.component == 0 || self.component == 5)
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
