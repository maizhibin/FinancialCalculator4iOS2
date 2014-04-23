//
//  FCTableViewController.m
//  FinancialCalculator4iOS2
//
//  Created by 麦志斌 on 14-4-16.
//  Copyright (c) 2014年 letuu.net. All rights reserved.
//

#import "FCTableViewController.h"
#import "FCLoanPeriodController.h"
#import "FCRepaymentMethodController.h"
#import "FCLoan.h"
#import "FCRepaymentDetail.h"
#import "MobClick.h"

@interface FCTableViewController ()

@property(nonatomic, strong) FCLoan *loan;

@end

@implementation FCTableViewController

@synthesize loanPeriodCell;
@synthesize labelLoanPeriod;
@synthesize labelLoanRate;
@synthesize labelPaymentMethod;
@synthesize valueObject;

@synthesize delegate;

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
    
    self.valueObject = [[FCValueObject alloc] init];
    self.valueObject.loanPeriod = self.labelLoanPeriod.text;
    self.valueObject.loanRate = self.labelLoanRate.text;
    self.valueObject.repaymentMethod = self.labelPaymentMethod.text;

    //通过委托协议传值
    [self.delegate passValue:valueObject];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// 显示还款明细
- (IBAction)viewRepaymentDetail:(UIButton *)sender {
    
    for (FCRepaymentDetail *repaymentDetail in self.loan.repaymentDetailList) {
        NSLog(@"%f", repaymentDetail.totalRepayment);
    }
    
}

//实现协议，在第一个窗口显示在第二个窗口输入的值，类似Android中的onActivityResult方法
-(void)passValue:(FCValueObject *)value
{
    NSLog(@"回传的贷款周期为 %@", value.loanPeriod);
    labelLoanPeriod.text = value.loanPeriod;
    labelLoanRate.text = value.loanRate;
    labelPaymentMethod.text = value.repaymentMethod;

    //通过委托协议传值
    [self.delegate passValue:valueObject];
    
}


//- (void) selectLoanPeriod{
////    FCLoanPeriodController *secondView = [[FCLoanPeriodController alloc] initWithNibName:@"loanPeriodController" bundle:[NSBundle mainBundle]];
//    
////    UIStoryboard *storyboard = self.storyboard;
////    FCLoanPeriodController *svc = [storyboard
////                                  instantiateViewControllerWithIdentifier:@"loanPeriodController"];
//    
//    FCLoanPeriodController *svc = [segu]
//    
//    //设置第二个窗口中的delegate为第一个窗口的self
//    svc.delegate = self;
//    
//    NSLog(@"设置Delegate");
//}


// 协议代理Delegate与通知中心NSNotificationCenter实现页面传值
// http://blog.csdn.net/changesquare/article/details/15414773
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"%@", [segue identifier]);
    if ([[segue identifier] isEqualToString:@"loanPeriodSegue"]) {
        FCLoanPeriodController *secondViewController = [segue destinationViewController];
        secondViewController.delegate = self;
        secondViewController.valueObject = self.valueObject;
    }
    
    if ([[segue identifier] isEqualToString:@"paymentMethodSegue"]) {
        FCRepaymentMethodController *secondViewController = [segue destinationViewController];
        secondViewController.delegate = self;
        secondViewController.valueObject = self.valueObject;
    }
    
    if ([[segue identifier] isEqualToString:@"calculateRepaymentAmountSegue"]) {
        [self calculateRepaymentAmount:self];
    }
}


#pragma mark - Table view data source


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell *theCellClicked = [self.tableView cellForRowAtIndexPath:indexPath];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [MobClick beginLogPageView:@"RootView"];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [MobClick endLogPageView:@"RootView"];
}

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
