//
//  Game.m
//  FiveTribesScorer
//
//  Created by Hickman on 10/30/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import "Game.h"
#import "Player.h"

@implementation Game

+(Game *)newGame:(NSInteger)numberOfPlayers
{
    Game *newGame = [[Game alloc]initWithPlayers:numberOfPlayers];
    return newGame;
}

- (instancetype)initWithPlayers:(NSInteger)numberOfPlayers
{
    self = [super init];
    if (self) {
        NSMutableArray *arrayOfPlayers = [[NSMutableArray alloc]init];
        for (int i = 0; i < numberOfPlayers; i++) {
            [arrayOfPlayers addObject:[Player newPlayer]];
        }
    }
    return self;
}


@end
