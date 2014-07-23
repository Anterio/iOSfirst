//
//  FHAViewController.m
//  First Homework App
//
//  Created by Arthur Boia on 7/21/14.
//  Copyright (c) 2014 Arthur Boia. All rights reserved.
//

#import "FHAViewController.h"

@interface FHAViewController ()

@end

@implementation FHAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)LoginButton:(id)sender
{
    NSString  *  username = self.usernameTextField.text;
    NSString * password = self.passwordField.text;
    NSLog(@"username is %@ and password is %@", username,password);
    if ([self.usernameTextField.text isEqualToString:@""])
        
    {
        self.error.text = @"Login Failed";
        UIAlertView * noUsernameAlert =
        [[UIAlertView alloc] initWithTitle:@"Failed Login" message:@"Enter Username NOW!" delegate: self cancelButtonTitle:@"Enter" otherButtonTitles:nil];
        
        
        
        
        NSLog(@"username is empty...tell user to fill in");
    }
    if ([self.passwordField.text isEqualToString:@""])
        
    {   
        UIAlertView * noUsernameAlert =
        [[UIAlertView alloc] initWithTitle:@"Failed Login" message:@"Enter Password Dummie" delegate: self cancelButtonTitle:@"Enter" otherButtonTitles:nil];
        
        
        [noUsernameAlert show];
        
        NSLog(@"username is empty...tell user to fill in");
    }
    if ([self.passwordField.text isEqualToString:@""] && [self.usernameTextField.text isEqualToString:@""])
        
    {
        UIAlertView * noUsernameAlert =
        [[UIAlertView alloc] initWithTitle:@"Failed Login" message:@"Enter US and Password Dummie" delegate: self cancelButtonTitle:@"Enter" otherButtonTitles:nil];
        
        
        [noUsernameAlert show];
        
        NSLog(@"username is empty...tell user to fill in");
    }
}






- (IBAction)changeGreen:(id)sender
     {
         self.view.backgroundColor = [UIColor greenColor];
    }

- (IBAction)changeBlue:(id)sender {
    self.view.backgroundColor = [UIColor blueColor];
}

- (IBAction)reset:(id)sender {
    self.usernameTextField.text = @"";
    self.passwordField.text = @"";
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (IBAction)changeRed:(id)sender {
    self.view.backgroundColor = [UIColor redColor];
}

@end
