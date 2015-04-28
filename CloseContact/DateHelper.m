//
//  DateHelper.m
//  CloseContact
//
//  Created by Thorpe Obazee on 4/23/15.
//  Copyright (c) 2015 Thorpe Obazee. All rights reserved.
//

#import "DateHelper.h"

@implementation DateHelper

+ (NSString *)dateToString:(NSDate *)date stringFormat:(NSString *)string {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:string];
    return [formatter stringFromDate:date];
}

+ (NSDate *)stringToDate:(NSString *) stringDate stringFormat:(NSString *)stringText {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:stringText];
    return [dateFormatter dateFromString:stringDate];
}
@end