//
//  FCRootViewController.h
//  FinancialCalculator4iOS2
//
//  Created by 麦志斌 on 14-4-22.
//  Copyright (c) 2014年 letuu.net. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCPassValueDelegate.h"
#import "GADBannerView.h"

@class FCLoan;

@interface FCRootViewController : UIViewController<FCPassValueDelegate>


- (IBAction)calculateRepaymentAmount:(id)sender;
//- (NSInteger) getLoanPeriod:(NSString *)value;
//- (float) getLoanRates:(NSString *)value;

@property (nonatomic, strong) FCValueObject *valueObject;
@property (nonatomic, strong) FCLoan *loan;

@end
