//
//  MFCRootViewController.m
//  My First Code App
//
//  Created by Arthur Boia on 7/22/14.
//  Copyright (c) 2014 Arthur Boia. All rights reserved.
//

#import "MFCRootViewController.h"

@interface MFCRootViewController () <UITextFieldDelegate>

//  declare private properties and methods


@end

@implementation MFCRootViewController
{
    UILabel * someLabel;
    UITextField * usernameField;
    UITextField * passwordField;
    UITextField * emailField;
    UITextField * phoneField;
    UIButton * redButton;
    UIButton * YellowButton;
//    GKSession * session;
}




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSLog(@"init");
        
        self.view.backgroundColor = [UIColor colorWithRed:0.000f green:0.502f blue:1.000f alpha:1.0f];
    }
    return self;
}

-(void)dismissKeyboard
{
    [passwordField resignFirstResponder];
    [usernameField resignFirstResponder];
    [phoneField resignFirstResponder];
    [emailField resignFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    int screenHeight = [UIScreen mainScreen].bounds.size.height;
    int screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    UIButton * loginButton = [[UIButton alloc] initWithFrame:CGRectMake(10, screenHeight - 60, screenWidth - 20, 50)];
    
    loginButton.backgroundColor = [UIColor blueColor];
    [loginButton setTitle:@"Login" forState:UIControlStateNormal];
    [self.view addSubview:loginButton];
    loginButton.layer.cornerRadius = 10;
    [loginButton addTarget:self action:@selector(loginButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * resetButton = [[UIButton alloc] initWithFrame:CGRectMake(10, screenHeight - 120, screenWidth - 20, 50)];
    resetButton.backgroundColor = [UIColor blueColor];
    [resetButton setTitle:@"Reset" forState:UIControlStateNormal];
    [self.view addSubview:resetButton];
    resetButton.layer.cornerRadius = 10;
    [resetButton addTarget:self action:@selector(resetButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    usernameField = [[UITextField alloc] initWithFrame:CGRectMake(10, 30, screenWidth - 20, 50)];
    usernameField.backgroundColor = [UIColor whiteColor];
    usernameField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    usernameField.autocorrectionType = UITextAutocorrectionTypeNo;
    usernameField.placeholder = @"username";
    usernameField.delegate = self;
    usernameField.layer.cornerRadius = 10;
    usernameField.textAlignment = NSTextAlignmentCenter;
    
    
    [self.view addSubview:usernameField];
    
    passwordField = [[UITextField alloc] initWithFrame:CGRectMake(10, 100, screenWidth - 20, 50)];
    passwordField.backgroundColor = [UIColor whiteColor];
    passwordField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    passwordField.autocorrectionType = UITextAutocorrectionTypeNo;
    passwordField.placeholder = @"password";
    passwordField.delegate = self;
    passwordField.textAlignment = NSTextAlignmentCenter;
    passwordField.secureTextEntry = 1;
    passwordField.layer.cornerRadius = 10;
    
    [self.view addSubview:passwordField];
    
    emailField = [[UITextField alloc] initWithFrame:CGRectMake(10, 170, screenWidth - 20, 50)];
    emailField.backgroundColor = [UIColor whiteColor];
    emailField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    emailField.autocorrectionType = UITextAutocorrectionTypeNo;
    emailField.placeholder = @"email";
    emailField.delegate = self;
    emailField.textAlignment = NSTextAlignmentCenter;
    emailField.keyboardType = UIKeyboardTypeEmailAddress;
    emailField.layer.cornerRadius = 10;
    
    [self.view addSubview:emailField];
    
    phoneField = [[UITextField alloc] initWithFrame:CGRectMake(10, 240, screenWidth - 20, 50)];
    phoneField.backgroundColor = [UIColor whiteColor];
    phoneField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    phoneField.autocorrectionType = UITextAutocorrectionTypeNo;
    phoneField.placeholder = @"phone";
    phoneField.delegate = self;
    phoneField.textAlignment = NSTextAlignmentCenter;
    phoneField.keyboardType = UIKeyboardTypeNumberPad;
    phoneField.layer.cornerRadius = 10;
    
    [self.view addSubview:phoneField];
    
    UIButton * blueButton = [[UIButton alloc] initWithFrame:CGRectMake(40, 340, 40, 40)];
    blueButton.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueButton];
    blueButton.layer.cornerRadius = 20;
    [blueButton addTarget:self action:@selector(blueButtonClicked) forControlEvents:UIControlEventTouchUpInside];

    
    
//    struct session = [[GKSession alloc] initWithSessionID:@"mySessionId" displayName:[[UIDevice currentDevice] name] sessionMode:GKSessionModeServer];
//    struct session.delegate = self;
//    [session setDataReceiveHandler: self withContext:nil];
//    struct session.available = YES;
    
  redButton = [[UIButton alloc] initWithFrame:CGRectMake(140, 340, 40, 40)];
   redButton.backgroundColor = [UIColor redColor];
   [self.view addSubview:redButton];
   redButton.layer.cornerRadius = 20;
    redButton.layer.borderColor = [[UIColor blackColor] CGColor];
    redButton.layer.borderWidth = 2;
    [redButton addTarget:self action:@selector(redButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    UIButton * yellowButton = [[UIButton alloc] initWithFrame:CGRectMake(240, 340, 40, 40)];
    yellowButton.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:yellowButton];
    yellowButton.layer.cornerRadius = 20;
    
    [yellowButton addTarget:self action:@selector(yellowButtonClicked) forControlEvents:UIControlEventTouchUpInside];
 
     NSLog(@"view did load");
    
    
    
}


-(void)redButtonClicked:(UIButton *)pRedButton
{
    self.view.backgroundColor = [UIColor redColor];
    pRedButton.layer.borderWidth = 15;
}
-(void)yellowButtonClicked
{
    self.view.backgroundColor = [UIColor yellowColor];
    
}
-(void)blueButtonClicked
{
    self.view.backgroundColor = [UIColor blueColor];
}
-(void)resetButtonClicked
{
    usernameField.text = @"";
    passwordField.text = @"";
    emailField.text = @"";
    phoneField.text = @"";
    self.view.backgroundColor = [UIColor greenColor];
    redButton.layer.borderWidth = 2;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"text field should return");
    [textField resignFirstResponder];
    return YES;
}

- (void) loginButtonClicked
{
    NSLog(@"button was clicked");
    if ([usernameField.text isEqualToString:@""])
        
    {
        
        UIAlertView * noUsernameAlert =
        [[UIAlertView alloc] initWithTitle:@"Failed Login" message:@"Enter Username NOW!" delegate: self cancelButtonTitle:@"Enter" otherButtonTitles:nil];
        [noUsernameAlert show];
    }
    if ([passwordField.text isEqualToString:@""])
        
    {
        
        UIAlertView * noUsernameAlert =
        [[UIAlertView alloc] initWithTitle:@"Failed Login" message:@"Forgot Password!" delegate: self cancelButtonTitle:@"Enter" otherButtonTitles:nil];
        [noUsernameAlert show];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
