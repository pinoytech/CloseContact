//
//  ShowContactViewController.m
//  CloseContact
//
//  Created by Thorpe Obazee on 4/27/15.
//  Copyright (c) 2015 Thorpe Obazee. All rights reserved.
//

#import "ShowContactViewController.h"

@interface ShowContactViewController ()

@end

@implementation ShowContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.firstname];
    [self.view addSubview:self.lastname];
    [self.view addSubview:self.bday];
    NSLog(@"SHOW");
    self.firstname.text = self.user.firstname;
    [self.lastname setText:[self.user lastname]];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UIBarButtonItem *editItem = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(showEditController:)];
    self.navigationItem.rightBarButtonItem = editItem;
    
//    [self setViewControllers:[NSArray arrayWithObjects:self.showContactViewController, self.noteViewController, nil]];
    // Do any additional setup after loading the view.
}

- (EditContactViewController *) editContactViewController {
    if (!_editContactViewController) {
        self.editContactViewController = [[EditContactViewController alloc] init];
        self.editContactViewController.user = self.user;
    }
    return _editContactViewController;
}

- (void) showEditController: (id) sender {
    NSLog(@"MOVE!!");
    [self.navigationController pushViewController:self.editContactViewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UILabel *) firstname {
    if (!_firstname) {
        _firstname = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_MARGIN, 80, SCREEN_WIDTH - (SCREEN_MARGIN * 2), 30)];
    }
    return _firstname;
}

- (UILabel *) lastname {
    if (!_lastname) {
        _lastname = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_MARGIN, self.firstname.frame.origin.y + self.firstname.frame.size.height, SCREEN_WIDTH - (SCREEN_MARGIN * 2), 30)];
    }
    return _lastname;
}

- (UILabel *) bday {
    if (!_bday) {
        _bday = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_MARGIN, self.lastname.frame.origin.y + self.lastname.frame.size.height, SCREEN_WIDTH - (SCREEN_MARGIN * 2), 30)];
    }
    return _bday;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
