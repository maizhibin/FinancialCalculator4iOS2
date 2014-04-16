//
//  FCPassValueDelegate.h
//  FinancialCalculator4iOS2
//
//  Created by 麦志斌 on 14-4-16.
//  Copyright (c) 2014年 letuu.net. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FCValueObject.h"

@protocol FCPassValueDelegate <NSObject>

-(void)passValue:(FCValueObject *)value;

@end
