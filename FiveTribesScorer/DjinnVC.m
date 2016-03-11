//
//  DjinnVC.m
//  FiveTribesScorer
//
//  Created by Hickman on 11/16/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import "DjinnVC.h"

@interface DjinnVC ()


@end

@implementation DjinnVC

{
Player *player;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    player = [[Player alloc] init];
    player = self.currentPlayer;
    self.view.backgroundColor = [UIColor colorWithRed:151.0/255 green:80.0/255 blue:8.0/255 alpha:1.0f];
}

- (void)viewWillAppear:(BOOL)animated
{
    //Checks ownership of AlAmin
    if (![self.ownerOfAlAmin isEqualToString:@""] && ![self.ownerOfAlAmin isEqualToString:self.currentPlayer.name])
    {
        self.switchAlAmin.hidden = true;
        self.labelAlAminOwner.hidden = false;
        self.labelAlAminOwner.text = [NSString stringWithFormat:@"%@\n has this Djinn", self.ownerOfAlAmin];
    }
    else if (self.currentPlayer.hasAlAmin)
    {
        self.switchAlAmin.on = true;
    }
    
    //Checks ownership of Haurvatat
    if (![self.ownerOfHaurvatat isEqualToString:@""] && ![self.ownerOfHaurvatat isEqualToString:self.currentPlayer.name])
    {
        self.switchHaurvatat.hidden = true;
        self.labelHaurvatatOwner.hidden = false;
        self.labelHaurvatatOwner.text = [NSString stringWithFormat:@"%@\n has this Djinn", self.ownerOfHaurvatat];
    }
    else if (self.currentPlayer.hasHaurvatat)
    {
        self.switchHaurvatat.on = true;
    }
    
    //Checks ownership of Jafaar
    if (![self.ownerOfJafaar isEqualToString:@""] && ![self.ownerOfJafaar isEqualToString:self.currentPlayer.name])
    {
        self.switchJafaar.hidden = true;
        self.labelJafaarOwner.hidden = false;
        self.labelJafaarOwner.text = [NSString stringWithFormat:@"%@\n has this Djinn", self.ownerOfJafaar];
    }
    else if (self.currentPlayer.hasJafaar)
    {
        self.switchJafaar.on = true;
    }
    
    //Checks ownership of Shamhat
    if (![self.ownerOfShamhat isEqualToString:@""] && ![self.ownerOfShamhat isEqualToString:self.currentPlayer.name])
    {
        self.switchShamhat.hidden = true;
        self.labelShamhatOwner.hidden = false;
        self.labelShamhatOwner.text = [NSString stringWithFormat:@"%@\n has this Djinn", self.ownerOfShamhat];
    }
    else if (self.currentPlayer.hasShamhat)
    {
        self.switchShamhat.on = true;
    }
}

- (IBAction)touchSwitchAlAmin:(id)sender
{
    if (![self.switchAlAmin isOn]) {
        player.hasAlAmin = false;
    }
    else
    {
        player.hasAlAmin = true;
    }
}

- (IBAction)touchSwitchHaurvatat:(id)sender
{
    if (![self.switchHaurvatat isOn]) {
        self.currentPlayer.hasHaurvatat = false;
    }
    else
    {
        self.currentPlayer.hasHaurvatat = true;
    }
}

- (IBAction)touchSwitchJafaar:(id)sender
{
    if (![self.switchJafaar isOn]) {
        self.currentPlayer.hasJafaar = false;
    }
    else
    {
        self.currentPlayer.hasJafaar = true;
    }
}

- (IBAction)touchSwitchShamhat:(id)sender
{
    if (![self.switchShamhat isOn]) {
        self.currentPlayer.hasShamhat = false;
    }
    else
    {
        self.currentPlayer.hasShamhat = true;
    }
}

- (IBAction)buttonCancel:(id)sender
{
    [self.navigationController popViewControllerAnimated:true];
//    [self.delegateCustom passingDjinnBack:player];
}

- (IBAction)buttonSave:(id)sender
{
    [self.delegateCustom passingDjinnBack:self.currentPlayer];
    [self.navigationController popViewControllerAnimated:true];
}

@end
