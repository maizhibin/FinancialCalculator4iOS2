//
//  FCRootViewController.m
//  FinancialCalculator4iOS2
//
//  Created by 麦志斌 on 14-4-22.
//  Copyright (c) 2014年 letuu.net. All rights reserved.
//

#import "FCRootViewController.h"
#import "FCLoan.h"
#import "FCTableViewController.h"
#import "FCRepaymentDetailViewController.h"
#import "FCLoanRateController.h"

@interface FCRootViewController ()


@end

@implementation FCRootViewController




#define MY_BANNER_UNIT_ID @"a1535e1d6e4e8dc"
#define MY_DEVICE_ID_IPHONE5S @"21f3773a9e085798c9d446aca1db7a9c"

// 将其中一个声明为实例变量
GADBannerView *bannerView_;

@synthesize labelLoanRateMemo;
@synthesize segChangeLoanMethod;

@synthesize valueObject;
@synthesize loan;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    NSLog(@"viewDidLoad");

    if (self.segChangeLoanMethod.selectedSegmentIndex == 0) {
        self.labelLoanRateMemo.hidden = YES;
        self.labelLoanRateMemo.hidden = YES;
    } else {
        self.labelLoanRateMemo.hidden = NO;
        self.labelLoanRateMemo.hidden = NO;
    }

    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"%@", [segue identifier]);
    
    if ([[segue identifier] isEqualToString:@"loanSettingSegue"]) {
        FCTableViewController *secondViewController = [segue destinationViewController];
        secondViewController.delegate = self;
//        secondViewController.valueObject = self.valueObject;

        NSLog(@"%@", secondViewController.valueObject.loanPeriod);
        NSLog(@"%@", secondViewController.valueObject.loanRate);
        NSLog(@"%@", secondViewController.valueObject.repaymentMethod);
    }

    if ([[segue identifier] isEqualToString:@"loanRateSegue"]) {
        FCLoanRateController *secondViewController = [segue destinationViewController];
        secondViewController.delegate = self;
        secondViewController.loan = self.loan;

    }
    if ([[segue identifier] isEqualToString:@"calculateRepaymentAmountSegue"]) {
        FCRepaymentDetailViewController *secondViewController = [segue destinationViewController];
        secondViewController.loan = self.loan;
    }
}


//实现协议，在第一个窗口显示在第二个窗口输入的值，类似Android中的onActivityResult方法
-(void)passValue:(FCValueObject *)value
{
    NSLog(@"回传的贷款周期为 %@", value.loanPeriod);
    NSLog(@"回传的贷款利率为 %@", value.loanRate);
    NSLog(@"回传的还款方式为 %@", value.repaymentMethod);
//
    if (valueObject == nil) {
        self.valueObject = [[FCValueObject alloc] init];
    }
    self.valueObject.loanPeriod = value.loanPeriod;
    self.valueObject.loanRate = value.loanRate;
    self.valueObject.repaymentMethod = value.repaymentMethod;
    self.valueObject.loanAmountBusiness = value.loanAmountBusiness;
}

- (float) getLoanRates: (NSString *)value {
    return 6.55L;
}

- (NSInteger) getLoanPeriod: (NSString *)value {
    return 360;
}


- (IBAction)calculateRepaymentAmount:(id)sender{
    NSLog(@"%@", @"calculateRepaymentAmount");
    NSLog(@"%@", self.valueObject.loanPeriod);
    NSLog(@"%@", self.valueObject.loanRate);
    NSLog(@"%@", self.valueObject.repaymentMethod);
    // 贷款总月数
    NSInteger loanPeriodMonths = [self getLoanPeriod:self.valueObject.loanPeriod];
    // 年利率
    float loanRates = [self getLoanRates:self.valueObject.loanRate];
    float totalLoan = [self.valueObject.loanAmountBusiness floatValue] * 10000;
    
    NSInteger loanMethod;
    if ([self.valueObject.repaymentMethod isEqualToString:@"等额本息"]) {
        loanMethod = INTEREST;
    } else {
        loanMethod = PRINCIPAL;
    }

    self.loan = [FCLoan initLoan:BUSINESS
                       totalLoan:totalLoan
                      loanPeriod:loanPeriodMonths
                       loanRates:loanRates
                 repaymentMethod:loanMethod];
    // 开始计算
    [self.loan calculateRepaymentAmount];
    // 总还款额
    //    self.repaymentAmountField.text = [[NSString alloc] initWithFormat:@"%.0f", self.loan.repaymentAmount];
    // 总利息
    //    self.interestAmountField.text = [[NSString alloc] initWithFormat:@"%.0f", self.loan.interestAmount];

    //    [self.buttonViewRepaymentDetailList setHidden:false];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.screenName = @"房贷计算器主界面";
}


- (IBAction)changeLoanMethod:(id)sender {
    NSLog(@"%ld", (long)[sender selectedSegmentIndex]);

    FCTableViewController *controller = [[self childViewControllers] objectAtIndex:0];
    [controller changeLoanMethod:RESERVE];
    if ([sender selectedSegmentIndex] == 0) {
        labelLoanRateMemo.hidden = YES;
    } else if ([sender selectedSegmentIndex] == 1) {
        labelLoanRateMemo.hidden = NO;
        [controller changeLoanMethod:BUSINESS];
    } else if ([sender selectedSegmentIndex] == 2) {
        labelLoanRateMemo.hidden = NO;
        [controller changeLoanMethod:PORTFOLIO];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
