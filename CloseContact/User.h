//
//  User.h
//  CloseContact
//
//  Created by Thorpe Obazee on 4/27/15.
//  Copyright (c) 2015 Thorpe Obazee. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface User : NSManagedObject
@property (nonatomic) int id;
@property (nonatomic, retain) NSString *firstname;
@property (nonatomic, retain) NSString *lastname;
@property (nonatomic, retain) NSDate *bday;
@property (nonatomic, retain) NSString *note;
@end