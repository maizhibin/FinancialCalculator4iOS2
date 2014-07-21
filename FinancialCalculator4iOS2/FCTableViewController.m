//
//  FCTableViewController.m
//  FinancialCalculator4iOS2
//
//  Created by 麦志斌 on 14-4-16.
//  Copyright (c) 2014年 letuu.net. All rights reserved.
//

#import <Google-AdMob-Ads-SDK/GADBannerView.h>
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

NSInteger rowCount = 4;

@synthesize loanPeriodCell;
@synthesize labelLoanPeriod;
@synthesize labelLoanRate;
@synthesize labelPaymentMethod;
@synthesize textLoanBusiness;
@synthesize textLoanPortfolio;
@synthesize valueObject;

@synthesize tvLoanSetting;
@synthesize tvcLoan;
@synthesize delegate;

@synthesize loanMethod;



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

    self.loanMethod = RESERVE;


    //注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleKeyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleKeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];



    self.valueObject = [[FCValueObject alloc] init];
    self.valueObject.loanPeriod = self.labelLoanPeriod.text;
    self.valueObject.loanRate = self.labelLoanRate.text;
    self.valueObject.repaymentMethod = self.labelPaymentMethod.text;
    self.valueObject.loanAmountBusiness = self.textLoanBusiness.text;

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
    textLoanBusiness.text = value.loanAmountBusiness;


    //通过委托协议传值
    [self.delegate passValue:valueObject];
    
}


- (IBAction)backgroundTap:(id)sender
{
    [self.textLoanBusiness resignFirstResponder];
    [self.textLoanPortfolio resignFirstResponder];
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
}



#pragma mark 键盘
- (void)handleKeyboardWillHide:(NSNotification *)notification
{
    if (doneInKeyboardButton.superview)
    {
        [doneInKeyboardButton removeFromSuperview];
    }
}

- (void)handleKeyboardDidShow:(NSNotification *)notification
{
    if (doneInKeyboardButton == nil)
    {
//        doneInKeyboardButton = [[UIButton buttonWithType:UIButtonTypeCustom] retain];


        CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
        if(screenHeight==568.0f){//爱疯5
            doneInKeyboardButton.frame = CGRectMake(0, 568 - 53, 106, 53);
        }else{//3.5寸
            doneInKeyboardButton.frame = CGRectMake(0, 480 - 53, 106, 53);
        }

        doneInKeyboardButton.adjustsImageWhenHighlighted = NO;
        //图片直接抠腾讯财付通里面的= =!
        [doneInKeyboardButton setImage:[UIImage imageNamed:@"btn_done_up@2x.png"] forState:UIControlStateNormal];
        [doneInKeyboardButton setImage:[UIImage imageNamed:@"btn_done_down@2x.png"] forState:UIControlStateHighlighted];
        [doneInKeyboardButton addTarget:self action:@selector(finishAction) forControlEvents:UIControlEventTouchUpInside];
    }


    UIWindow* tempWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:1];

    if (doneInKeyboardButton.superview == nil)
    {
        [tempWindow addSubview:doneInKeyboardButton];    // 注意这里直接加到window上
    }

}


-(void)finishAction{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];//关闭键盘
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

//- (void)keyboardWillShow:(NSNotification *)note {
    // create custom button
//    UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    doneButton.frame = CGRectMake(0, 163, 106, 53);
//    doneButton.adjustsImageWhenHighlighted = NO;
//    [doneButton setImage:[UIImage imageNamed:@"DoneUp.png"] forState:UIControlStateNormal];
//    [doneButton setImage:[UIImage imageNamed:@"DoneDown.png"] forState:UIControlStateHighlighted];
//    [doneButton addTarget:self action:@selector(doneButton:) forControlEvents:UIControlEventTouchUpInside];

    // locate keyboard view
//    UIWindow* tempWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:1];
//    UIView* keyboard;
//    for(int i=0; i<[tempWindow.subviews count]; i++) {
//        keyboard = [tempWindow.subviews objectAtIndex:i];
//        keyboard view found; add the custom button to it
//        if([[keyboard description] hasPrefix:@"<UIKeyboard"] == YES)
//            [keyboard addSubview:doneButton];
//    }
//}


- (void)changeLoanMethod:(LOAN_METHOD)loanMethod{
    self.loanMethod = loanMethod;
    if (loanMethod == RESERVE) {
        tvcLoan.hidden = YES;
    } else {
        tvcLoan.hidden = NO;
//        if (rowCount == 3) rowCount = 4;
    }
    NSLog(@"rowCount = %ld", (long)rowCount);
    [tvLoanSetting reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    NSLog(@"rowCount = %ld", (long)rowCount);
    return rowCount;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    CGRect orginSize;
    orginSize = cell.frame;

    NSLog(@"Cell高度=%f", orginSize.size.height);
    if (self.loanMethod == RESERVE && [cell.reuseIdentifier isEqualToString:@"tvcLoan"]) {
        cell.hidden = YES;
    }
//  else {
//        if (indexPath.row == 2 && cell.hidden == NO) {
//            orginSize.size.height = 40;
//        } else if(indexPath.row == 1) {
//            orginSize.size.height = 70;
//        }
//    }
    cell.frame = orginSize;
    return cell.frame.size.height;
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
- (void)dealloc {
    //反注册通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
