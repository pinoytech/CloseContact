//
//  ContactTableViewController.m
//  CloseContact
//
//  Created by Thorpe Obazee on 4/21/15.
//  Copyright (c) 2015 Thorpe Obazee. All rights reserved.
//

#import "ContactTableViewController.h"
#import "AppDelegate.h"

@interface ContactTableViewController ()
@property (strong, nonatomic) AppDelegate *appDelegate;
@property (strong, nonatomic) UITabBarController *tabBarController;
@end

@implementation ContactTableViewController

//@synthesize managedObjectContext;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"contactCell"];
    self.title = @"Contacts";

    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    self.managedObjectContext = [appDelegate managedObjectContext];

//    UserDM *user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:self.managedObjectContext];

//    [newTask setValue:@"Teejay" forKey:@"firstname"];
//    [newTask setValue:@"Obazee" forKey:@"lastname"];
//    [newTask setValue:@"Some Information" forKey:@"note"];
//    [newTask setValue:[NSDate date] forKey:@"bday"];
//    user.firstname = @"Ayra";
//    user.lastname = @"Panganiban";
//    
//    NSError *error = nil;
//    // Save the object to persistent store
//    [self.managedObjectContext save:&error];

//    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
//    context = [appDelegate managedObjectContext];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void) viewWillAppear:(BOOL)animated {
    self.navigationController.navigationItem.title = @"WhatSoEver";
    self.navigationController.navigationBar.barTintColor = YELLOW;
    [self getContacts];
  
}

- (NSMutableArray *) contacts {
    if (!_contacts) {
//        NSArray *raw_contacts = [NSArray arrayWithObjects:@"Teejay", @"Ayra", @"RuthG", @"ShielaS", @"Gene", @"MylesM", nil];
        _contacts = [[NSMutableArray alloc] init];
//        for (NSString *contact in raw_contacts) {
//            UserDM *user = [[UserDM alloc] init];
//            user.firstname = contact;
//            [_contacts addObject:user];
//        }
//
//        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
//        NSEntityDescription *entity = [NSEntityDescription
//                                       entityForName:@"User" inManagedObjectContext:self.managedObjectContext];
//        [fetchRequest setEntity:entity];
//
//        NSError *error;
//        _contacts = [[self.managedObjectContext executeFetchRequest:fetchRequest error:&error] copy];

    }
    return _contacts;
}


- (void) getContacts {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"User" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSError *error;
    _contacts = [[self.managedObjectContext executeFetchRequest:fetchRequest error:&error] copy];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.contacts.count;
}

- (SecondTabBarViewController *) secondTabBarViewController {
    if (!_secondTabBarViewController) {
        _secondTabBarViewController = [[SecondTabBarViewController alloc] init];
        _secondTabBarViewController.viewControllers = [NSArray arrayWithObjects:self.showContactViewController, self.noteViewController, nil];
    }
    return _secondTabBarViewController;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    SecondTabBarViewController *secondTabBarViewController = [[SecondTabBarViewController alloc] init];
    ShowContactViewController *showContactViewController = [[ShowContactViewController alloc] init];
//    secondTabBarViewController.showContactViewController.user = [self.contacts objectAtIndex:indexPath.row];

    showContactViewController.user = [self.contacts objectAtIndex:indexPath.row];
//    _secondTabBarViewController = [[SecondTabBarViewController alloc] init];
//    self.secondTabBarViewController.viewControllers = [NSArray arrayWithObjects:self.showContactViewController, self.noteViewController, nil];

//    [[_secondTabBarViewController.viewControllers objectAtIndex:0] setUser:[_contacts objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:showContactViewController animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"contactCell" forIndexPath:indexPath];
    
    // Configure the cell...
    UserDM *user = [self.contacts objectAtIndex:indexPath.row];
    cell.textLabel.text = user.firstname;
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
