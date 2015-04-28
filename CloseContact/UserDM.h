//
//  UserDM.h
//  CloseContact
//
//  Created by Thorpe Obazee on 4/21/15.
//  Copyright (c) 2015 Thorpe Obazee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class UserDM;

@interface UserDM : NSManagedObject

@property (nonatomic) int id;
@property (strong, nonatomic) NSString *firstname;
@property (strong, nonatomic) NSString *lastname;
@property (strong, nonatomic) NSDate *bday;
@property (strong, nonatomic) NSString *note;

@end
