//
//  Scoring.m
//  FiveTribesScorer
//
//  Created by Hickman on 11/16/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import "Scoring.h"

@implementation Scoring

+(NSMutableArray *)calculateMerchandiseSetsWith:(NSMutableArray *)merchandiseCards numberOfFakirs:(NSInteger)fakirCount hasAlAminDjinn:(BOOL)includeFakirs
{
    NSMutableArray *sortedCards = [[NSMutableArray alloc]init];
    NSInteger numberOfWilds = (fakirCount / 2);
    
    //eliminate zero values
    for (NSNumber *ammountOfCards in merchandiseCards)
    {
        if (ammountOfCards.intValue == 0)
        {
            NSLog(@"zero value");
            continue;
        }
        else
        {
            [sortedCards addObject:ammountOfCards];
        }
    }
    
    //order cards
    NSSortDescriptor *highestToLowest = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:NO];
    [sortedCards sortUsingDescriptors:[NSArray arrayWithObject:highestToLowest]];
    
    //add wild cards to merchandise for Djinn Al-Amin end score
    if (includeFakirs == YES)
    {
        while (sortedCards.count < 9 && numberOfWilds > 0)
        {
            [sortedCards addObject:[NSNumber numberWithInteger:1]];
            numberOfWilds--;
        }
        
        //At this point array is full up to index 8
        for (int i = 8; numberOfWilds > 0; i--)
        {
            if (i > 5)
            {
                if ([[sortedCards objectAtIndex:i] compare: [NSNumber numberWithInteger: 2]] == NSOrderedSame)
                {
                    continue;
                }
            }
            else if (i > 2 && i <= 5)
            {
                if ([[sortedCards objectAtIndex:i] compare: [NSNumber numberWithInteger: 4]] == NSOrderedSame)
                {
                    continue;
                }
            }
            else if (i >= 0 && i <= 3)
            {
                if ([[sortedCards objectAtIndex:i] compare: [NSNumber numberWithInteger: 6]] == NSOrderedSame)
                {
                    if (numberOfWilds > 0)
                    {
                        i = 8;
                        continue;
                    }
                }
            }
            //just incase
            else if (i < 0)
            {
                break;
            }
            
            NSNumber *newValue = [NSNumber numberWithInteger:((NSNumber*)[sortedCards objectAtIndex:i]).integerValue + 1];
            [sortedCards replaceObjectAtIndex:i withObject:newValue];
            numberOfWilds--;
        }
    }
    
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
        [sortedCards removeObjectAtIndex:i - 1];
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

+ (NSInteger)calculatePlayerScoreWith:(Player *)currentPlayer
{
    NSInteger yellowVizierPoints;
    NSInteger whiteElderPoints;
    NSInteger palmTreePoints;
    NSInteger merchPoints;
    NSInteger palacePoints = currentPlayer.palaces * 5;
    
    if (currentPlayer.hasAlAmin)
    {
        merchPoints = currentPlayer.merchandiseScoreWithFakirs;
    }
    else
    {
        merchPoints = currentPlayer.merchandiseScore;
    }
    
    if (currentPlayer.hasJafaar)
    {
        yellowVizierPoints = currentPlayer.yellowVizier * 3;
    }
    else
    {
        yellowVizierPoints = currentPlayer.yellowVizier;
    }
    
    if (currentPlayer.hasShamhat)
    {
        whiteElderPoints = currentPlayer.whiteElder * 4;
    }
    else
    {
        whiteElderPoints = currentPlayer.whiteElder * 2;
    }
    
    if (currentPlayer.hasHaurvatat)
    {
        palmTreePoints = currentPlayer.palmTrees * 5;
    }
    else
    {
        palmTreePoints = currentPlayer.palmTrees * 3;
    }
    
    NSInteger playerScore = currentPlayer.gold + yellowVizierPoints + whiteElderPoints + palmTreePoints + palacePoints + merchPoints + currentPlayer.tiles + currentPlayer.djinnCardScore;
    
    return playerScore;
}

@end
