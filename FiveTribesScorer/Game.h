//
//  Game.h
//  FiveTribesScorer
//
//  Created by Hickman on 10/30/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Game : NSObject

@property (nonatomic) NSInteger numberOfPlayers;

+(Game *)newGame:(NSInteger)numberOfPlayers;
- (instancetype)initWithPlayers:(NSInteger)numberOfPlayers;

@property (strong, nonatomic) NSMutableArray *currentPlayers;

@end
