//
//  DataValidate.m
//  Ligentia4
//
//  Created by Kevin Chen on 11/11/14.
//  Copyright (c) 2014 Ligentia Group. All rights reserved.
//

#import "DataValidate.h"

@implementation DataValidate

//+(BOOL)isEmptyOrNullString:(NSString *)str
//{
//    BOOL isValidate = NO;
//    
//    if ([str isKindOfClass: [NSNull class]] || str == nil || str == NULL) {
//        isValidate = YES;
//    }
//    else{
//        isValidate=NO;
//    }
//    if (isValidate == NO) {
//        if ([[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
//            isValidate = YES;
//        }
//    }
//    
//    
//    return isValidate;
//}

+(BOOL)showHasErrorMessage:(NSString *)str
{
    BOOL isValidate = NO;
    if ([str isEqualToString:@"No data"]) {
        isValidate = YES;
        UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"Message Tip" message:str delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else if ([str rangeOfString:@"Get data error:"].location != NSNotFound){
        isValidate = YES;
        UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"Message Tip" message:str delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    
    return isValidate;
}

+(BOOL)is404ErrorNotShow:(NSString *)str
{
    BOOL isValidate = NO;
    static NSString *error = @"404 - File or directory not found.";
    if ([str rangeOfString:error].location != NSNotFound) {
        isValidate = YES;
//        UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"Message Tip" message:str delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        [alertView show];
    }
    
    
    return isValidate;
}

+(BOOL)is404ErrorShowMessage:(NSString *)str
{
    BOOL isValidate = NO;
    static NSString *error = @"404 - File or directory not found.";
    if ([str rangeOfString:error].location != NSNotFound) {
        isValidate = YES;
        UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"Message Tip" message:@"It is the server error, please check the server. The resource you are looking for might have been removed, had its name changed." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    
    return isValidate;
}

@end
