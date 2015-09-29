//
//  DataValidate.h
//  Ligentia4
//
//  Created by Kevin Chen on 11/11/14.
//  Copyright (c) 2014 Ligentia Group. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <Foundation/Foundation.h>

@interface DataValidate : NSObject

//+(BOOL)isEmptyOrNullString:(NSString *)str;
+(BOOL)showHasErrorMessage:(NSString *)str;
+(BOOL)is404ErrorNotShow:(NSString *)str;
+(BOOL)is404ErrorShowMessage:(NSString *)str;

@end
