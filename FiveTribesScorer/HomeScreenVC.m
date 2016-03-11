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
#import "Game.h"

@implementation HomeScreenVC

-(void)viewDidAppear:(BOOL)animated
{
    self.navigationItem.title = @"Five Tribes Score App";
    self.view.backgroundColor = [UIColor colorWithRed:151.0/255 green:80.0/255 blue:8.0/255 alpha:1.0f];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.buttonNewGame.shadowEnabled = true;
    self.buttonHistory.shadowEnabled = true;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSMutableArray *gameHist = [defaults objectForKey:@"gameHistory"];
    //    [defaults removeObjectForKey:@"gameHistory"];
    if (gameHist)
    {
        self.gameHistory = [self turnGameHistoryDataIntoArrayOfObjects:[defaults objectForKey:@"gameHistory"]];
    }
    else
    {
        self.gameHistory = [[NSMutableArray alloc] init];
    }
    
    [[NSNotificationCenter defaultCenter] addObserverForName:@"saveGame" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note)
     {
         [self.gameHistory addObject:note.object];
         [self turnGameHistoryArrayIntoData];
     }];
}

-(void)turnGameHistoryArrayIntoData
{
    NSMutableArray *archiveArray = [[NSMutableArray alloc]init];
    for (Game *gameObject in self.gameHistory) {
        NSData *gameEncodedObject = [NSKeyedArchiver archivedDataWithRootObject:gameObject];
        [archiveArray addObject:gameEncodedObject];
    }
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:archiveArray forKey:@"gameHistory"];
    [defaults synchronize];
}

-(NSMutableArray *)turnGameHistoryDataIntoArrayOfObjects:(NSMutableArray *)dataArray
{
    NSMutableArray *unarchivedArray = [[NSMutableArray alloc]init];
    for (NSData *dataObject in dataArray)
    {
        Game *gameObject = [NSKeyedUnarchiver unarchiveObjectWithData:dataObject];
        [unarchivedArray addObject:gameObject];
    }
    return unarchivedArray;
}

- (IBAction)buttonNewGame:(id)sender
{
    [self performSegueWithIdentifier:@"segueNewGame" sender:self];
    
}

- (IBAction)buttonHistory:(id)sender
{
    [self performSegueWithIdentifier:@"segueHistory" sender:self];
}

-(void)deleteGamesFromHistory:(NSMutableArray *)newHistoryArray
{
    self.gameHistory = newHistoryArray;
    [self turnGameHistoryArrayIntoData];

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"segueHistory"]) {
        HistoryVC *hvc = [segue destinationViewController];
        hvc.gameHistory = self.gameHistory;
        hvc.delegateCustom = self;
    }
    if ([segue.identifier isEqualToString:@"segueNewGame"])
    {
        NewGameVC *ngvc = [segue destinationViewController];
        ngvc.labelError.text = @"Select 2-4 Players";
    }
}

@end



