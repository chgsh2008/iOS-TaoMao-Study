//
//  KStatus.m
//  UiViewDemo
//
//  Created by Kevin Chen on 8/15/15.
//  Copyright (c) 2015 KCGroup. All rights reserved.
//

#import "KStatus.h"

@implementation KStatus

-(KStatus *)initWithDictionary:(NSDictionary *)dic{
    if (self = [super init]) {
        self.Id=[dic[@"Id"] longLongValue];
        self.profileImageUrl=dic[@"profileImageUrl"];
        self.userName=dic[@"userName"];
        self.mbtype=dic[@"mbtype"];
        self.createdAt=dic[@"createdAt"];
        self.source=dic[@"source"];
        self.text=dic[@"text"];
    }
    return self;
}

+(KStatus *)statusWithDictionary:(NSDictionary *)dic{
    KStatus *status = [[KStatus alloc]initWithDictionary:dic];
    return status;
}
-(NSString*)source {
    return [NSString stringWithFormat:@"来自：%@",source];
}
@end
