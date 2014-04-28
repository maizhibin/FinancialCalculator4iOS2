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

@interface FCRootViewController ()


@end

@implementation FCRootViewController

#define MY_BANNER_UNIT_ID @"a1535e1d6e4e8dc"


// 将其中一个声明为实例变量
GADBannerView *bannerView_;

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


    [super viewDidLoad];

    NSLog(@"viewDidLoad");

    // 在屏幕顶部创建标准尺寸的视图。
    // 在GADAdSize.h中对可用的AdSize常量进行说明。
    bannerView_ = [[GADBannerView alloc] initWithAdSize:kGADAdSizeFullBanner];

    // 指定广告单元ID。
    bannerView_.adUnitID = MY_BANNER_UNIT_ID;

    // 告知运行时文件，在将用户转至广告的展示位置之后恢复哪个UIViewController
    // 并将其添加至视图层级结构。
    bannerView_.rootViewController = self;
    [self.view addSubview:bannerView_];

    GADRequest *request = [GADRequest request];

// Make the request for a test ad. Put in an identifier for
// the simulator as well as any devices you want to receive test ads.
    request.testing = true;
    request.testDevices = [NSArray arrayWithObjects:GAD_SIMULATOR_ID, nil];

    // 启动一般性请求并在其中加载广告。
    [bannerView_ loadRequest:request];


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

    if ([[segue identifier] isEqualToString:@"loanSettingSegue"]) {

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
    //    float totalLoan = [self.totalLoanField.text floatValue] * 10000;
    float totalLoan = 550000;
    
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
