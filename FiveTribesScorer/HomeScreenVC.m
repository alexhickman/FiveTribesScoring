//
//  HomeScreenVC.m
//  FiveTribesScorer
//
//  Created by Hickman on 10/29/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import "HomeScreenVC.h"
#import "HistoryVC.h"
#import "NewGameVC.h"

@implementation HomeScreenVC

- (IBAction)buttonNewGame:(id)sender {
    [self performSegueWithIdentifier:@"segueNewGame" sender:self];
}

- (IBAction)buttonHistory:(id)sender {
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NewGameVC *ngvc = [segue destinationViewController];
    
}

@end



