//
//  FCLoginViewController.h
//  Flower&Cake
//
//  Created by 呵呵 on 13-7-14.
//  Copyright (c) 2013年 呵呵. All rights reserved.
//

#import "LTKViewController.h"
#import "ASIHTTPRequest.h"
//#import "ASINetworkQueue.h"
#import "DataValidate.h"
@interface FCLoginViewController : LTKViewController<UITextFieldDelegate>
{

    UIView *view_bar;
    UITextField *fieldName,*fieldPsw;
}
-(id) testlogin: (NSString *)name;
@end
