//
//  Scoring.h
//  FiveTribesScorer
//
//  Created by Hickman on 11/16/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Scoring : NSObject

+(NSMutableArray *)calculateMerchandiseSets:(NSMutableArray *)merchandiseCards;
+(NSInteger)calculateMerchandiseScoreWith:(NSMutableArray *)merchandiseCardSets;

@end
