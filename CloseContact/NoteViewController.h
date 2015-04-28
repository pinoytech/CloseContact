//
//  NoteViewController.h
//  CloseContact
//
//  Created by Thorpe Obazee on 4/21/15.
//  Copyright (c) 2015 Thorpe Obazee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Constants.h"
#import "UserDM.h"


@interface NoteViewController : UIViewController

@property (strong, nonatomic) UITextView *note;
@property (strong, nonatomic) UILabel *noteLabel;
@property (strong, nonatomic) UIButton *saveButton;
@property (strong, nonatomic) UserDM *user;


@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;

@end
