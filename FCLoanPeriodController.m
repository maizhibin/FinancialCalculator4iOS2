//
//  FCLoanPeriodController.m
//  FinancialCalculator4iOS2
//
//  Created by 麦志斌 on 14-4-16.
//  Copyright (c) 2014年 letuu.net. All rights reserved.
//

#import "FCLoanPeriodController.h"

@interface FCLoanPeriodController ()


//数组
@property (nonatomic, retain) NSArray * array_1;//成数数组
@property (nonatomic, retain) NSArray * array_2;//年数数组
@property (nonatomic, retain) NSArray * array_3;//按揭利率年份
@property (nonatomic, retain) NSArray * array_4;//商贷利率
@property (nonatomic, retain) NSArray * array_5;//公积金贷款利率
@property (nonatomic, retain) NSArray * array_6;//贷款年数

-(void)createDataArray;

@end

@implementation FCLoanPeriodController



-(void)createDataArray
{
    //按揭成数数组
    self.array_1 = [NSArray arrayWithObjects:@"9成",@"8成",@"7成",@"6成",@"5成",@"4成",@"3成",@"2成", nil];
    self.array_2 = [NSArray arrayWithObjects:@"1年(12期)",@"2年(24期)",@"3年(36期)",@"4年(48期)",@"5年(60期)",@"6年(72期)",@"7年(84期)",@"8年(96期)",@"9年(108期)",@"10年(120期)",@"11年(134期)",@"12年(144期)",@"13年(156期)",@"14年(168期)",@"15年(180期)",@"16年(192期)",@"17年(204期)",@"18年(216期)",@"19年(228期)",@"20年(240期)",@"25年(300期)",@"30年(360期)", nil];
    self.array_3 = [NSArray arrayWithObjects:@"12年7月6日利率下限(7折)",@"12年7月6日利率下限(85折)",@"12年7月6日利率上限(1.1倍)",@"12年7月6日基准利率",@"12年6月8日利率上限(1.1倍)",@"12年6月8日利率下限(85折)",@"12年6月8日基准利率",@"11年7月6日利率上限(1.1倍)",@"11年7月6日利率下限(85折)",@"11年7月6日基准利率",@"11年4月5日利率上限(1.1倍)",@"11年4月5日利率下限(85折)",@"11年4月5日利率下限(7折)",@"11年4月5日基准利率",@"11年2月9日利率上限(1.1倍)",@"11年2月9日利率下限(85折)",@"11年2月9日利率下限(7折)",@"11年2月9日基准利率",@"10年12月26日利率上限(1.1倍)",@"10年12月26日利率下限(85折)",@"10年12月26日利率下限(7折)",@"10年12月26日基准利率",@"10年10月20日利率上限(1.1倍)",@"10年10月20日基准利率",@"10年10月20日利率下限(85折)",@"10年10月20日利率下限(7折)",@"08年12月23日利率上限(1.1倍)",@"08年12月23日基准利率",@"08年12月23日利率下限(85折)",@"08年12月23日利率下限(7折)", nil];
    self.array_4 = [NSArray arrayWithObjects:@"4.59%", @"5.57%", @"7.21%", @"6.55%", @"7.48%",
                    @"5.78%", @"6.8%", @"7.75%", @"5.99%", @"7.05%", @"7.48%", @"5.78%",
                    @"4.76%", @"6.8%", @"7.26%", @"5.61%", @"4.62%", @"6.6%", @"7.04%",
                    @"5.44%", @"4.48%", @"6.4%", @"6.75%", @"6.14%", @"5.22%", @"4.3%",
                    @"6.53%", @"5.94%", @"5.05%", @"4.16%",nil];
    self.array_5 = [NSArray arrayWithObjects:@"4.5%", @"4.5%", @"4.5%", @"4.5%", @"4.7%",
                    @"4.7%", @"4.7%", @"4.9%", @"4.9%", @"4.9%", @"4.7%", @"4.7%", @"4.7%",
                    @"4.7%", @"4.5%", @"4.5%", @"4.5%", @"4.5%", @"4.3%", @"4.3%", @"4.3%",
                    @"4.3%", @"4.05%", @"4.05%", @"4.05%", @"4.05%", @"3.87%", @"3.87%",
                    @"3.87%", @"3.87%", nil];
    self.array_6 = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"25",@"30", nil];
    
    NSLog(@"数据初始化完毕。");
}


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
    [self createDataArray];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"贷款周期共有 %ld 行。", [self.array_2 count]);
    return [self.array_2 count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *result = nil;
//    NSLog(@"执行cellForAtIndexPath");
    
    static NSString *TableViewCellIdentifier = @"tbcLoanPeriod";
    result = [tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier];
    if(result == nil){
        result = [ [UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableViewCellIdentifier];
    }
    //    result.textLabel.text = [NSString stringWithFormat:@"Section %ld,Cell %ld",(long)indexPath.section,(long)indexPath.row];
    result.textLabel.text = [self.array_2 objectAtIndex:indexPath.row];
    
    return result;

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
