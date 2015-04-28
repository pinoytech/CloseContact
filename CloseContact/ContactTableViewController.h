//
//  ContactTableViewController.h
//  CloseContact
//
//  Created by Thorpe Obazee on 4/21/15.
//  Copyright (c) 2015 Thorpe Obazee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserDM.h"
#import "ShowContactViewController.h"
#import <CoreData/CoreData.h>
#import "SecondTabBarViewController.h"
#import "ShowContactViewController.h"
#import "NoteViewController.h"

@interface ContactTableViewController : UITableViewController

@property (strong, nonatomic) UserDM *contact;
@property (strong, nonatomic) NSMutableArray *contacts;
@property (strong, nonatomic) NSFetchRequest *fetchRequest;
@property (strong, nonatomic) NSEntityDescription *entity;

@property (strong, nonatomic) SecondTabBarViewController *secondTabBarViewController;
@property (strong, nonatomic) ShowContactViewController *showContactViewController;
@property (strong, nonatomic) NoteViewController *noteViewController;

@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;

@end
