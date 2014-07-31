//
//  GHFTableViewController.m
//  GitHubFriends
//
//  Created by Arthur Boia on 7/24/14.
//  Copyright (c) 2014 Arthur Boia. All rights reserved.
//

#import "GHFViewController.h"
#import "GHFTableViewController.h"
#import "GHFTableViewCell.h"
#import "GRAGithubRequest.h"

//3f54d4c424355ba7ea024c78e393187468b05463

@interface GHFTableViewController ()

@end

@implementation GHFTableViewController
{
    NSMutableArray* githubFriends;
    NSArray* friendsList;
    NSArray* insertObjects;
    UIButton* searchButton;
    UITextField* searchField;
//    UIBUtton* myButton;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        /* NSMutable can add or remove objects and dictionary
         to allow "@[]" to talk to array must add "mutable copy"*/
        
        githubFriends = [@[] mutableCopy];
        
        NSArray* loadedUsers = [GRAGithubRequest loadUsers];
        
        if (loadedUsers)
        {
            githubFriends = [loadedUsers mutableCopy];
        }
        
        self.tableView.rowHeight = 100;
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        self.tableView.backgroundColor = [UIColor colorWithRed:0.227f green:0.227f blue:0.227f alpha:1.0f];
        }
    
    
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    UIView* headerView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, 320, 60))];
    self.tableView.tableHeaderView = headerView;
    headerView.backgroundColor = [UIColor colorWithRed:0.965f green:0.125f blue:0.341f alpha:1.0f];
    
    
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    [tap setCancelsTouchesInView:NO];

    // little round search button with magnifying glass
    searchButton = [[UIButton alloc] initWithFrame:CGRectMake(270, 10, 40, 40)];
    [searchButton addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    UIImage* searchIconImg = [UIImage imageNamed:@"searchButton.png"];
    [searchButton setImage:searchIconImg forState:UIControlStateNormal];
    [headerView addSubview:searchButton];
    
    
    
    // search field for users to type in username
    searchField = [[UITextField alloc] initWithFrame:(CGRectMake(10, 10, 253, 40))];
    searchField.placeholder = @" search";
    searchField.layer.cornerRadius = 5;
    searchField.backgroundColor = [UIColor whiteColor];
//    [self.searchField = resignFirstResponder];
    [headerView addSubview:searchField];
    
    UIView* searchPadding = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    [searchField setLeftViewMode: UITextFieldViewModeAlways];
    [searchField setLeftView:searchPadding];

    
    CGRect sepFrame = CGRectMake(0, headerView.frame.size.height-1, 320, 1);
    UIView * seperatorView = [[UIView alloc] initWithFrame:sepFrame];
    seperatorView.backgroundColor = [UIColor lightGrayColor];
    [headerView addSubview:seperatorView];
    
    // round search button
//    searchButton = [[UIButton alloc] initWithFrame:CGRectMake(240, 15, 44, 44)];
//    [self.view addSubview:searchButton];
//    searchButton.backgroundColor = [UIColor lightGrayColor];
//    searchButton.layer.cornerRadius = 22;
//    [searchButton setTitle: @"go" forState:UIControlStateNormal];

    // rectangle uitextfield 
//    searchButton.placeholder = @"  search";
    
    //        NSLog(@"%@", friendInfo);
    //

}


-(void)buttonClicked
{
    NSLog(@"ButtonWasPressed");
    NSDictionary* userInfo = [GRAGithubRequest requestUserInfo:searchField.text];
    [githubFriends addObject:userInfo];
    [self.tableView reloadData];
    
    [GRAGithubRequest saveUsers:githubFriends];
    
}
-(void)dismissKeyboard
{
    [searchField resignFirstResponder];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return githubFriends.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
// cellForRowAtIndexPath saves memory by only running what loads in the view (1-10 for example)...as you scroll down to 12 it loads 2 new ones (11,12) and 1 & 2 go in a bucket as a whole cached version that is ready to be used again
{
    GHFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

    
    
    /* This is where you call the cells in the bucket.... dequeueReusableCellWithIdentifier.  This will take a cell (let's say number 7) with only 2 attributes and save those and be able to use it again with cell 15 because that contact also has
        only a name and phone number but no picture
    */
    
    if (cell == nil)
    {
        cell =[[GHFTableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    /* cell is used when you create it and then self is used after it's been created "build a house is the cell, modify the inside after is self"*/
    cell.friendInfo = githubFriends[indexPath.row];
    cell.navigationController = self.navigationController;
    
    NSLog(@"%@", cell.friendInfo);
    
/*
   These are both the same:
        NSLog(@"Heidi");
   and
        NSString* myName = @"Heidi"; // Making a variable with the hardcoded value
        NSLog(@"%@", myName); // This is how you print out a variable (can be a string or a dictionary)
*/
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Select row at %@", indexPath);
    
 
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [githubFriends removeObjectAtIndex:indexPath.row];
        [GRAGithubRequest saveUsers:githubFriends];
        
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}


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
// , @"dmerrill88", @"npeterson213", @"ssneller", @"jhend11", @"anterio", @"Kalson", @"ssniteman", @"EWJSeidel", @"ericstephen", @"jeremycbutler", @"josephlausf", @"schwaebek", @"mertid", @"jeremycbutler"];
@end
