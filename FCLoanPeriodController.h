//
//  FCLoanPeriodController.h
//  FinancialCalculator4iOS2
//
//  Created by 麦志斌 on 14-4-16.
//  Copyright (c) 2014年 letuu.net. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCPassValueDelegate.h"

@interface FCLoanPeriodController : UITableViewController <UITableViewDataSource, UITableViewDelegate>


//这里用assign而不用retain是为了防止引起循环引用。
//@property(nonatomic,assign) NSObject<FCPassValueDelegate> *delegate;

@property (nonatomic, unsafe_unretained) id<FCPassValueDelegate> delegate;

@end
