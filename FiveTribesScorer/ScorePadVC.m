//
//  ScorePadVC.m
//  FiveTribesScorer
//
//  Created by Hickman on 3/11/16.
//  Copyright © 2016 Hickman. All rights reserved.
//

#import "ScorePadVC.h"
#import "Player.h"

@interface ScorePadVC ()

@end

@implementation ScorePadVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:151.0/255 green:80.0/255 blue:8.0/255 alpha:1.0f];
    for (int i = 0; self.currentGame.numberOfPlayers > i; i++)
    {
        if (i == 0)
        {
            self.labelPlayerOne.text = ((Player *)(self.currentGame.currentPlayers[i])).name;
        }
        else if (i == 1)
        {
            self.labelPlayerTwo.text = ((Player *)(self.currentGame.currentPlayers[i])).name;
        }
        else if (i == 2)
        {
            self.labelPlayerTwo.text = ((Player *)(self.currentGame.currentPlayers[i])).name;
        }
        else if (i == 3)
        {
            self.labelPlayerTwo.text = ((Player *)(self.currentGame.currentPlayers[i])).name;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchedScreen:(id)sender
{
    NSLog(@"tap tap");
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
