//
//  FCTableViewController.h
//  FinancialCalculator4iOS2
//
//  Created by 麦志斌 on 14-4-16.
//  Copyright (c) 2014年 letuu.net. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCPassValueDelegate.h"

@interface FCTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate, FCPassValueDelegate>

@property (weak, nonatomic) IBOutlet UITableViewCell *loanPeriodCell;
@property (weak, nonatomic) IBOutlet UILabel *labelLoanPeriod;

@end
