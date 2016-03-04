//
//  DjinnVC.m
//  FiveTribesScorer
//
//  Created by Hickman on 11/16/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import "DjinnVC.h"
#import "DjinnTVCell.h"

@interface DjinnVC ()

@end

@implementation DjinnVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
}

- (IBAction)touchSwitchAlAmin:(id)sender {
}

- (IBAction)touchSwitchHaurvatat:(id)sender {
}

- (IBAction)touchSwitchJafaar:(id)sender {
}

- (IBAction)touchSwitchShamhat:(id)sender {
}

- (IBAction)buttonCancel:(id)sender
{
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)buttonSave:(id)sender
{
    [self.delegateCustom passingDjinnBack:self.currentPlayer];
    [self.navigationController popViewControllerAnimated:true];
}


@end
