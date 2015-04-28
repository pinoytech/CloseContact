//
//  DateHelper.h
//  CloseContact
//
//  Created by Thorpe Obazee on 4/23/15.
//  Copyright (c) 2015 Thorpe Obazee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateHelper : NSObject
+ (NSString *) dateToString: (NSDate *) date stringFormat: (NSString *) string;
+ (NSString *) stringToDate: (NSString *) stringDate stringFormat: (NSString *) stringFormat;
@end