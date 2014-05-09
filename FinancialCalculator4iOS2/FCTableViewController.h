//
//  FCTableViewController.h
//  FinancialCalculator4iOS2
//
//  Created by 麦志斌 on 14-4-16.
//  Copyright (c) 2014年 letuu.net. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCPassValueDelegate.h"
#import "FCLoan.h"

@interface FCTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate, FCPassValueDelegate> {

    UIButton *doneInKeyboardButton;

}


@property (weak, nonatomic) IBOutlet UITextField *textLoanBusiness;
@property (weak, nonatomic) IBOutlet UITextField *textLoanPortfolio;
@property (weak, nonatomic) IBOutlet UITableViewCell *loanPeriodCell;
@property (weak, nonatomic) IBOutlet UILabel *labelLoanRate;
@property (weak, nonatomic) IBOutlet UILabel *labelPaymentMethod;
@property (weak, nonatomic) IBOutlet UILabel *labelLoanPeriod;
@property (nonatomic, strong) FCValueObject *valueObject;

@property (nonatomic, unsafe_unretained) id<FCPassValueDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITableView *tvLoanSetting;
@property (weak, nonatomic) IBOutlet UITableViewCell *tvcLoan;


@property LOAN_METHOD loanMethod;

- (IBAction)backgroundTap:(id)sender;

- (void)changeLoanMethod:(LOAN_METHOD)loanMethod;
@end
