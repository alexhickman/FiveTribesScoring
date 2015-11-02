//
//  Player.m
//  FiveTribesScorer
//
//  Created by Hickman on 10/30/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import "Player.h"

@implementation Player

+(Player *)newPlayer
{
    Player *newPlayer = [[Player alloc]initWithTheThings];
    return newPlayer;
}

- (instancetype)initWithTheThings
{
    self = [super init];
    if (self) {
        self.gold = 0;
        self.yellowVizier = 0;
        self.whiteElder = 0;
        self.palmTrees = 0;
        self.palace = 0;
        self.tiles = 0;
        self.merchaniseScore = 0;
        self.djinnCardScore = 0;
        self.totalScore = 0;
        self.merchandise = [[NSMutableArray alloc]init];
    }
    return self;
}




@end
