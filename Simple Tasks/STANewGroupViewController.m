//
//  STANewGroupViewController.m
//  Simple Tasks
//
//  Created by Arthur Boia on 7/31/14.
//  Copyright (c) 2014 Arthur Boia. All rights reserved.
//

#import "STANewGroupViewController.h"

@interface STANewGroupViewController ()
{
    UITextField* groupNameField;
}
@end

@implementation STANewGroupViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor=[UIColor whiteColor];
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(20, 60, SCREEN_WIDTH-40, 1)];
        lineView.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:lineView];
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    groupNameField = [[UITextField alloc] initWithFrame: CGRectMake(20, 20 , SCREEN_WIDTH-40, 40)];
    [self.view addSubview:groupNameField];
    groupNameField.delegate = self;
    [groupNameField becomeFirstResponder];
    
//    groupNameField.layer.borderWidth = 1;
//    groupNameField.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    
    UIView* fieldBar=[[UIView alloc] initWithFrame:CGRectMake(20, 60, SCREEN_WIDTH-40, 1)];
    fieldBar.backgroundColor = [UIColor whiteColor];
 
    
    UIButton * cancelGroup = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2, 80, 100, 100)];
    [cancelGroup setImage:[UIImage imageNamed:@"group_close"] forState:UIControlStateNormal];
    [cancelGroup addTarget:self action:@selector(cancelGroupClicked) forControlEvents:UIControlEventTouchUpInside];
    cancelGroup.adjustsImageWhenHighlighted = NO;
    
    [self.view addSubview:cancelGroup];
    
    
   UIButton * saveGroup = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-110, 80, 100, 100)];
    
    [saveGroup setImage:[UIImage imageNamed:@"group_save"] forState:UIControlStateNormal];
    [saveGroup addTarget:self action:@selector(saveGroupClicked) forControlEvents:UIControlEventTouchUpInside];
    saveGroup.adjustsImageWhenHighlighted = NO;
    
    [self.view addSubview:saveGroup];
}

-(void) cancelGroupClicked
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void) saveGroupClicked
{
    [self.groups addObject:[@{
                                  @"name":groupNameField.text,
                                  @"items":[@[] mutableCopy]}mutableCopy]];
                                  [self cancelGroupClicked];
                                  //or the fast older code
                               //[self dismissViewControllerAnimated:YES completion:nil];
                              
                              
}
//-(BOOL) prefersStatusBarHidden {return YES;}
//{
//    
//}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self saveGroupClicked];
    return YES;
    
}

@end
