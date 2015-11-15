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
        self.winner = NO;
        self.merchandise = [[NSMutableArray alloc]init];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInteger:self.gold forKey:@"gold"];
    [aCoder encodeInteger:self.yellowVizier forKey:@"yellowVizier"];
    [aCoder encodeInteger:self.whiteElder forKey:@"whiteElder"];
    [aCoder encodeInteger:self.palmTrees forKey:@"palmTrees"];
    [aCoder encodeInteger:self.palace forKey:@"palace"];
    [aCoder encodeInteger:self.tiles forKey:@"tiles"];
    [aCoder encodeInteger:self.merchaniseScore forKey:@"merchaniseScore"];
    [aCoder encodeInteger:self.djinnCardScore forKey:@"djinnCardScore"];
    [aCoder encodeInteger:self.totalScore forKey:@"totalScore"];
    [aCoder encodeBool:self.winner forKey:@"winner"];
    [aCoder encodeObject:self.merchandise forKey:@"merchandise"];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [self init];
    self.name = [aDecoder decodeObjectForKey:@"name"];
    self.merchandise = [aDecoder decodeObjectForKey:@"merchandise"];
    self.gold = [aDecoder decodeIntegerForKey:@"gold"];
    self.yellowVizier = [aDecoder decodeIntegerForKey:@"yellowVizier"];
    self.whiteElder = [aDecoder decodeIntegerForKey:@"whiteElder"];
    self.palmTrees = [aDecoder decodeIntegerForKey:@"palmTrees"];
    self.palace = [aDecoder decodeIntegerForKey:@"palace"];
    self.tiles = [aDecoder decodeIntegerForKey:@"tiles"];
    self.merchaniseScore = [aDecoder decodeIntegerForKey:@"merchaniseScore"];
    self.djinnCardScore = [aDecoder decodeIntegerForKey:@"djinnCardScore"];
    self.winner = [aDecoder decodeBoolForKey:@"winner"];
    self.totalScore = [aDecoder decodeIntegerForKey:@"totalScore"];
    
    return self;
}

@end
