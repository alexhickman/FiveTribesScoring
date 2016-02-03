//
//  Player.h
//  FiveTribesScorer
//
//  Created by Hickman on 10/30/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject <NSCoding>

@property (strong, nonatomic) NSString *name;

@property (strong, nonatomic) NSMutableArray *merchandiseCards;
@property (strong, nonatomic) NSMutableArray *merchSets;
@property (nonatomic) NSInteger merchandiseScore;
@property (nonatomic) NSInteger fakirs;
@property (nonatomic) NSInteger merchandiseScoreWithFakirs;
@property (strong, nonatomic) NSMutableArray *merchSetsWithFakirs;

@property (nonatomic) BOOL hasAlAmin;
@property (nonatomic) BOOL hasHaurvatat;
@property (nonatomic) BOOL hasJafaar;
@property (nonatomic) BOOL hasShamhat;

@property (nonatomic) NSInteger gold;
@property (nonatomic) NSInteger yellowVizier;
@property (nonatomic) NSInteger whiteElder;
@property (nonatomic) NSInteger palmTrees;
@property (nonatomic) NSInteger palaces;
@property (nonatomic) NSInteger tiles;
@property (nonatomic) NSInteger djinnCardScore;
@property (nonatomic) NSInteger totalScore;
@property (nonatomic) BOOL winner;

+(Player *)newPlayer;




@end
