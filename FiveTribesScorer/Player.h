//
//  Player.h
//  FiveTribesScorer
//
//  Created by Hickman on 10/30/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (strong, nonatomic) NSString *name;

@property (strong, nonatomic) NSMutableArray *merchandise;
@property (nonatomic) NSInteger gold;
@property (nonatomic) NSInteger yellowVizier;
@property (nonatomic) NSInteger whiteElder;
@property (nonatomic) NSInteger palmTrees;
@property (nonatomic) NSInteger palace;
@property (nonatomic) NSInteger tiles;
@property (nonatomic) NSInteger merchaniseScore;
@property (nonatomic) NSInteger djinnCardScore;
@property (nonatomic) NSInteger totalScore;

+(Player *)newPlayer;




@end
