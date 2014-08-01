//
//  STAEditItemViewController.m
//  Simple Tasks
//
//  Created by Arthur Boia on 7/30/14.
//  Copyright (c) 2014 Arthur Boia. All rights reserved.

#import "STAEditItemViewController.h"



@interface STAEditItemViewController () <UITextFieldDelegate>

{
    
    UITextField* itemNameField;
}
@end

@implementation STAEditItemViewController

//-(id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self != nil)
//    {
//        components[0] = 1;
//        components[1] = 1;
//        components[2] = 1;
//        components[3] = 1;
//        
//        self.view.backgroundColor = [UIColor colorWithRed:components[0] green:components[1] blue:components[2] alpha:components[3]];
//    }
//    return self;
//}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        

    }
    return self;
}

-(void)setItemInfo:(NSMutableDictionary *)itemInfo
{
    _itemInfo = itemInfo;
    
    itemNameField = [[UITextField alloc] initWithFrame:CGRectMake(20, 60, SCREEN_WIDTH - 40, 40)];
    
    itemNameField.text = itemInfo[@"name"];
    itemNameField.delegate = self;
    NSLog (@"hi I'm here");
    
    [self.view addSubview:itemNameField];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    
    
    
}

//- (IBAction)sendColor:(id)sender {
//    UISlider *slider = (UISlider *)sender;
//    CGFloat newValue = (CGFloat)(slider.value);
//    int senderTag = [sender tag];
//    components[senderTag] = newValue;
//    UIColor *newColor = [[UIColor alloc] initWithRed:components[0] green:components[1] blue:components[2] alpha:components[3]];
//    [self.view setBackgroundColor:newColor];
//    NSString *colorAsString = [NSString stringWithFormat:@"%f, %f, %f, %f", components[0], components[1], components[2], components[3]];
//    NSLog(@"%@", colorAsString);
//}

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
