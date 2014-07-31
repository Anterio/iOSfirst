//
//  STAItemsTableViewController.m
//  Simple Tasks
//
//  Created by Arthur Boia on 7/30/14.
//  Copyright (c) 2014 Arthur Boia. All rights reserved.
//

#import "STAItemsTableViewController.h"
#import "STAEditItemViewController.h"
#import "STAEditItemViewController.h"

@interface STAItemsTableViewController () <UITextFieldDelegate>

@end

@implementation STAItemsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    // **NOTE**
    // If you don't do this next line of code
    // then you'll see this error:
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    /*
    2014-07-30 11:31:46.742 Simple Tasks[1280:60b] *** Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'unable to dequeue a cell with identifier cell - must register a nib or a class for the identifier or connect a prototype cell in a storyboard'
    *** First throw call stack:
     */
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}
-(BOOL) prefersStatusBarHidden {return YES;}
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    NSMutableArray* items = self.groupInfo[@"items"];
    return items.count;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // METHOD 1: When you want to use the forIndexPath parameter (so that you don't have to check if the cell == nil (go look at **NOTE** in viewDidLoad
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.groupInfo[@"items"] [indexPath.row] [@"name"];
    
    float priority = [self.groupInfo[@"items"] [indexPath.row] [@"priority"] floatValue];
    
    float priorityHue = priority / 360;
    
    cell.backgroundColor = [UIColor colorWithHue:priorityHue saturation:1 brightness:1 alpha:1];
    
    
    
//    self.itemName[@"priority"] = @(priority);
    
    
    /* METHOD 2:
    
     TIY Note: Either you do the above line for dequeing which uses the forIndexPath parameter.... AND you must registerClass in viewDidLoad
     OR you can use this method.
     
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    */
    
    
    // Configure the cell...
    
    return cell;
}
//-(BOOL)return

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
