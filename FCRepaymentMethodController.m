//
//  FCPaymentMethodController.m
//  FinancialCalculator4iOS2
//
//  Created by 麦志斌 on 14-4-22.
//  Copyright (c) 2014年 letuu.net. All rights reserved.
//

#import "FCRepaymentMethodController.h"
#import "FCRepaymentDetail.h"
#import "MobClick.h"

@interface FCRepaymentMethodController ()


@end

@implementation FCRepaymentMethodController


@synthesize delegate;
@synthesize valueObject;
@synthesize tVCellMethod1;
@synthesize tVCellMethod2;

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
    
    if ([valueObject.repaymentMethod isEqualToString:@"等额本息"]) {
        tVCellMethod1.accessoryType = UITableViewCellAccessoryCheckmark;
        tVCellMethod2.accessoryType = UITableViewCellAccessoryNone;
    } else {
        tVCellMethod1.accessoryType = UITableViewCellAccessoryNone;
        tVCellMethod2.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
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


#pragma mark - Table view data source



// 加载贷款周期数据
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell *result = nil;
//    //    NSLog(@"执行cellForAtIndexPath");
//
//    static NSString *TableViewCellIdentifier = @"tbcLoanPeriod";
//    result = [tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier];
//    if(result == nil){
//        result = [ [UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableViewCellIdentifier];
//    }
//    //    result.textLabel.text = [NSString stringWithFormat:@"Section %ld,Cell %ld",(long)indexPath.section,(long)indexPath.row];
//    result.textLabel.text = [self.array_1 objectAtIndex:indexPath.row];
//
//    if ([result.textLabel.text isEqualToString:[valueObject loanPeriod]]) {
//        result.accessoryType = UITableViewCellAccessoryCheckmark;
//    } else {
//        result.accessoryType = UITableViewCellAccessoryNone;
//    }
//
//    return result;

//}


// tableView单击事件
// 思路：在UITableViewDelegate的didSelectRowAtIndexPath这个回调方法中先获取这个tableview的所有可见cell，然后遍历一遍将设置每个cell的AccessoryType属性为UITableViewCellAccessoryNone，然后再在你选择的cell上设置AccessoryType属性为UITableViewCellAccessoryCheckmark
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath: indexPath];
    NSLog(@"您选择的还款方式是 %@", cell.textLabel.text);
    
    NSArray *array = [tableView visibleCells];
    for (UITableViewCell *cell in array) {
        [cell setAccessoryType:UITableViewCellAccessoryNone];
    }
    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    
    //    FCValueObject *valueObject = [[FCValueObject alloc] init];
    self.valueObject.repaymentMethod = cell.textLabel.text;
    
    //通过委托协议传值
    [self.delegate passValue:valueObject];
    //退回到前一个窗口
    [self.navigationController popViewControllerAnimated:YES];
    
    //    [self dismissViewControllerAnimated:YES completion:^{}];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [MobClick beginLogPageView:@"PaymentMethodView"];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [MobClick endLogPageView:@"PaymentMethodView"];
}


//
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
