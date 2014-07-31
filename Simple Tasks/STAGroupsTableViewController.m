//
//  STAGroupsTableViewController.m
//  Simple Tasks
//
//  Created by Arthur Boia on 7/30/14.
//  Copyright (c) 2014 Arthur Boia. All rights reserved.
//

#import "STAGroupsTableViewController.h"
#import "STAItemsTableViewController.h"
#import "STANewGroupViewController.h"

@interface STAGroupsTableViewController ()

@end

@implementation STAGroupsTableViewController
{
    NSMutableArray* groups;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
         self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        groups = [@[
                    [@{
                       @"name": @"Movies to Watch",
                       @"items": [@[
                                    [@{@"name": @"Guardians of the Galaxy",
                                      @"priority": @60
                                      }mutableCopy],
                                    [@{@"name": @"Ninja Turtles",
                                      @"priority": @40
                                      }mutableCopy],
                                    [@{@"name": @"Hercules",
                                      @"priority": @20
                                      }mutableCopy],
                                    
                                    ] mutableCopy]
                       } mutableCopy],
                    
                    [@{
                       @"name": @"Apps to Write",
                       @"items": [@[] mutableCopy]
                       
                       }mutableCopy],
                    
                    
                    ] mutableCopy];
        
       
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    UIBarButtonItem* addNewGroup = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewGroupClicked)];
    self.navigationItem.rightBarButtonItem = addNewGroup;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//   self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:YES];
    NSLog(@"%@", groups);
    [self.tableView reloadData];
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [groups removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}
-(void)addNewGroupClicked
{
 
    STANewGroupViewController* addNewGroupVC = [[STANewGroupViewController alloc] init];
    addNewGroupVC.groups =groups;
    [self.navigationController presentViewController:addNewGroupVC animated:YES completion:nil];
    
}



- (UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    
    cell.textLabel.text = groups[indexPath.row][@"name"];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{// Return the number of rows in the section.
    return groups.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    STAItemsTableViewController* itemsTVC = [[STAItemsTableViewController alloc]init];
    itemsTVC.groupInfo = groups[indexPath.row];
    [self.navigationController pushViewController:itemsTVC animated:YES];
    
}

-(BOOL) prefersStatusBarHidden {return YES;}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

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
