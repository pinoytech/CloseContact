//
//  ShowContactViewController.h
//  CloseContact
//
//  Created by Thorpe Obazee on 4/27/15.
//  Copyright (c) 2015 Thorpe Obazee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserDM.h"
#import "Constants.h"
#import "EditContactViewController.h"

@interface ShowContactViewController : UIViewController

@property (strong, nonatomic) UILabel *firstname;
@property (strong, nonatomic) UILabel *lastname;
@property (strong, nonatomic) UILabel *bday;
@property (strong, nonatomic) UserDM *user;
@property (strong, nonatomic) EditContactViewController *editContactViewController;
@end
