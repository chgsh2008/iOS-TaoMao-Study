//
//  TMWebViewController.h
//  weimao
//
//  Created by Kevin Chen on 9/20/15.
//  Copyright (c) 2015 Kevin Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMWebViewController : UIViewController<UIWebViewDelegate>
{
}
-(void) loadWebViewWithString:(NSString *)urlString;
@property (retain, nonatomic) IBOutlet UIWebView *webView;
@end
