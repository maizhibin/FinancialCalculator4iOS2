//
//  FCValueObject.h
//  FinancialCalculator4iOS2
//
//  Created by 麦志斌 on 14-4-16.
//  Copyright (c) 2014年 letuu.net. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FCValueObject : NSObject

// 贷款方式
@property (nonatomic, strong) NSString *loanMethod;

// 贷款期限
@property (nonatomic, strong) NSString *loanPeriod;

// 利率
@property (nonatomic, strong) NSString *loanRate;

// 还款方式
@property (nonatomic, strong) NSString *repaymentMethod;

@end

