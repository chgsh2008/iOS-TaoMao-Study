//
//  TMJimHomeViewController.m
//  weimao
//
//  Created by Kevin Chen on 9/20/15.
//  Copyright (c) 2015 Kevin Chen. All rights reserved.
//

#import "TMJimHomeViewController.h"

@interface TMJimHomeViewController ()

@end

@implementation TMJimHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dealloc {
    [tabView release];
    [tableView release];
    [tabView release];
    [navigationBar release];
    [super dealloc];
}
- (void)viewDidUnload {
    [tabView release];
    tabView = nil;
    [tableView release];
    tableView = nil;
    [tabView release];
    tabView = nil;
    [navigationBar release];
    navigationBar = nil;
    [super viewDidUnload];
}
@end
