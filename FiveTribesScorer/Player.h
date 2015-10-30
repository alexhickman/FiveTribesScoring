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
@property (nonatomic) int gold;
@property (nonatomic) int yellowVizier;
@property (nonatomic) int whiteElder;
@property (nonatomic) int palmTrees;
@property (nonatomic) int palace;
@property (nonatomic) int tiles;
@property (nonatomic) int merchaniseScore;
@property (nonatomic) int djinnCardScore;
@property (nonatomic) int totalScore;

+(Player *)newPlayer;




@end
