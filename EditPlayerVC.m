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
    self.textField.text = self.buttonName;
}

- (IBAction)buttonClear:(id)sender
{
    [self.delegateCustom nameChange:@"+ New Player"];
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)buttonSubmit:(id)sender
{
    [self.delegateCustom nameChange:self.textField.text];
    [self dismissViewControllerAnimated:true completion:nil];
}


@end
