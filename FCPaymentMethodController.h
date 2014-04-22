//
//  FCPaymentMethodController.h
//  FinancialCalculator4iOS2
//
//  Created by 麦志斌 on 14-4-22.
//  Copyright (c) 2014年 letuu.net. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCPassValueDelegate.h"

@interface FCPaymentMethodController : UITableViewController

@property (nonatomic, strong) FCValueObject *valueObject;
@property (nonatomic, unsafe_unretained) id<FCPassValueDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITableViewCell *tVCellMethod1;
@property (weak, nonatomic) IBOutlet UITableViewCell *tVCellMethod2;

@end
