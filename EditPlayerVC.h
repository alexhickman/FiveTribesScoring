//
//  EditPlayerVC.h
//  FiveTribesScorer
//
//  Created by Hickman on 10/30/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <KBRoundedButton/KBRoundedButton.h>

@protocol editPlayerDelegate

-(void)nameChange:(NSString *)message;

@end

@interface EditPlayerVC : UIViewController <UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet KBRoundedButton *buttonSubmit;
@property (weak, nonatomic) IBOutlet KBRoundedButton *buttonRemove;
@property (weak, nonatomic) IBOutlet KBRoundedButton *buttonCancel;

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property(strong, nonatomic) id <editPlayerDelegate> delegateCustom;

@property (strong, nonatomic) NSString *playerOneName;
@property (strong, nonatomic) NSString *playerTwoName;
@property (strong, nonatomic) NSString *playerThreeName;
@property (strong, nonatomic) NSString *playerFourName;

@property (strong, nonatomic) NSString *currentPlayerInButton;
@property (strong, nonatomic) NSString *buttonName;
@property (weak, nonatomic) IBOutlet UILabel *labelError;

@end
