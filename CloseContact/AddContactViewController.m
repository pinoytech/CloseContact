//
//  AddContactViewController.m
//  CloseContact
//
//  Created by Thorpe Obazee on 4/27/15.
//  Copyright (c) 2015 Thorpe Obazee. All rights reserved.
//

#import "AddContactViewController.h"
#import "AppDelegate.h"

@interface AddContactViewController ()

@end

@implementation AddContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.firstname];
    [self.view addSubview:self.lastname];
    [self.view addSubview:self.bday];
    [self.view addSubview:self.bdayPickerChooserButton];
    [self.view addSubview:self.bdayPickerContainer];
    [self.view addSubview:self.saveContactButton];
    self.bdayPickerContainer.hidden = YES;

    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    self.managedObjectContext = [appDelegate managedObjectContext];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITextField *) firstname {
    if (!_firstname) {
        _firstname = [[UITextField alloc] initWithFrame:CGRectMake(SCREEN_MARGIN, 80, SCREEN_WIDTH - (SCREEN_MARGIN * 2), 30)];
        _firstname.placeholder = @"First Name";
        _firstname.layer.borderColor = [BLUE_GREEN CGColor];
        _firstname.layer.borderWidth= 1.0f;
    }
    return  _firstname;
}

- (UITextField *) lastname {
    if (!_lastname) {
        _lastname = [[UITextField alloc] initWithFrame:CGRectMake(SCREEN_MARGIN, self.firstname.frame.origin.y + self.firstname.frame.size.height + 10, SCREEN_WIDTH - (SCREEN_MARGIN * 2), 30)];
        _lastname.placeholder = @"Last Name";
        _lastname.layer.borderColor = [BLUE_GREEN CGColor];
        _lastname.layer.borderWidth= 1.0f;
    }
    return  _lastname;
}

- (UITextField *) bday {
    if (!_bday) {
        _bday = [[UITextField alloc] initWithFrame:CGRectMake(SCREEN_MARGIN, self.lastname.frame.origin.y + self.lastname.frame.size.height + 10, (SCREEN_WIDTH * 0.75) - (SCREEN_MARGIN * 1.5), 30)];
        _bday.layer.borderColor = [BLUE_GREEN CGColor];
        _bday.layer.borderWidth= 1.0f;
        [_bday setText:[DateHelper dateToString:[NSDate date] stringFormat:@"MMMM dd, yyy"]];
    }
    return _bday;
}

- (UIButton *) bdayPickerChooserButton {
    if (!_bdayPickerChooserButton) {
        _bdayPickerChooserButton = [[UIButton alloc] initWithFrame:CGRectMake(self.bday.frame.origin.x + self.bday.frame.size.width + 10, self.bday.frame.origin.y, (SCREEN_WIDTH * 0.25) - (SCREEN_MARGIN * 1.5), self.bday.frame.size.height)];
        [_bdayPickerChooserButton setTitle:@"Date?" forState:UIControlStateNormal];
        [_bdayPickerChooserButton setBackgroundColor:BLUE_GREEN];
        [_bdayPickerChooserButton addTarget:self action:@selector(showPicker:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bdayPickerChooserButton;
}

- (void) showPicker: (id) sender {
    self.bdayPickerContainer.hidden = NO;
}

- (UIButton *) bdayPickerButton {
    if (!_bdayPickerButton) {
        _bdayPickerButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
        _bdayPickerButton.backgroundColor = BLUE_GREEN;
        [_bdayPickerButton setTitle:@"DONE" forState:UIControlStateNormal];
        [_bdayPickerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_bdayPickerButton addTarget:self action:@selector(hidePicker:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bdayPickerButton;
}

- (void) hidePicker: (id) sender {
    self.bdayPickerContainer.hidden = YES;
}

- (UIView *) bdayPickerContainer {
    if (!_bdayPickerContainer) {
        _bdayPickerContainer = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 300, SCREEN_WIDTH, 300)];
        [_bdayPickerContainer setBackgroundColor:[UIColor whiteColor]];
        [_bdayPickerContainer addSubview:self.bdayPickerButton];
        [_bdayPickerContainer addSubview:self.bdayPicker];
    }
    return _bdayPickerContainer;
}

- (void) pickDate: (id) sender {
    NSLog(@"*******%@", self.bdayPicker.date);
    [self.bday setText:[DateHelper dateToString:self.bdayPicker.date stringFormat:@"MMMM dd, yyy"]];
}

- (UIDatePicker *) bdayPicker {
    if (!_bdayPicker) {
        _bdayPicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(self.bdayPickerButton.frame.origin.x, self.bdayPickerButton.frame.origin.y + self.bdayPickerButton.frame.size.height, self.bdayPickerButton.frame.size.width, 250)];
        _bdayPicker.datePickerMode = UIDatePickerModeDate;
        [_bdayPicker addTarget:self action:@selector(pickDate:) forControlEvents:UIControlEventValueChanged];
    }
    return _bdayPicker;
}

- (UIButton *) saveContactButton {
    if (!_saveContactButton) {
        _saveContactButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_MARGIN, self.bday.frame.origin.y + self.bday.frame.size.height + 10, SCREEN_WIDTH - (SCREEN_MARGIN * 2), 30)];
        [_saveContactButton setTitle:@"Save Contact" forState:UIControlStateNormal];
        [_saveContactButton setBackgroundColor:BLUE_GREEN];
        [_saveContactButton addTarget:self action:@selector(saveContact:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _saveContactButton;
}

- (void) saveContact: (id) sender {
    UserDM *user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:self.managedObjectContext];
 
    user.firstname = self.firstname.text;
    user.lastname = self.lastname.text;
    user.bday = [DateHelper stringToDate:self.bday.text stringFormat:@"MMMM dd, yyy"];

    NSError *error = nil;
    // Save the object to persistent store
    [self.managedObjectContext save:&error];
    self.firstname.text = @"";
    self.lastname.text = @"";
    self.bday.text = [DateHelper dateToString:[NSDate date] stringFormat:@"MMMM dd, yyy"];
}
//- (UILabel *) bdayLabel {
//    if (!_bdayLabel) {
//        _bdayLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_MARGIN, 80, SCREEN_WIDTH - (SCREEN_MARGIN * 2), 30)];
//        [_bdayLabel setText:@"Birthday"];
//        _bdayLabel.textColor = [UIColor blackColor];
//        _bdayLabel.font = [UIFont boldSystemFontOfSize:18.0f];
//    }
//    return _bdayLabel;
//}
//
//- (UITextField *) bdayField {
//    if (!_bdayField) {
//        _bdayField = [[UITextField alloc] initWithFrame:CGRectMake(SCREEN_MARGIN, self.bdayLabel.frame.origin.y + self.bdayLabel.frame.size.height + 10, (SCREEN_WIDTH * 0.75) - (SCREEN_MARGIN * 1.5), 50)];
//        _bdayField.layer.borderColor = [BLUE_GREEN CGColor];
//        _bdayField.layer.borderWidth= 1.0f;
//        [_bdayField setText:[DateHelper dateToString:[NSDate date] stringFormat:@"MMMM dd, yyy"]];
//    }
//    return _bdayField;
//}
//
//
//- (UIButton *) bdayPickerChooserButton {
//    if (!_bdayPickerChooserButton) {
//        _bdayPickerChooserButton = [[UIButton alloc] initWithFrame:CGRectMake(self.bdayField.frame.origin.x + self.bdayField.frame.size.width + 10, self.bdayField.frame.origin.y, (SCREEN_WIDTH * 0.25) - (SCREEN_MARGIN * 1.5), self.bdayField.frame.size.height)];
//        [_bdayPickerChooserButton setTitle:@"Date?" forState:UIControlStateNormal];
//        [_bdayPickerChooserButton setBackgroundColor:BLUE_GREEN];
//        [_bdayPickerChooserButton addTarget:self action:@selector(showPicker:) forControlEvents:UIControlEventTouchUpInside];
//    }
//    return _bdayPickerChooserButton;
//}
//
//- (void) showPicker: (id) sender {
//    self.bdayPickerContainer.hidden = NO;
//}
//
//- (UIDatePicker *) bdayPicker {
//    if (!_bdayPicker) {
//        _bdayPicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(self.bdayPickerButton.frame.origin.x, self.bdayPickerButton.frame.origin.y + self.bdayPickerButton.frame.size.height, self.bdayPickerButton.frame.size.width, 250)];
//        _bdayPicker.datePickerMode = UIDatePickerModeDate;
//        [_bdayPicker addTarget:self action:@selector(pickDate:) forControlEvents:UIControlEventValueChanged];
//    }
//    return _bdayPicker;
//}
//
//- (UIButton *) bdayPickerButton {
//    if (!_bdayPickerButton) {
//        _bdayPickerButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
//        _bdayPickerButton.backgroundColor = BLUE_GREEN;
//        [_bdayPickerButton setTitle:@"DONE" forState:UIControlStateNormal];
//        [_bdayPickerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [_bdayPickerButton addTarget:self action:@selector(hidePicker:) forControlEvents:UIControlEventTouchUpInside];
//    }
//    return _bdayPickerButton;
//}
//
//- (void) hidePicker: (id) sender {
//    self.bdayPickerContainer.hidden = YES;
//}
//
//- (UIView *) bdayPickerContainer {
//    if (!_bdayPickerContainer) {
//        _bdayPickerContainer = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 300, SCREEN_WIDTH, 300)];
//        [_bdayPickerContainer setBackgroundColor:[UIColor whiteColor]];
//        [_bdayPickerContainer addSubview:self.bdayPickerButton];
//        [_bdayPickerContainer addSubview:self.bdayPicker];
//    }
//    return _bdayPickerContainer;
//}
//
//- (void) pickDate: (id) sender {
//    NSLog(@"*******%@", self.bdayPicker.date);
//    [self.bdayField setText:[DateHelper dateToString:self.bdayPicker.date stringFormat:@"MMMM dd, yyy"]];
//}
//
//- (UIButton *) saveButton {
//    if (!_saveButton) {
//        _saveButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_MARGIN, self.note.frame.origin.y + self.note.frame.size.height + 10, self.note.frame.size.width, 50)];
//        [_saveButton setTitle:@"Save Note" forState:UIControlStateNormal];
//        _saveButton.layer.cornerRadius = CORNER_RADIUS;
//        _saveButton.titleLabel.font = [UIFont boldSystemFontOfSize:18.0f];
//        [_saveButton setBackgroundColor:BLUE_GREEN];
//        [_saveButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [_saveButton addTarget:self action:@selector(saveNote:) forControlEvents:UIControlEventTouchUpInside];
//        
//    }
//    return _saveButton;
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
