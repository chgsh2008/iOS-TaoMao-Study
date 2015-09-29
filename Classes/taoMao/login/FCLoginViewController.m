//
//  FCLoginViewController.m
//  Flower&Cake
//
//  Created by 呵呵 on 13-7-14.
//  Copyright (c) 2013年 呵呵. All rights reserved.
//

#import "FCLoginViewController.h"
#import "GuideViewController.h"
#import "FCRsgisterViewController.h"
#import "TMUpgradeViewController.h"
#import "config.h"
@interface FCLoginViewController ()

@end

@implementation FCLoginViewController
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden=YES;

}



-(UIView*)initNavigationBar
{
    self.navigationController.navigationBarHidden = NO;
    view_bar =[[UIView alloc]init];
    if ([[[UIDevice currentDevice]systemVersion]floatValue]>6.1)
    {
        view_bar .frame=CGRectMake(0, 0, self.view.frame.size.width, 44+20);
        UIImageView *imageV = [[UIImageView alloc]initWithImage:BundleImage(@"top.png")];
        [view_bar addSubview:imageV];
        [imageV release];
        
    }else{
        view_bar .frame=CGRectMake(0, 0, self.view.frame.size.width, 44);
        UIImageView *imageV = [[UIImageView alloc]initWithImage:BundleImage(@"top.png")];
        [view_bar addSubview:imageV];
        [imageV release];
    }
    view_bar.backgroundColor=[UIColor whiteColor];
    
    [self.view addSubview:view_bar];
    UILabel *title_label=[[UILabel alloc]initWithFrame:CGRectMake(65, view_bar.frame.size.height-44, self.view.frame.size.width-130, 44)];
    title_label.text=@"登录";
    title_label.font=[UIFont boldSystemFontOfSize:20];
    title_label.backgroundColor=[UIColor clearColor];
    title_label.textColor =[UIColor whiteColor];
    title_label.textAlignment=1;
    [view_bar addSubview:title_label];
    
//    UIButton*btnBack=[UIButton buttonWithType:0];
//    btnBack.frame=CGRectMake(0, view_bar.frame.size.height-34, 47, 34);
//    [btnBack setImage:BundleImage(@"ret_01.png") forState:0];
//    [btnBack addTarget:self action:@selector(btnBack:) forControlEvents:UIControlEventTouchUpInside];
//    [view_bar addSubview:btnBack];
//    
//    
    UIButton*btnSJ=[UIButton buttonWithType:0];
    btnSJ.frame=CGRectMake(view_bar.frame.size.width-55, view_bar.frame.size.height-40, 47, 34);
    
    [btnSJ setTitle:@"升级" forState:0];
    [btnSJ addTarget:self action:@selector(btnSJ:) forControlEvents:UIControlEventTouchUpInside];
    [view_bar addSubview:btnSJ];
    
    return view_bar;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=NO;
    [self initNavigationBar];
     NSUserDefaults *default1 = [NSUserDefaults standardUserDefaults];
    if (![default1 objectForKey:@"applicationVersion"]||![[default1 objectForKey:@"applicationVersion"] isEqualToString:@"1.0"]) {
    
        [self presentViewController:[[[GuideViewController alloc] init] autorelease] animated:NO completion:nil];
        [default1 setObject:@"1.0" forKey:@"applicationVersion"];
    }

    
    UIImageView *loginBG=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-292/2, view_bar.frame.size.height+40, 292, 81)];
    loginBG.image=BundleImage(@"dl_textbox_02.png");
    loginBG.userInteractionEnabled=YES;
    [self.view addSubview:loginBG];
    
    UILabel *nameLab=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 40)];
    nameLab.text=@" 用户名:";
    nameLab.backgroundColor=[UIColor clearColor];
    nameLab.font=[UIFont systemFontOfSize:16];
    nameLab.textColor=hui5;
    [loginBG addSubview:nameLab];
    
    fieldName=[[UITextField alloc]initWithFrame:CGRectMake(60, 0, 292-60, 40)];
    fieldName.contentVerticalAlignment=0;
    fieldName.placeholder=@"6-16个字符";
    fieldName.clearsOnBeginEditing = YES;
    fieldName.backgroundColor=[UIColor clearColor];
    fieldName.clearButtonMode = UITextFieldViewModeWhileEditing;
    fieldName.contentVerticalAlignment=0;
    fieldName.delegate=self;
    fieldName.tag=0;
    fieldName.borderStyle=UITextBorderStyleNone;
    [fieldName addTarget:self action:@selector(textFieldDidBeginEditing:) forControlEvents:UIControlEventEditingDidBegin];
    [fieldName addTarget:self action:@selector(textFieldDone:) forControlEvents:UIControlEventEditingDidEndOnExit];
    fieldName.returnKeyType = UIReturnKeyDefault;
    [loginBG addSubview:fieldName];
    
    
    UILabel *pasLab=[[UILabel alloc] initWithFrame:CGRectMake(0, 40, 60, 40)];
    pasLab.text=@" 密   码:";
    pasLab.backgroundColor=[UIColor clearColor];
    pasLab.font=[UIFont systemFontOfSize:16];
    pasLab.textColor=hui5;
    [loginBG addSubview:pasLab];
    
    fieldPsw=[[UITextField alloc]initWithFrame:CGRectMake(60, 40, 292-60, 41)];
    fieldPsw.contentVerticalAlignment=0;
    fieldPsw.placeholder=@"6-16个字符";
    fieldPsw.textColor=hui2;
    fieldPsw.borderStyle=UITextBorderStyleNone;
    fieldPsw.tag=1;
    fieldPsw.clearsOnBeginEditing = YES;
    fieldPsw.backgroundColor=[UIColor clearColor];
    fieldPsw.secureTextEntry=YES;
    fieldPsw.delegate=self;
    fieldPsw.clearButtonMode = UITextFieldViewModeWhileEditing;
    [[NSUserDefaults standardUserDefaults]setObject:fieldPsw.text forKey:@"passWord"];
    [fieldPsw addTarget:self action:@selector(textFieldDidBeginEditing:) forControlEvents:UIControlEventEditingDidBegin];
    [fieldPsw addTarget:self action:@selector(textFieldDone:) forControlEvents:UIControlEventEditingDidEndOnExit];
    fieldName.returnKeyType = UIReturnKeyDefault;
    [loginBG addSubview:fieldPsw];
    
    UIButton *btnLogin=[UIButton buttonWithType:0];
    btnLogin.frame=CGRectMake(320/2-292/2, loginBG.frame.size.height+loginBG.frame.origin.y+35, 292, 36);
    [btnLogin setImage:BundleImage(@"dl_button_02.png") forState:0];
    [btnLogin addTarget:self action:@selector(btnLogin:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnLogin];
    
    UIButton *registerBtn=[UIButton buttonWithType:0];
    registerBtn.frame=CGRectMake(320-85, btnLogin.frame.size.height+btnLogin.frame.origin.y+5, 70, 15);
    registerBtn.backgroundColor=[UIColor clearColor];
    registerBtn.titleLabel.font=[UIFont systemFontOfSize:12];
    [registerBtn setTitle:@"注册新用户" forState:0];
    [registerBtn setTitleColor:[UIColor colorWithRed:1.0 green:.23 blue:.49 alpha:1.0] forState:0];
    [registerBtn addTarget:self action:@selector(registerBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerBtn];

    [self btnLogin:btnLogin];
    
}
-(void)btnLogin:(id)sender
{
    
    
    [fieldName resignFirstResponder];
    [fieldPsw resignFirstResponder];
    [self keyboardWillHide:nil];
    
    fieldName.text = @"sfdfsdfsdf";
    fieldPsw.text = @"sdfdffdff";
    
    if ([fieldName.text length]<=0)
    {
        ShowMessage(@"用户名为空！");
        
    }else if([fieldPsw.text length]<=0)
    {
        
        ShowMessage(@"密码为空！");
        
    }else if([self isUserName:fieldName.text ]==NO)
    {
        
        ShowMessage(@"用户名为6-16字符");
        
    }else if([self isUserName:fieldPsw.text ]==NO)
    {
        
        ShowMessage(@"密码为6-16字符");
        
    }
    
    else{
        //------------------Jim--------------------------
        //http://120.24.50.82:8180/app/appServlet
        //http://192.168.1.101:8081/ypmz2/app/function/AppFunction!data.action
        //http://192.168.1.101:8081/ypmz2/index.jsp
        //http://120.24.50.82:8180/ypmz2/app/appServlet
        //http://120.24.50.82:8180/app/appServlet?d=1
        //http://192.168.1.101:8081/shop/app/appServlet?d=1
        NSString *const APIAddress = @"http://120.24.50.82:8180/app/appServlet";
        NSString * userName = fieldName.text;
        NSString * pwd = fieldPsw.text;
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            // 1.创建请求
                NSURL *url = [NSURL URLWithString:APIAddress];
                //      NSString *postStr = [[NSString alloc] initWithFormat:@"name=%@&psw=%@",@"admin",@"admin"];
                //    NSData *postData = [postStr dataUsingEncoding:NSUTF8StringEncoding];
                NSDictionary *json = @{
                                    @"Username" : userName,
                                    @"Password" : pwd
                                    };
                NSData *data = [NSJSONSerialization dataWithJSONObject:json options:NSJSONWritingPrettyPrinted error:nil];
                NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
                [request setHTTPMethod:@"POST"];//设置请求方式为POST，默认为GET
                [request setHTTPBody:data];//设置参数
        
                //第三步，连接服务器
                dispatch_async(dispatch_get_main_queue(), ^{
                    NSError *error;
                    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
                    if (received != nil )
                    {
//                    NSString *backStr = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
//                    NSLog(@"%@",backStr);
                        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:received options:NSJSONReadingMutableLeaves error:&error];
//                        NSLog(@"%@",dic );
//                        NSLog(@"%@",[dic objectForKey:@"success" ] );
//                        NSLog(@"%@",[dic objectForKey:@"result" ] );
//                        NSLog(@"%@",[dic objectForKey:@"success" ]);
                        if ([dic objectForKey:@"success" ] )
                        {
                            [self logToLocal:userName password:pwd];
                            FCTabBarController *view1 = [FCTabBarController alloc] ;
                            //view1.daoHangArray = dic;//Jim 20150905
                            view1.dataArray=[dic objectForKey:@"result"];
                            [view1 init];
                            [self.navigationController pushViewController:view1 animated:YES];
                            //-(id)initWithData:(NSData *)data
                        }
                        else
                        {
                            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Tip" message:@"登录服务失败!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                            [alert show];
                        }
                    }
                });
                });
        //------------------Jim--------------------------
        
        
    }
}
-(void) logToLocal:(NSString * )username password:(NSString *)passowrd
{
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:UserDefaultsUserNameKey] != nil) {
        [defaults removeObjectForKey:UserDefaultsUserNameKey];
    }
    if ([defaults objectForKey:UserDefaultsUserPasswordKey] != nil) {
        [defaults removeObjectForKey:UserDefaultsUserPasswordKey];
    }
    [[NSUserDefaults standardUserDefaults] setObject:username forKey:UserDefaultsUserNameKey];
    [[NSUserDefaults standardUserDefaults] setObject:passowrd forKey:UserDefaultsUserPasswordKey];
    [[NSUserDefaults standardUserDefaults]setObject:@"islogin" forKey:@"islogin"];
}
-(void)btnLogin2:(id)sender
{
    [fieldName resignFirstResponder];
    [fieldPsw resignFirstResponder];
    [self keyboardWillHide:nil];
    
    fieldName.text = @"sfdfsdfsdf";
    fieldPsw.text = @"sdfdffdff";
    
    if ([fieldName.text length]<=0)
    {
        ShowMessage(@"用户名为空！");
        
    }else if([fieldPsw.text length]<=0)
    {
        
        ShowMessage(@"密码为空！");
   
    }else if([self isUserName:fieldName.text ]==NO)
    {
    
        ShowMessage(@"用户名为6-16字符");
    
    }else if([self isUserName:fieldPsw.text ]==NO)
    {
        
         ShowMessage(@"密码为6-16字符");
        
    }

    else{
        [self testlogin:@""];
        return;
        //------------------Jim--------------------------
        //http://192.168.1.101:8081/ypmz2/app/appServlet
        //http://192.168.1.101:8081/ypmz2/app/function/AppFunction!data.action
        //http://192.168.1.101:8081/ypmz2/index.jsp
        //http://120.24.50.82:8180/ypmz2/app/appServlet
        //http://120.24.50.82:8180/app/appServlet?d=1
        NSString *const APIAddress = @"http://120.24.50.82:8180/app/appServlet";
        NSString * userName = fieldName.text;
        NSString * pwd = fieldPsw.text;
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            // 处理耗时操作的代码块...
            NSDictionary * userDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:userName,@"Username", pwd,@"Password",nil];
            if([NSJSONSerialization isValidJSONObject:userDictionary])
            {
                NSError *error;
                NSLog(@"userDictionary:%@",userDictionary);
                NSData * jsonData = [NSJSONSerialization dataWithJSONObject:userDictionary options:NSJSONWritingPrettyPrinted error:&error];
                NSLog(@"jsonData:%@",jsonData);
                NSMutableArray *tempJsonData = [NSMutableData dataWithData:jsonData];
                NSLog(@"tempJsonData:%@",tempJsonData);
                NSString * api = [NSString stringWithFormat:@"%@",APIAddress];
                NSURL * url = [NSURL URLWithString:api];
                ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
                
                [request addRequestHeader:@"Content-Type" value:@"application/json; charset=utf-8"];
                //[request addRequestHeader:@"Accept" value:@"application/json"];
                [request addRequestHeader:@"User-Agent" value:@"ASIHTTPRequest"];
                
                
                [request setRequestMethod:@"POST"];
                //[request setPostBody:tempJsonData];
                [request setPostBody:userName];
                [request startSynchronous];
                NSError *error1 = [request error];
                if(!error1)
                {
                    //通知主线程刷新
                    dispatch_async(dispatch_get_main_queue(), ^{
                        //回调或者说是通知主线程刷新，
                        NSString *response = [request responseString];
                        NSError * error;
                        NSLog(@"response data: %@",response);
                        if ([DataValidate is404ErrorShowMessage:response]) {
                            
                        }
                        else if ([response isEqualToString:@"null"]) {
                            UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"Tip" message:@"Your account or password is not validate, please check again." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                            [alertView show];
                        }
                        else{
                            NSData *responseData = [request responseData];
                            //            NSLog(@"请求的Data数据:%@",responseData);
                            //            NSData* jsonData = [response dataUsingEncoding:NSUTF8StringEncoding];
                            NSDictionary *dicUser=[NSJSONSerialization  JSONObjectWithData:responseData options:NSJSONReadingMutableLeaves error:&error];
                            if (dicUser != nil) {
                                NSLog(@"log:",dicUser);
//                                if (currentUser == nil) {
//                                    currentUser = [[MobileUser alloc] init];
//                                }
//                                NSLog(@"UserID: %@, UserName:%@",[dicUser objectForKey:@"userID"],[dicUser objectForKey:@"username"]);
//                                currentUser.userID = [[dicUser objectForKey:@"userID"] integerValue];
//                                currentUser.userName = [dicUser objectForKey:@"username"];
//                                currentUser.clientId = [[dicUser objectForKey:@"clientID"] integerValue];
//                                currentUser.email = [dicUser objectForKey:@"email"];
//                                currentUser.firstName = [dicUser objectForKey:@"firstName"];
//                                currentUser.lastName = [dicUser objectForKey:@"lastName"];
//                                currentUser.password = password;
//                                [self logToLocal:username password:password];
//                                [self navigationToMain];
                            }
                        }
                    });
                }
            }
            
            
        });
        //------------------Jim--------------------------
        
        [[NSUserDefaults standardUserDefaults]setObject:@"islogin" forKey:@"islogin"];
        FCTabBarController *view1 = [[FCTabBarController alloc] init];
        [self.navigationController pushViewController:view1 animated:YES];
    
    }
    
}
-(id) testlogin: (NSString *)name
{
//    NSDictionary *user = [[NSDictionary alloc] initWithObjectsAndKeys:@"0", @"Version", nil];
//    if ([NSJSONSerialization isValidJSONObject:user])
//    {
//        NSError *error;
//        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:user options:NSJSONWritingPrettyPrinted error: &error];
//        NSMutableData *tempJsonData = [NSMutableData dataWithData:jsonData];
//        //NSLog(@"Register JSON:%@",[[NSString alloc] initWithData:tempJsonData encoding:NSUTF8StringEncoding]);
//        
//        NSURL *url = [NSURL URLWithString:@"http://120.24.50.82:8180/app/appServlet"];
//        ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
//        [request addRequestHeader:@"Content-Type" value:@"application/json; encoding=utf-8"];
//        [request addRequestHeader:@"Accept" value:@"application/json"];
//        [request setRequestMethod:@"POST"];
//        [request setPostBody:tempJsonData];
//        [request startSynchronous];
//        NSError *error1 = [request error];
//        if (!error1) {
//            NSString *response = [request responseString];
//            NSLog(@"Test：%@",response);
//        }
//    }
    
    // 1.创建请求
//    NSURL *url = [NSURL URLWithString:@"http://120.24.50.82:8180/app/appServlet"];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//    request.HTTPMethod = @"POST";
//    
//    // 2.设置请求头
//    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    // 3.设置请求体
//    NSDictionary *json = @{
//                           @"order_id" : @"123",
//                           @"user_id" : @"789",
//                           @"shop" : @"Toll"
//                           };
//    //    NSData --> NSDictionary
//    // NSDictionary --> NSData
//    NSData *data = [NSJSONSerialization dataWithJSONObject:json options:NSJSONWritingPrettyPrinted error:nil];
//    request.HTTPBody = data;
//    // 4.发送请求
//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//        NSLog(@"%d", data.length);
//    }];
    
    //NSURL *url = [NSURL URLWithString:@"http://120.24.50.82:8180/app/appServlet"];
    
    //第二步，创建请求
//    NSDictionary *json = @{
//                           @"order_id" : @"123",
//                           @"user_id" : @"789",
//                           @"shop" : @"Toll"
//                           };
//    NSData *data = [NSJSONSerialization dataWithJSONObject:json options:NSJSONWritingPrettyPrinted error:nil];
//    
//    //NSString *postStr = [[NSString alloc] initWithFormat:@"name=%@&psw=%@",@"admin",@"admin"];
//    //NSData *postData = [postStr dataUsingEncoding:NSUTF8StringEncoding];
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
//    [request setHTTPMethod:@"POST"];//设置请求方式为POST，默认为GET
//    [request setHTTPBody:data];//设置参数
//    //第三步，连接服务器
//    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//    NSString *backStr = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
//    
//    NSLog(@"%@",backStr);

    //-------------------------
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    // 1.创建请求
        NSURL *url = [NSURL URLWithString:@"http://120.24.50.82:8180/app/appServlet"];
        //      NSString *postStr = [[NSString alloc] initWithFormat:@"name=%@&psw=%@",@"admin",@"admin"];
        //    NSData *postData = [postStr dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *json = @{
                            @"order_id" : @"123",
                            @"user_id" : @"789",
                            @"shop" : @"Toll"
                            };
        NSData *data = [NSJSONSerialization dataWithJSONObject:json options:NSJSONWritingPrettyPrinted error:nil];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
        [request setHTTPMethod:@"POST"];//设置请求方式为POST，默认为GET
        [request setHTTPBody:data];//设置参数
    
        //第三步，连接服务器
        dispatch_async(dispatch_get_main_queue(), ^{
            NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
            NSString *backStr = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
            
            NSLog(@"%@",backStr);
        });
        });
    //-------------------------
    //-------------------------
//    NSDictionary *user = [[NSDictionary alloc] initWithObjectsAndKeys:@"0", @"Version", nil];
//    if ([NSJSONSerialization isValidJSONObject:user])
//    {
//        NSError *error;
//        
//        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:user options:NSJSONWritingPrettyPrinted error: &error];
//        NSMutableData *tempJsonData = [NSMutableData dataWithData:jsonData];
//        //NSLog(@"Register JSON:%@",[[NSString alloc] initWithData:tempJsonData encoding:NSUTF8StringEncoding]);
//        
//        NSURL *url = [NSURL URLWithString:@"http://120.24.50.82:8180/app/appServlet"];
//        ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
//        
//        [request addRequestHeader:@"Content-Type" value:@"application/json; encoding=utf-8"];
//        [request addRequestHeader:@"Accept" value:@"application/json"];
//        [request setRequestMethod:@"POST"];
//        [request setPostBody:tempJsonData];
//        [request startSynchronous];
//        NSError *error1 = [request error];
//        if (!error1) {
//            NSString *response = [request responseString];
//            NSLog(@"Test：%@",response);
//        }
//    }
    //-------------------------
    return @"";
}
//(\w{6,16})
-(BOOL)isUserName:(NSString*)name
{
    NSString *nameRegex = @"(\\w{6,16})";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    return [nameTest evaluateWithObject:name];
    
}
-(void)btnSJ:(id)sender
{
    TMUpgradeViewController *upgrade=[[TMUpgradeViewController alloc]init];
    [self.navigationController pushViewController:upgrade animated:YES];

}
//注册按钮
-(void)registerBtn:(id)sender
{
//    [fieldCheck resignFirstResponder];
    [fieldName resignFirstResponder];
    [fieldPsw resignFirstResponder];
    
    FCRsgisterViewController *Vc=[[FCRsgisterViewController alloc]init];
    [self.navigationController pushViewController:Vc animated:YES];
    
}
//文本框事件
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self keyboardWillHide:nil];
}

#pragma mark keyboard methods
//- (void) textFieldBegin:(id)sender
//{
//    UITextField *t = (UITextField*)sender;
//    NSLog(@"%i",t.tag);
//    NSTimeInterval animationDuration = 0.30f;
//    CGRect frame = self.view.frame;
//    frame.origin.y = -50;
//    [UIView beginAnimations:@"ResizeView" context:nil];
//    [UIView setAnimationDuration:animationDuration];
//    self.view.frame = frame;
//    [UIView commitAnimations];
//
//}

- (void) textFieldDone:(id)sender
{
    [self keyboardWillHide:nil];
    [sender resignFirstResponder];
}
- (void)keyboardWillShow:(NSNotification *)notification
{
    //        //
    //        //    NSTimeInterval animationDuration = 0.30f;
    //        //    CGRect frame = self.view.frame;
    //        //    frame.origin.y = -50;
    //        //    [UIView beginAnimations:@"ResizeView" context:nil];
    //        //    [UIView setAnimationDuration:animationDuration];
    //        //    self.view.frame = frame;
    //        //    [UIView commitAnimations];
}

- (void)keyboardWillHide:(NSNotification *)notification
{
    NSTimeInterval animationDuration = 0.30f;
    CGRect frame = self.view.frame;
    
    UITextView *text1=(UITextView*)[self.view viewWithTag:0];
    UITextView *text2=(UITextView*)[self.view viewWithTag:1];
    UITextView *text3=(UITextView*)[self.view viewWithTag:2];
    if (text1.isFirstResponder==YES||text2.isFirstResponder==YES||text3.isFirstResponder==YES)
    {
        frame.origin.y = 0;
    }else{
        frame.origin.y = 0;
    }
    [UIView beginAnimations:@"ResizeView" context:nil];
    [UIView setAnimationDuration:animationDuration];
    self.view.frame = frame;
    [UIView commitAnimations];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    NSLog(@"%d",textField.tag);
    int count = textField.tag;
    switch (count)
    {
            
        case 0:
        {
            
            break;
        }
        case 1:
        {
            
            break;
        }
        case 2:
        {
            NSTimeInterval animationDuration = 0.30f;
            CGRect frame = self.view.frame;
            frame.origin.y =-50;
            [UIView beginAnimations:@"ResizeView" context:nil];
            [UIView setAnimationDuration:animationDuration];
            self.view.frame = frame;
            [UIView commitAnimations];
            
        }
        case 3:
        {
            NSTimeInterval animationDuration = 0.30f;
            CGRect frame = self.view.frame;
            frame.origin.y = -50;
            [UIView beginAnimations:@"ResizeView" context:nil];
            [UIView setAnimationDuration:animationDuration];
            self.view.frame = frame;
            [UIView commitAnimations];
            
        }
            
        default:
            break;
    }
    
}
-(void)btnBack:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
