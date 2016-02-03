//
//  Scoring.h
//  FiveTribesScorer
//
//  Created by Hickman on 11/16/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface Scoring : NSObject

+(NSMutableArray *)calculateMerchandiseSetsWith:(NSMutableArray *)merchandiseCards numberOfFakirs:(NSInteger)fakirCount hasAlAminDjinn:(BOOL)includeFakirs;
+(NSInteger)calculateMerchandiseScoreWith:(NSMutableArray *)merchandiseCardSets;

+(NSInteger)calculatePlayerScoreWith:(Player *)currentPlayer;

@end
