//
//  FCRepaymentDetailViewController.h
//  FinancialCalculator4iOS2
//
//  Created by 麦志斌 on 14-4-22.
//  Copyright (c) 2014年 letuu.net. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FCLoan;

@interface FCRepaymentDetailViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UILabel *labelTotalLoan;
@property (weak, nonatomic) IBOutlet UILabel *labelRepaymentAmount;
@property (weak, nonatomic) IBOutlet UILabel *labelLoanPeriod;
@property (weak, nonatomic) IBOutlet UILabel *labelInterestAmount;
@property (weak, nonatomic) IBOutlet UILabel *labelRepaymentMonthly;

@property (nonatomic, strong) FCLoan *loan;
@property (nonatomic, strong) NSMutableArray *repaymentDetailList;

@end
