//
//  MFLTableViewController.m
//  List App
//
//  Created by Arthur Boia on 7/23/14.
//  Copyright (c) 2014 Arthur Boia. All rights reserved.
//

#import "MFLTableViewController.h"

/*
 Pointers
 TableViewController (maybe do one tutorial on this somewhere)
*/

@interface MFLTableViewController ()
@property (nonatomic) NSArray * info;
//@property (nonatomic) NSArray * days;
//@property (nonatomic) NSArray * studentNames;
//@property (nonatomic) NSArray * colors;
//@property (nonatomic) NSArray * fontSize;

@end



@implementation MFLTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
        // Custom initialization
        //        self.listItems = [[NSArray alloc] initWithObjects:@"Monday", @"Tuesday", @"Wednesday", @"Thursday", nil];
        //
        //        self.listItems = [NSArray arrayWithObjects:@"Monday", @"Tuesday", @"Wednesday", @"Thursday", nil];
        
//        self.days = @[@"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday", @"Sunday"];
//        self.studentNames = @[@"John", @"Mary", @"Jayke", @"Steve", @"Alex", @"Patty", @"Suzy"];
//        self.colors = @[[UIColor yellowColor],[UIColor redColor], [UIColor blackColor], [UIColor blueColor], [UIColor greenColor], [UIColor purpleColor], [UIColor brownColor]];
//        self.fontSize = @[@20, @25, @30, @35, @40, @22, @33];
        self.info = @[
                      @{@"day":@"Monday",
                        @"color": [UIColor yellowColor],
                        @"name":@"John",
                        @"size":@20
                        },
                      @{@"day":@"Tuesday",
                        @"color": [UIColor redColor],
                        @"name":@"Mary",
                        @"size":@23
                        },
                      @{@"day":@"Wednesday",
                        @"color": [UIColor blackColor],
                        @"name":@"Jayke",
                        @"size":@26
                        },
                      @{@"day":@"Thursday",
                        @"color": [UIColor blueColor],
                        @"name":@"Steve",
                        @"size":@29
                        },
                      @{@"day":@"Friday",
                        @"color": [UIColor greenColor],
                        @"name":@"Alex",
                        @"size":@32
                        },
                      @{@"day":@"Saturday",
                        @"color": [UIColor purpleColor],
                        @"name":@"Patty",
                        @"size":@35
                        },
                      @{@"day":@"Sunday",
                        @"color": [UIColor brownColor],
                        @"name":@"Suzy",
                        @"size":@38
                        }
                      ];
    }
    return self;
}

//-(NSArray*)days
//{
//    if (_days == nil) _days = @[];
//    return _days;
//}
//-(NSArray*)studentNames
//{
//    if (_studentNames == nil) _studentNames = @[];
//    return _studentNames;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.info.count;
}


/*
 
 <Type/Class> <variable name> = <value>
 
 int myAge = 19;
 UIView* myRedBanner = [UIView ...]
 
 
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Just don't worry about reuseIdentifier for now, Jo will explain in a few weeks
    UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    int indexOfItem = indexPath.row; //helper local variable that we can reuse
    
    NSLog(@"Want to draw the %d element", indexOfItem);
    NSDictionary* infoItem = self.info[indexPath.row];
    

    //NSString * day = [self.listItems objectAtIndex:indexOfItem];
//    NSString* day = self.days[indexOfItem];
    
    NSString * studentName = infoItem [@"name"];
    NSNumber* font = infoItem [@"size"];
    
    cell.textLabel.font = [UIFont systemFontOfSize:[font intValue]];
    
    //TODO make a variable 'currentColor' to get the color from your color array (just like you got the student name etc)
    
    //
    // Configure the cell...
    //
    
    cell.textLabel.text = infoItem[@"day"];
    cell.detailTextLabel.text = studentName;
    cell.backgroundColor = infoItem[@"color"];
    
    //set background color to color in array
   //TODO instead of hardcoding to green, rather use variale currentColor
    
    //set the textlabel font size to a number from last array
    
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


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


@end
