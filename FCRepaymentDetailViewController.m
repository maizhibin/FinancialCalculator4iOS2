//
//  FCRepaymentDetailViewController.m
//  FinancialCalculator4iOS2
//
//  Created by 麦志斌 on 14-4-22.
//  Copyright (c) 2014年 letuu.net. All rights reserved.
//

#import "FCRepaymentDetailViewController.h"
#import "FCLoan.h"
#import "FCRepaymentListController.h"
#import "FCRepaymentDetail.h"
#import "GADBannerView.h"

@interface FCRepaymentDetailViewController ()

@end

@implementation FCRepaymentDetailViewController


#define MY_BANNER_UNIT_ID @"a1535e1d6e4e8dc"
#define MY_DEVICE_ID_IPHONE5S @"21f3773a9e085798c9d446aca1db7a9c"

// 将其中一个声明为实例变量
GADBannerView *bannerView_;

@synthesize loan;
@synthesize labelInterestAmount;
@synthesize labelRepaymentAmount;
@synthesize labelRepaymentMonthly;
@synthesize labelTotalLoan;
@synthesize labelLoanPeriod;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{

    [super viewDidLoad];


    FCRepaymentDetail *firstDetail = [loan.repaymentDetailList objectAtIndex:0];
    FCRepaymentDetail *lastDetail = [loan.repaymentDetailList objectAtIndex:[loan.repaymentDetailList count]-1];
    

    self.labelTotalLoan.text = [NSString stringWithFormat:@"%.2f 万元", loan.totalLoan/10000];
    self.labelInterestAmount.text = [NSString stringWithFormat:@"%.2f 万元", loan.interestAmount/10000];
    self.labelRepaymentAmount.text = [NSString stringWithFormat:@"%.2f 万元", loan.repaymentAmount/10000];
    self.labelRepaymentMonthly.text = [NSString stringWithFormat:@"%@", [loan.repaymentDetailList objectAtIndex:1]];
    self.labelLoanPeriod.text = [NSString stringWithFormat:@"%lu", (unsigned long)[loan.repaymentDetailList count]];
    self.labelFirstRepayment.text = [NSString stringWithFormat:@"%.2f 元", firstDetail.totalRepayment];
    self.labelLastRepayment.text = [NSString stringWithFormat:@"%.2f 元", lastDetail.totalRepayment];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

//    显示AdMob广告
    [self showAdMobView];
}

/** 显示AdMob广告 **/
- (void)showAdMobView {
    // 在屏幕底部创建标准尺寸的视图。
    bannerView_ = [[GADBannerView alloc]
            initWithFrame:CGRectMake(0.0,
                    self.view.frame.size.height - GAD_SIZE_320x50.height,
                    GAD_SIZE_320x50.width,
                    GAD_SIZE_320x50.height)];
    // 在GADAdSize.h中对可用的AdSize常量进行说明。
    //    bannerView_ = [[GADBannerView alloc] initWithAdSize:kGADAdSizeSmartBannerPortrait];

    // 指定广告单元ID。
    bannerView_.adUnitID = MY_BANNER_UNIT_ID;

    // 告知运行时文件，在将用户转至广告的展示位置之后恢复哪个UIViewController
    // 并将其添加至视图层级结构。
    bannerView_.rootViewController = self;
    [self.view addSubview:bannerView_];

    GADRequest *request = [GADRequest request];
    // 启动一般性请求并在其中加载广告。
    [bannerView_ loadRequest:request];

    // 请求测试广告。填入模拟器
    // 以及接收测试广告的任何设备的标识符。
    request.testDevices = [NSArray arrayWithObjects:GAD_SIMULATOR_ID, MY_DEVICE_ID_IPHONE5S, nil];

    NSLog(@"%@", @"显示AdMob广告");

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"%@", [segue identifier]);

    if ([[segue identifier] isEqualToString:@"repaymentListSegue"]) {
        FCRepaymentListController *secondViewController = [segue destinationViewController];
        secondViewController.loan = self.loan;
    }
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
