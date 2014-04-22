//
//  FCRootViewController.m
//  FinancialCalculator4iOS2
//
//  Created by 麦志斌 on 14-4-22.
//  Copyright (c) 2014年 letuu.net. All rights reserved.
//

#import "FCRootViewController.h"

@interface FCRootViewController ()

@end

@implementation FCRootViewController

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"%@", [segue identifier]);
    
//    if ([[segue identifier] isEqualToString:@"calculateRepaymentAmountSegue"]) {
//        [self calculateRepaymentAmount:self];
//    }
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
