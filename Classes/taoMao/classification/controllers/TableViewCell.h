//
//  TableViewCell.h
//  UiViewDemo
//
//  Created by Kevin Chen on 8/15/15.
//  Copyright (c) 2015 KCGroup. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KStatus;
@interface TableViewCell : UITableViewCell

#pragma 微博对象
@property (nonatomic,strong)KStatus *status;

@property(assign,nonatomic)CGFloat height;

@end
