//
//  ManualInputVC.h
//  FiveTribesScorer
//
//  Created by Hickman on 10/31/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol manualInputProtocol

-(void)valueChosen:(NSInteger)newRow currentComponent:(NSInteger)component;

@end

@interface ManualInputVC : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *labelError;

@property (strong, nonatomic) id <manualInputProtocol> delegateCustom;
@property (nonatomic) NSInteger component;


@end
