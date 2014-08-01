//
//  STANewItemViewController.m
//  Simple Tasks
//
//  Created by Arthur Boia on 7/31/14.
//  Copyright (c) 2014 Arthur Boia. All rights reserved.
//

#import "STANewItemViewController.h"
#import "STANewGroupViewController.h"
#import "STAGroupsTableViewController.h"


@implementation STANewItemViewController
{
    UITextField* itemNameField;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(20, 60, SCREEN_WIDTH-40, 1)];
        lineView.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:lineView];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    itemNameField = [[UITextField alloc] initWithFrame: CGRectMake(20, 20 , SCREEN_WIDTH-40, 40)];
    itemNameField.delegate = self;
    [self.view addSubview:itemNameField];
    
    [self.view addSubview:itemNameField];
    [itemNameField becomeFirstResponder];
    
    //    groupNameField.layer.borderWidth = 1;
    //    groupNameField.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    
    UIView* fieldBar=[[UIView alloc] initWithFrame:CGRectMake(20, 60, SCREEN_WIDTH-40, 1)];
    fieldBar.backgroundColor = [UIColor whiteColor];
    
    
    UIButton * cancelItem = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2, 80, 100, 100)];
    [cancelItem setImage:[UIImage imageNamed:@"group_close"] forState:UIControlStateNormal];
    [cancelItem addTarget:self action:@selector(cancelItemClicked) forControlEvents:UIControlEventTouchUpInside];
    cancelItem.adjustsImageWhenHighlighted = NO;
    
    [self.view addSubview:cancelItem];
    
    
    UIButton * saveItem = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-110, 80, 100, 100)];
    
    [saveItem setImage:[UIImage imageNamed:@"group_save"] forState:UIControlStateNormal];
    [saveItem addTarget:self action:@selector(saveItemClicked) forControlEvents:UIControlEventTouchUpInside];
    saveItem.adjustsImageWhenHighlighted = NO;
    
    [self.view addSubview:saveItem];
}
-(void) cancelItemClicked
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void) saveItemClicked
{
    NSLog(@"Before our items = %@", self.items);
    [self.items addObject:[@{
                              @"name":itemNameField.text,
                              @"priority":@0
                            }mutableCopy]];
    
    
    NSLog(@"After our items = %@", self.items);
    
    [self cancelItemClicked];
    //or the fast older code
    //[self dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self saveItemClicked];
    return YES;
}
//-(BOOL)textFieldShouldReturn:(UITextField *)textField
//{
//    self.itemInfo[@"name"] = textField.text;
//    [textField resignFirstResponder];
//    return YES;
//}
-(void)setItemInfo:(NSMutableDictionary *)itemInfo
{
    itemInfo = itemInfo;
    
    itemNameField = [[UITextField alloc] initWithFrame:CGRectMake(20, 60, SCREEN_WIDTH - 40, 40)];
    
    itemNameField.text = itemInfo[@"name"];
    itemNameField.delegate = self;
    NSLog (@"hi I'm here");
    
    [self.view addSubview:itemNameField];
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
 //   self.itemInfo[@"priority"] = @(priority);
    float priorityHue = priority / 360;
    
    self.view.backgroundColor = [UIColor colorWithHue:priorityHue saturation:1 brightness:1 alpha:1];
}
-(BOOL)prefersStatusBarHidden {return YES;}
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        // Delete the row from the data source
//        [items removeObjectAtIndex:indexPath.row];
//        [self saveItemData];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//    }



@end
