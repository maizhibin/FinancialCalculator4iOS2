//
//  FCRepaymentListController.h
//  FinancialCalculator4iOS2
//
//  Created by 麦志斌 on 14-4-25.
//  Copyright (c) 2014年 letuu.net. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FCLoan;

@interface FCRepaymentListController : UITableViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) FCLoan *loan;

@end
