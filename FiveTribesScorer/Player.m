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
        self.palaces = 0;
        self.tiles = 0;
        self.djinnCardScore = 0;
        self.hasAlAmin = false;
        self.hasHaurvatat = false;
        self.hasJafaar = false;
        self.hasShamhat = false;
        self.totalScore = 0;
        self.winner = NO;
        NSMutableArray *merch = [[NSMutableArray alloc]init];
        for (int i = 0; i < 9; i++)
        {
            NSNumber *zero = [NSNumber numberWithInteger:0];
            [merch addObject:zero];
        }
        self.merchandiseCards = merch;
        self.merchSets = [[NSMutableArray alloc]init];
        self.merchandiseScore = 0;
        self.fakirs = 0;
        self.merchandiseScoreWithFakirs = 0;
        self.merchSetsWithFakirs = [[NSMutableArray alloc]init];
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
    [aCoder encodeInteger:self.palaces forKey:@"palaces"];
    [aCoder encodeInteger:self.tiles forKey:@"tiles"];
    [aCoder encodeInteger:self.djinnCardScore forKey:@"djinnCardScore"];
    [aCoder encodeBool:self.winner forKey:@"winner"];
    [aCoder encodeInteger:self.totalScore forKey:@"totalScore"];
    
    [aCoder encodeBool:self.hasAlAmin forKey:@"hasAlAmin"];
    [aCoder encodeBool:self.hasHaurvatat forKey:@"hasHaurvatat"];
    [aCoder encodeBool:self.hasJafaar forKey:@"hasJafaar"];
    [aCoder encodeBool:self.hasShamhat forKey:@"hasShamhat"];
    
    [aCoder encodeInteger:self.merchandiseScore forKey:@"merchandiseScore"];
    [aCoder encodeObject:self.merchandiseCards forKey:@"merchandiseCards"];
    [aCoder encodeObject:self.merchSets forKey:@"merchSets"];
    [aCoder encodeInteger:self.fakirs forKey:@"fakirs"];
    [aCoder encodeInteger:self.merchandiseScoreWithFakirs forKey:@"merchandiseScoreWithFakirs"];
    [aCoder encodeObject:self.merchSetsWithFakirs forKey:@"merchSetsWithFakirs"];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [self init];
    self.name = [aDecoder decodeObjectForKey:@"name"];
    self.gold = [aDecoder decodeIntegerForKey:@"gold"];
    self.yellowVizier = [aDecoder decodeIntegerForKey:@"yellowVizier"];
    self.whiteElder = [aDecoder decodeIntegerForKey:@"whiteElder"];
    self.palmTrees = [aDecoder decodeIntegerForKey:@"palmTrees"];
    self.palaces = [aDecoder decodeIntegerForKey:@"palaces"];
    self.tiles = [aDecoder decodeIntegerForKey:@"tiles"];
    self.djinnCardScore = [aDecoder decodeIntegerForKey:@"djinnCardScore"];
    self.winner = [aDecoder decodeBoolForKey:@"winner"];
    self.totalScore = [aDecoder decodeIntegerForKey:@"totalScore"];
    
    self.hasAlAmin = [aDecoder decodeBoolForKey:@"hasAlAmin"];
    self.hasHaurvatat = [aDecoder decodeBoolForKey:@"hasHaurvatat"];
    self.hasJafaar = [aDecoder decodeBoolForKey:@"hasJafaar"];
    self.hasShamhat = [aDecoder decodeBoolForKey:@"hasShamhat"];
    
    self.merchandiseScore = [aDecoder decodeIntegerForKey:@"merchandiseScore"];
    self.merchandiseCards = [aDecoder decodeObjectForKey:@"merchandiseCards"];
    self.merchSets = [aDecoder decodeObjectForKey:@"merchSets"];
    self.fakirs = [aDecoder decodeIntegerForKey:@"fakirs"];
    self.merchandiseScoreWithFakirs = [aDecoder decodeIntegerForKey:@"merchandiseScoreWithFakirs"];
    self.merchSetsWithFakirs = [aDecoder decodeObjectForKey:@"merchSetsWithFakirs"];
    
    return self;
}

@end
