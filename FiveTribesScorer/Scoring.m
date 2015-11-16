//
//  Scoring.m
//  FiveTribesScorer
//
//  Created by Hickman on 11/16/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import "Scoring.h"

@implementation Scoring

+(NSMutableArray *)calculateMerchandiseSets:(NSMutableArray *)merchandiseCards
{
    NSMutableArray *sortedCards = [[NSMutableArray alloc]init];
    NSInteger currentIndex = 0;
    
    //eliminate zero values
    for (NSNumber *ammountOfCards in merchandiseCards)
    {
        if (ammountOfCards.intValue == 0)
        {
            NSLog(@"zero value");
            continue;
        }
        else if (sortedCards.count == 0)
        {
            [sortedCards addObject:ammountOfCards];
            currentIndex = 0;
        }
        else
        {
            [sortedCards addObject:ammountOfCards];
            currentIndex++;
        }
    }
    
    //order cards
    NSSortDescriptor *highestToLowest = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:NO];
    [sortedCards sortUsingDescriptors:[NSArray arrayWithObject:highestToLowest]];
    
    //determine set sizes
    NSMutableArray *arrayOfSetSizes = [[NSMutableArray alloc]init];
    NSUInteger arraySize = sortedCards.count;
    for (NSUInteger i = arraySize; i > 0 ; i--) {
        while ([[sortedCards objectAtIndex:i-1] compare: [NSNumber numberWithInteger: 0]] != NSOrderedSame)
        {
            [arrayOfSetSizes addObject:[NSNumber numberWithInteger:sortedCards.count]];
            for (int j = 0; j < i; j++)
            {
                NSNumber *newValue = [NSNumber numberWithInteger:((NSNumber*)[sortedCards objectAtIndex:j]).integerValue - 1];
                [sortedCards replaceObjectAtIndex:j withObject:newValue];
            }
        }
        [sortedCards removeObjectAtIndex:i -1];
    }
    return arrayOfSetSizes;
}

+(NSInteger)calculateMerchandiseScoreWith:(NSMutableArray *)merchandiseCardSets
{
    NSInteger merchandiseScore = 0;
    NSMutableArray *arrayOfSetSizes = merchandiseCardSets;
    for (int i = 0; i < arrayOfSetSizes.count; i++) {
        NSInteger currentSize = [[arrayOfSetSizes objectAtIndex:i] integerValue];
        if (currentSize == 9)
        {
            merchandiseScore = merchandiseScore + 60;
        }
        else if (currentSize == 8)
        {
            merchandiseScore = merchandiseScore + 50;
        }
        else if (currentSize == 7)
        {
            merchandiseScore = merchandiseScore + 40;
        }
        else if (currentSize == 6)
        {
            merchandiseScore = merchandiseScore + 30;
        }
        else if (currentSize == 5)
        {
            merchandiseScore = merchandiseScore + 21;
        }
        else if (currentSize == 4)
        {
            merchandiseScore = merchandiseScore + 13;
        }
        else if (currentSize == 3)
        {
            merchandiseScore = merchandiseScore + 7;
        }
        else if (currentSize == 2)
        {
            merchandiseScore = merchandiseScore + 3;
        }
        else if (currentSize == 1)
        {
            merchandiseScore = merchandiseScore + 1;
        }
    }
    return merchandiseScore;
}



@end
