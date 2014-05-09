//
//  FCLoanRateController.h
//  FinancialCalculator4iOS2
//
//  Created by 麦志斌 on 14-4-22.
//  Copyright (c) 2014年 letuu.net. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCPassValueDelegate.h"

@class FCLoan;

@interface FCLoanRateController : UITableViewController

@property (nonatomic, strong) FCValueObject *valueObject;
@property (nonatomic, strong) FCLoan *loan;
@property (nonatomic, unsafe_unretained) id<FCPassValueDelegate> delegate;


@end
