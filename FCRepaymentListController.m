//
//  FCRepaymentListController.m
//  FinancialCalculator4iOS2
//
//  Created by 麦志斌 on 14-4-25.
//  Copyright (c) 2014年 letuu.net. All rights reserved.
//

#import "FCRepaymentListController.h"    "
#import "FCRepaymentDetail.h"
#import "FCLoan.h"

@interface FCRepaymentListController ()

@end

@implementation FCRepaymentListController

@synthesize loan;

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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [loan.repaymentDetailList count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];

//    static NSString *CellIdentifier = @"cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    // Configure the cell...
    static NSString *GroupedTableIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:GroupedTableIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleValue1
              reuseIdentifier:GroupedTableIdentifier];
    }

    FCRepaymentDetail *detail = [loan.repaymentDetailList objectAtIndex:section];
    if (row == 0) {
        cell.textLabel.text = @"还款金额";
//        cell.textLabel.font=[UIFont boldSystemFontOfSize:12];
        cell.textLabel.numberOfLines=0;
        cell.detailTextLabel.text = [[NSString alloc] initWithFormat:@"%#.2f 元", detail.totalRepayment];
    } else if (row == 1) {
        cell.textLabel.text = @"本金";
//        cell.textLabel.font=[UIFont boldSystemFontOfSize:12];
        cell.textLabel.numberOfLines=0;
        cell.detailTextLabel.text = [[NSString alloc] initWithFormat:@"%#.2f 元", detail.principal];
    } else if (row == 2) {
        cell.textLabel.text = @"利息";
//        cell.textLabel.font=[UIFont boldSystemFontOfSize:12];
        cell.textLabel.numberOfLines=0;
        cell.detailTextLabel.text = [[NSString alloc] initWithFormat:@"%#.2f 元", detail.interest];
    }

    return cell;
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
//    NSString *periodNumber = [[self.repaymentDetailList objectAtIndex:section].periodNumber];
//    return periodNumber;
    NSString *str = [[NSString alloc] initWithFormat:@"第%ld期", section+1];

    return str;
}

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
