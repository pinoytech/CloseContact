//
//  AppDelegate.h
//  CloseContact
//
//  Created by Thorpe Obazee on 4/21/15.
//  Copyright (c) 2015 Thorpe Obazee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "NavigationViewController.h"
#import "FirstTabBarViewController.h"
#import "SecondTabBarViewController.h"
#import "AddContactViewController.h"
#import "EditContactViewController.h"
#import "ShowContactViewController.h"
#import "NoteViewController.h"
#import "UserDM.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NavigationViewController *contactNavigationController;
@property (strong, nonatomic) FirstTabBarViewController *firstTabBarViewController;
@property (strong, nonatomic) SecondTabBarViewController *secondTabBarViewController;
@property (strong, nonatomic) AddContactViewController *addContactViewController;
@property (strong, nonatomic) EditContactViewController *editContactViewController;
@property (strong, nonatomic) ShowContactViewController *showContactViewController;
@property (strong, nonatomic) NoteViewController *noteViewController;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

