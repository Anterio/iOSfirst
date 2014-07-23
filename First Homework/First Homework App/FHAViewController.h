//
//  FHAViewController.h
//  First Homework App
//
//  Created by Arthur Boia on 7/21/14.
//  Copyright (c) 2014 Arthur Boia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FHAViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
- (IBAction)LoginButton:(id)sender;
- (IBAction)ResetButton:(id)sender;




//  2 textfields(username, password)

//  3 labels (username = username.text, same with password, error label to equal different messages empty username, password or both fields empty)
@property (weak, nonatomic) IBOutlet UILabel *error;
- (IBAction)changeGreen:(id)sender;
- (IBAction)changeBlue:(id)sender;
- (IBAction)reset:(id)sender;
- (IBAction)changeRed:(id)sender;



// 2 button (login, reset)

// 3 buttons (no text different background colors, when you tap them, change the view background color to match to button)


@end
