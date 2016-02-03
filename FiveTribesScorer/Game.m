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
        self.currentPlayers = [[NSMutableArray alloc]init];
        for (int i = 0; i < numberOfPlayers; i++) {
            [self.currentPlayers addObject:[Player newPlayer]];
        }
        self.ownerOfAlAmin = @"";
        self.ownerOfHaurvatat = @"";
        self.ownerOfJafaar = @"";
        self.ownerOfShamhat = @"";
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInteger:self.numberOfPlayers forKey:@"numberOfPlayers"];
    [aCoder encodeObject:self.completedDate forKey:@"completedDate"];
    [aCoder encodeObject:self.winningMessage forKey:@"winningMessage"];
    
    [aCoder encodeObject:self.ownerOfAlAmin forKey:@"ownerOfAlAmin"];
    [aCoder encodeObject:self.ownerOfHaurvatat forKey:@"ownerOfHaurvatat"];
    [aCoder encodeObject:self.ownerOfJafaar forKey:@"ownerOfJafaar"];
    [aCoder encodeObject:self.ownerOfShamhat forKey:@"ownerOfShamhat"];
    
    NSMutableArray *archiveArray = [[NSMutableArray alloc]init];
    for (Player *playerObject in self.currentPlayers) {
        NSData *playerEncodedObject = [NSKeyedArchiver archivedDataWithRootObject:playerObject];
        [archiveArray addObject:playerEncodedObject];
    }
    [aCoder encodeObject:archiveArray forKey:@"currentPlayers"];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [self init];
    self.numberOfPlayers = [aDecoder decodeIntegerForKey:@"numberOfPlayers"];
    self.completedDate = [aDecoder decodeObjectForKey:@"completedDate"];
    self.winningMessage = [aDecoder decodeObjectForKey:@"winningMessage"];

    NSMutableArray *dataArray = [aDecoder decodeObjectForKey:@"currentPlayers"];
    NSMutableArray *unarchivedArray = [[NSMutableArray alloc]init];
    for (NSData *dataObject in dataArray)
    {
        Player *playerObject = [NSKeyedUnarchiver unarchiveObjectWithData:dataObject];
        [unarchivedArray addObject:playerObject];
    }
    self.currentPlayers = unarchivedArray;

    return self;
}

@end
