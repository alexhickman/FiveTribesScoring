//
//  Game.h
//  FiveTribesScorer
//
//  Created by Hickman on 10/30/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Game : NSObject <NSCoding>

@property (nonatomic) NSInteger numberOfPlayers;
@property (strong, nonatomic) NSMutableArray *currentPlayers;
@property (strong, nonatomic) NSDate *completedDate;
@property (strong, nonatomic) NSString *winningMessage;


+(Game *)newGame:(NSInteger)numberOfPlayers;
- (instancetype)initWithPlayers:(NSInteger)numberOfPlayers;



@end
