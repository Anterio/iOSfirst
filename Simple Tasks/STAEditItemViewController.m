//
//  STAEditItemViewController.m
//  Simple Tasks
//
//  Created by Arthur Boia on 7/30/14.
//  Copyright (c) 2014 Arthur Boia. All rights reserved.

#import "STAEditItemViewController.h"


@interface STAEditItemViewController () <UITextFieldDelegate>

@end

@implementation STAEditItemViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.view.backgroundColor = [UIColor whiteColor];
        
        
    }
    return self;
}
-(void)setItemInfo:(NSMutableDictionary *)itemInfo
{
    _itemInfo = itemInfo;
    
    UITextField* itemNameField = [[UITextField alloc] initWithFrame:CGRectMake(20, 60, SCREEN_WIDTH - 40, 40)];
    
    itemNameField.text = itemInfo[@"name"];
    itemNameField.delegate = self;
    
    
    [self.view addSubview:itemNameField];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
   
    
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    self.itemInfo[@"name"] = textField.text;
    [textField resignFirstResponder];
    return YES;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self changeColorWithTouches:touches];
}
-(void)touchesMoved:(NSSet*) touches withEvent:(UIEvent *)event
{
   
    [self changeColorWithTouches:touches];
    
}
-(void)changeColorWithTouches: (NSSet*) touches
{
    UITouch * touch = [touches allObjects] [0];
    CGPoint location = [touch locationInView:self.view];
    
    float priority = location.y/SCREEN_HEIGHT * 60;
    
    NSLog(@"y = %f", priority);
    self.itemInfo[@"priority"] = @(priority);

    
    float priorityHue = priority / 360;
    
    self.view.backgroundColor = [UIColor colorWithHue:priorityHue saturation:1 brightness:1 alpha:1];
}
-(BOOL)prefersStatusBarHidden {return YES;}

@end
