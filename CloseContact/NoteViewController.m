//
//  NoteViewController.m
//  CloseContact
//
//  Created by Thorpe Obazee on 4/21/15.
//  Copyright (c) 2015 Thorpe Obazee. All rights reserved.
//

#import "NoteViewController.h"
#import "DateHelper.h"
#import "AppDelegate.h"

@interface NoteViewController ()
@property (strong, nonatomic) AppDelegate *appDelegate;
@property (strong, nonatomic) NSString *selectedDate;

@end

@implementation NoteViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.noteLabel];
    [self.view addSubview:self.note];
    [self.view addSubview:self.saveButton];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.noteLabel setText: [NSString stringWithFormat:@"Information regarding %@ %@", self.user.firstname, self.user.lastname]];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    self.managedObjectContext = [appDelegate managedObjectContext];
    _note.text = self.user.note;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UILabel *) noteLabel {
    if (!_noteLabel ) {
        _noteLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_MARGIN, 80, SCREEN_WIDTH - SCREEN_MARGIN - SCREEN_MARGIN, 30)];
        _noteLabel.textColor = [UIColor blackColor];
        _noteLabel.font = [UIFont boldSystemFontOfSize:18.0f];
    }
    return _noteLabel;
}

- (UITextView *) note {
    if (!_note) {
        _note = [[UITextView alloc] initWithFrame:CGRectMake(SCREEN_MARGIN, self.noteLabel.frame.origin.y + self.noteLabel.frame.size.height, SCREEN_WIDTH - SCREEN_MARGIN - SCREEN_MARGIN, SCREEN_HEIGHT - self.noteLabel.frame.size.height - 200)];
        _note.text = @"";
        _note.layer.borderColor = [BLUE_GREEN CGColor];
        _note.layer.borderWidth= 1.0f;
    }
    return _note;
}

- (UIButton *) saveButton {
    if (!_saveButton) {
        _saveButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_MARGIN, self.note.frame.origin.y + self.note.frame.size.height + 10, self.note.frame.size.width, 50)];
        [_saveButton setTitle:@"Save Note" forState:UIControlStateNormal];
         _saveButton.layer.cornerRadius = CORNER_RADIUS;
         _saveButton.titleLabel.font = [UIFont boldSystemFontOfSize:18.0f];
        [_saveButton setBackgroundColor:BLUE_GREEN];
        [_saveButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
         [_saveButton addTarget:self action:@selector(saveNote:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _saveButton;
}

- (void) saveNote: (id) sender {
    [self.user setValue:self.note.text forKey:@"note"];
    NSError *error = nil;
    [self.managedObjectContext save:&error];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Notification" message:@"Note Updated!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
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
