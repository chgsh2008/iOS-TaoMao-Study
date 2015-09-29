//
//  TMSecondClassViewController.m
//  TaoMao
//
//  Created by mac on 14-4-16.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "TMSecondClassViewController.h"
#import "TMThirdClassViewController.h"
#import "TMGoodsDetailsViewController.h"
static CGFloat kImageOriginHight = 220;
@interface TMSecondClassViewController ()
{
    UIView *view_bar;
}
@end

@implementation TMSecondClassViewController

-(void)dealloc
{
    [view_bar release];
    [self.marrayAll release];
    [super dealloc];
}
-(id)initWithTitle:(NSString*)title addWithID:(NSString*)ID
{
    self=[super init];
    if (self)
    {
        naviTitle =[[NSString alloc]initWithString:title];
        _ID=[[NSString alloc]initWithString:ID];
    }
    return self;
}
-(void) viewWillAppear:(BOOL)animated
{
    _bigImg.frame=CGRectMake(0, -kImageOriginHight, _scrollView.frame.size.width, kImageOriginHight);
    _scrollView.contentOffset=CGPointMake(0, -kImageOriginHight);
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initNavigationBar];
    self.marrayAll=[[NSMutableArray alloc]init];

//    UIImageView * imgView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50, 320, 220)];
//    imgView1.image = [UIImage imageNamed:@"shop_df_big_.png"];
//    imgView1.backgroundColor = [UIColor blackColor];
//    imgView1.contentMode = UIViewContentModeScaleToFill;
//    [self.view addSubview:imgView1];
    
//    int y = view_bar.frame.size.height;
//    _bigImg=[[UrlImageButton alloc]initWithFrame:CGRectMake(0, y, 320, 220)];
//    [_bigImg setImage:BundleImage(@"shop_df_big_.png") forState:0];
//    _bigImg.backgroundColor=[UIColor clearColor];
//    [self.view addSubview:_bigImg];
    

    _scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0,view_bar.frame.size.height, 320, self.view.frame.size.height -10 )];
    //_scrollView.delegate = self;
    _scrollView.userInteractionEnabled=YES;
    _scrollView.contentSize=CGSizeMake(320, self.view.frame.size.height);
    _scrollView.showsVerticalScrollIndicator = YES;
    _scrollView.backgroundColor=[UIColor colorWithRed:.98 green:.98 blue:.98 alpha:1.0];
    _scrollView.contentInset=UIEdgeInsetsMake(kImageOriginHight, 0, 50, 0);
    [self.view addSubview:_scrollView];
    
    _bigImg=[[UrlImageButton alloc]initWithFrame:CGRectMake(0, -kImageOriginHight, 320, kImageOriginHight)];
   // [_bigImg addTarget:self action:@selector(btnImageText:) forControlEvents:UIControlEventTouchUpInside];
    [_bigImg setImage:BundleImage(@"shop_df_big_.png") forState:0];
    _bigImg.backgroundColor=[UIColor clearColor];
    [_scrollView addSubview:_bigImg ];
    
   [self initScrollView];
//    http://192.168.1.119:8080/weimao/mobile/commodity_category/category
    //NSString *parmeters1=[NSString stringWithFormat:@"parentId=%@",_ID];
//    [[RequestServer instance] doActionAsync:0 withAction:@"/mobile/commodity_category/category?" withParameters:parmeters1 withDelegate:self];
    
    
    
}
-(void)initScrollView
{
    
    
    UIView *_bigView=[[UIView alloc]initWithFrame:CGRectMake(0, _bigImg.frame.size.height+_bigImg.frame.origin.y-30, 320, 30)];
    _bigView.layer.borderWidth=1;
    _bigView.layer.borderColor=[UIColor colorWithRed:.9 green:.9 blue:.9 alpha:1.0].CGColor;
    
    _bigView.backgroundColor=[UIColor whiteColor];
    [_scrollView addSubview:_bigView];
    
    UILabel *title_label=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 250, 30)];
    //title_label.text=@"超甜美小香风蕾丝绣花连衣裙";
    title_label.text=@"澳洲哈密瓜";
    title_label.font=[UIFont boldSystemFontOfSize:10];
    title_label.backgroundColor=[UIColor clearColor];
    title_label.textColor =[UIColor colorWithRed:.3 green:.3 blue:.3 alpha:1.0];
    title_label.textAlignment=0;
    [_bigView insertSubview:title_label atIndex:0];

    
//    UILabel *title_money=[[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width - 200,0, 165, 30)];
//    title_money.text=@"德天独厚的自然环境 导致务必甜美 ";
//    title_label.numberOfLines = 2;
//    title_money.font=[UIFont systemFontOfSize:14];
//    title_money.backgroundColor=[UIColor clearColor];
//    title_money.textColor =hongShe;
//    title_money.textAlignment=0;
//    [_bigView insertSubview:title_money atIndex:0];
    
    NSString *str = @"德天独厚的自然环境 导致务必甜美 ";
    CGSize size = [str sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(150,10000.0f)lineBreakMode:UILineBreakModeWordWrap];
    
    UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width - 200,0,size.width,size.height)];
    lb.numberOfLines = 0; // 最关键的一句
    lb.text = str;
    lb.font = [UIFont systemFontOfSize:14];
    [_bigView addSubview:lb];
    [lb release];
}

-(UIView*)initNavigationBar
{
    self.navigationController.navigationBarHidden = YES;
    view_bar =[[UIView alloc]init];
    if ([[[UIDevice currentDevice]systemVersion]floatValue]>6.1)
    {
        view_bar .frame=CGRectMake(0, 0, self.view.frame.size.width, 44+20);
        UIImageView *imageV=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, 44+20)];
        imageV.image = BundleImage(@"top.png");
        [view_bar addSubview:imageV];
        [imageV release];
        
    }else{
        view_bar .frame=CGRectMake(0, 0, self.view.frame.size.width, 44);
        UIImageView *imageV=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, 44)];
        imageV.image = BundleImage(@"top.png");
        [view_bar addSubview:imageV];
        [imageV release];
    }
    view_bar.backgroundColor=[UIColor redColor];
    
    [self.view addSubview: view_bar];
    UILabel *title_label=[[UILabel alloc]initWithFrame:CGRectMake(65, view_bar.frame.size.height-44, self.view.frame.size.width-130, 44)];
    title_label.text=naviTitle;
    title_label.font=[UIFont boldSystemFontOfSize:20];
    title_label.backgroundColor=[UIColor clearColor];
    title_label.textColor =[UIColor whiteColor];
    title_label.textAlignment=1;
    [view_bar addSubview:title_label];
    
    UIButton*btnBack=[UIButton buttonWithType:0];
    btnBack.frame=CGRectMake(0, view_bar.frame.size.height-34, 47, 34);
    [btnBack setImage:BundleImage(@"ret_01.png") forState:0];
    [btnBack addTarget:self action:@selector(btnBack:) forControlEvents:UIControlEventTouchUpInside];
    [view_bar addSubview:btnBack];
    [title_label release];
    
    return view_bar;
}
-(void)btnBack:(id)sender
{

    TMAppDelegate *app=(TMAppDelegate*)[UIApplication sharedApplication].delegate;
    [app.navigationController popViewControllerAnimated:YES];
}


-(void)requestFinished:(NSNumber *)code withMessage:(NSString *)message withData:(id)data
{
    
//    if ([message isEqualToString:@"/mobile/commodity_category/category"])
//    {
            self.marrayAll=data;
//    }
    NSLog(@"%@,message=%@",self.marrayAll,message);
    
    if (self.marrayAll.count>0&&50*self.marrayAll.count+view_bar.frame.size.height>self.view.frame.size.height)
    {
        firstLevelMenuView = [[firstLevelMenu alloc]initWithFrame:CGRectMake(0, 64, 80,50*self.marrayAll.count-view_bar.frame.size.height-30) Contents:[NSArray arrayWithArray:self.marrayAll ]];
       
    }else{
    
        firstLevelMenuView = [[firstLevelMenu alloc]initWithFrame:CGRectMake(0, 64, 80,50*self.marrayAll.count ) Contents:[NSArray arrayWithArray:self.marrayAll ]];
        firstLevelMenuView.scrollEnabled=NO;
    }
    
    
    firstLevelMenuView.tag = 100000;
    firstLevelMenuView.menuDelegate = self;
    firstLevelMenuView.backgroundColor=[UIColor clearColor];
    [self.view addSubview:firstLevelMenuView];
    
    secondLevelMenuView = [[secondLevelMenu alloc]initWithFrame:CGRectMake(80, view_bar.frame.size.height, self.view.frame.size.width-80,(floor(20/3)+1)*(320-80-20)/3)  Contents:nil addWithClassicID:[[self.marrayAll objectAtIndex:0] objectForKey:@"id"]];
    secondLevelMenuView.tag = 100001;
    secondLevelMenuView.backgroundColor = [UIColor whiteColor];
    secondLevelMenuView.smenuDelegate = self;
    
    if (IS_IPHONE_5) {
        
        secondLevelMenuView.contentSize=CGSizeMake(320-80, self.view.frame.size.height+70);
    }else{
        secondLevelMenuView.contentSize=CGSizeMake(320-80, self.view.frame.size.height+280);
    }
    
    [self.view addSubview:secondLevelMenuView];

}
//一级代理
- (void)selectTheSpecificRow:(int)num addSelectTag:(int)tag
{

    secondLevelMenuView = [[secondLevelMenu alloc]initWithFrame:CGRectMake(80, view_bar.frame.size.height, self.view.frame.size.width-80,(floor(20/3)+1)*(320-80-20)/3)  Contents:nil addWithClassicID:[NSString stringWithFormat:@"%@",[[self.marrayAll objectAtIndex:tag] objectForKey:@"id"]]];
    secondLevelMenuView.tag = 100001;
    secondLevelMenuView.userInteractionEnabled=YES;
    secondLevelMenuView.backgroundColor = [UIColor whiteColor];
    secondLevelMenuView.smenuDelegate = self;
    secondLevelMenuView.contentSize=CGSizeMake(320-80, self.view.frame.size.height+70);
    
    [self.view addSubview:secondLevelMenuView];

}
//二级代理
- (void)secondLevelMenuselectTheSpecificRow:(int)num addName:(NSString *)name
{

//    if ([self.view viewWithTag:99999])
//    {
//        [[self.view viewWithTag:99999] removeFromSuperview];
//    }

    [self colection11:num addName:name];
    TMGoodsDetailsViewController *third=[[TMGoodsDetailsViewController alloc]init];
    TMAppDelegate *app=(TMAppDelegate*)[UIApplication sharedApplication].delegate;
    [app.navigationController pushViewController:third animated:YES];
 
}
-(void)colection11:(int)num addName:(NSString*)name;
{
//    isone=YES;
//    istwo=NO;
//    isthree=NO;
//    
//    secondName=name;
//    _btn11Select=YES;
//    secondCellIndexPath=num;
//    NSLog(@"%d",num);
//    NSString*string;
//    if ([[_marraySecond objectAtIndex:num]length]<=0)
//    {
//        string=@"";
//    }else{
//        
//        string=[_marraySecond objectAtIndex:num];
//    }
//    [[NSUserDefaults standardUserDefaults]setObject:string forKey:@"distinctid"];
//    
//    NSString *typeB=@"";
//    NSString *area=@"";
//    NSString  *distinctid=@"";
//    NSString*typeA=@"";
//    NSString*areB=@"";
//    
//    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"typeb"]!=nil)
//    {
//        typeB=[[NSUserDefaults standardUserDefaults] objectForKey:@"typeb"];
//    }
//    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"area"]!=nil) {
//        area=[[NSUserDefaults standardUserDefaults] objectForKey:@"area"];
//    }
//    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"areab"]!=nil) {
//        areB=[[NSUserDefaults standardUserDefaults] objectForKey:@"areab"];
//    }
//    if ([[NSUserDefaults standardUserDefaults]objectForKey:@"distinctid"]!=nil)
//    {
//        distinctid=[[NSUserDefaults standardUserDefaults] objectForKey:@"distinctid"];
//    }
//    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"type"]!=nil) {
//        typeA=[[NSUserDefaults standardUserDefaults] objectForKey:@"type"];
//    }
//    [[GlobalTool sharedGlobalTool] getAppData];
//    
//    NSArray *array=[[NSArray alloc] initWithObjects:
//                    [NSString stringWithFormat:@"deviceid=%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"deviceid"]],
//                    [NSString stringWithFormat:@"verfity=%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"verfity"]],
//                    [NSString stringWithFormat:@"appid=%@",[GlobalTool sharedGlobalTool].apkid],
//                    [NSString stringWithFormat:@"userid=%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"userid"]],
//                    [NSString stringWithFormat:@"lng=%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"lng"]],
//                    [NSString stringWithFormat:@"lat=%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"lat"]],
//                    [NSString stringWithFormat:@"distinctid=%@",distinctid],
//                    [NSString stringWithFormat:@"areab=%@",areB],
//                    [NSString stringWithFormat:@"area=%@",area],
//                    [NSString stringWithFormat:@"type=%@",typeA],
//                    [NSString stringWithFormat:@"typeb=%@",typeB],
//                    [NSString stringWithFormat:@"cityname=%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"selectArea"]],
//                    
//                    [NSString stringWithFormat:@"page=%d",_page],
//                    [NSString stringWithFormat:@"pagecount=20"],
//                    nil];
//    NSLog(@"%@",array);
//    XcUpdateOne *upda = [[XcUpdateOne alloc] initWithMethodName:@"LTKShopinfoList" params:array delegate:self isRefresh:(_refreshPos==EGORefreshHeader)||(_refreshPos==EGORefreshFooter)];
//    [XcDataManager loadData:[NSArray arrayWithObjects:upda, nil]];
//    [array release];
//    [string release];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
