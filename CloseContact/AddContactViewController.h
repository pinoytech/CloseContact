//
//  AddContactViewController.h
//  CloseContact
//
//  Created by Thorpe Obazee on 4/27/15.
//  Copyright (c) 2015 Thorpe Obazee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "DateHelper.h"

@interface AddContactViewController : UIViewController
@property (strong, nonatomic) UITextField *firstname;
@property (strong, nonatomic) UITextField *lastname;
@property (strong, nonatomic) UITextField *bday;
@property (strong, nonatomic) UIButton *bdayPickerChooserButton;
@property (strong, nonatomic) UIButton *bdayPickerButton;
@property (strong, nonatomic) UIView *bdayPickerContainer;
@property (strong, nonatomic) UIDatePicker *bdayPicker;
@property (strong, nonatomic) UIButton *saveContactButton;
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;

@end
