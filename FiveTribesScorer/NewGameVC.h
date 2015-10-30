//
//  NewGameVC.h
//  FiveTribesScorer
//
//  Created by Hickman on 10/29/15.
//  Copyright © 2015 Hickman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewGameVC : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableViewNewGame;

@end
