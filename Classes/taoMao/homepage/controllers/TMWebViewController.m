//
//  TMWebViewController.m
//  weimao
//
//  Created by Kevin Chen on 9/20/15.
//  Copyright (c) 2015 Kevin Chen. All rights reserved.
//

#import "TMWebViewController.h"

@interface TMWebViewController ()

@end

@implementation TMWebViewController
-(void) study
{
//    TMWebViewController *webView=[[TMWebViewController alloc]init];
//    TMAppDelegate *app=(TMAppDelegate*)[UIApplication sharedApplication].delegate;
//    [app.navigationController pushViewController:webView animated:YES];
    
    //[self.navigationController popViewControllerAnimated:YES];
    
    UIViewController * longinView = [[self.navigationController viewControllers] objectAtIndex:1];
    [self.navigationController popToViewController:longinView animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController setToolbarHidden:NO];
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemBookmarks) target:self action:@selector(study)];
    UIBarButtonItem * leftItem2 = [[UIBarButtonItem alloc] initWithCustomView:nil];
    self.navigationItem.leftBarButtonItem = leftItem;
    
//    UIToolbar * toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(10, 10, 100, 30)];
//    toolBar.backgroundColor = [UIColor redColor];
//    [self.navigationController setToolbarItems:@[toolBar]];
    UITabBarItem *firstItem = [[UITabBarItem alloc] initWithTitle:@"tab1" image:nil tag:1];
    self.tabBarItem = firstItem;
//    
//    UIView *view_bar =[[UIView alloc]init];
//    if ([[[UIDevice currentDevice]systemVersion]floatValue]>6.1)
//    {
//        view_bar .frame=CGRectMake(0, 0, self.view.frame.size.width, 44+20);
//        UIImageView *imageV = [[UIImageView alloc]initWithImage:BundleImage(@"top.png")];
//        [view_bar addSubview:imageV];
//        [imageV release];
//        
//    }else{
//        view_bar .frame=CGRectMake(0, 0, self.view.frame.size.width, 44);
//        UIImageView *imageV = [[UIImageView alloc]initWithImage:BundleImage(@"top.png")];
//        [view_bar addSubview:imageV];
//        [imageV release];
//    }
//    view_bar.backgroundColor=[UIColor whiteColor];
//    
//    [self.view addSubview: view_bar];
    //    UIWebView *web = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    //    [self.view addSubview:web];
    //    web.delegate =self;
    //    web.scalesPageToFit =YES;
    //    NSURL * url = [NSURL URLWithString:@"https://www.baidu.com/"];
    //    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //    [web loadRequest:request];
    //
    //    return;
    //self.textField.text =
    //NSString *str = self.textField.text;
    self.webView.scalesPageToFit =YES;
    self.webView.delegate =self;
    //    activityIndicatorView = [[UIActivityIndicatorView alloc]
    //                             initWithFrame : CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)] ;
    //    [activityIndicatorView setCenter: self.view.center] ;
    //    [activityIndicatorView setActivityIndicatorViewStyle: UIActivityIndicatorViewStyleWhite] ;
    //    [self.view addSubview : activityIndicatorView] ;
    //[self loadWebViewWithString:@"https://www.baidu.com/"];
    NSURL * url = [NSURL URLWithString:@"https://www.baidu.com/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}
-(void) loadWebViewWithString:(NSString *)urlString
{
    NSURL * url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) webViewDidStartLoad:(UIWebView *)webView
{
    //[activityIndicatorView startAnimating];
}
-(void) webViewDidFinishLoad:(UIWebView *)webView
{
    //[activityIndicatorView stopAnimating];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
