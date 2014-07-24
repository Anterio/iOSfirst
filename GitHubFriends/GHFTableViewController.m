//
//  GHFTableViewController.m
//  GitHubFriends
//
//  Created by Arthur Boia on 7/24/14.
//  Copyright (c) 2014 Arthur Boia. All rights reserved.
//

#import "GHFTableViewController.h"
#import "GHFTableViewCell.h"

@interface GHFTableViewController ()

@end

@implementation GHFTableViewController
{
    NSMutableArray* githubFriends;
    NSArray* friendsList;
    NSArray* insertObjects;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        /* NSMutable can add or remove objects and dictionary
         to allow "@[]" to talk to array must add "mutable copy"*/
        
        githubFriends = [@[@{
                            @"login": @"joalbright",
                            @"avatar_url": @"https://avatars.githubusercontent.com/u/1536630?",
                            @"name": @"Jo Albright",
                            @"blog": @"jo2.co",
                            @"location": @"Atlanta, Ga",
                            @"email": @"me@jo2.co",
                            @"followers_url": @"22",
                            @"following_url": @"34",
                            },
                           @{
                               @"login": @"dmerrill88",
                               @"avatar_url": @"https://avatars.githubusercontent.com/u/8224723?",
                               @"name": @"Daniel Merrill",
                               @"blog": @"jo2.co",
                               @"location": @"United States",
                               @"email": @"dmerrill88@gmail.com",
                               @"followers_url": @"22",
                               @"following_url": @"34",
                               },
                           @{
                               @"login": @"npeterson213",
                               @"avatar_url": @"https://avatars.githubusercontent.com/u/8224722",
                               @"name": @"Nick Peterson",
                               @"blog": @"jo2.co",
                               @"location": @"Buckhead, Ga",
                               @"email": @"nick.peterson213@gmail.com",
                               @"followers_url": @"22",
                               @"following_url": @"34",
                               },
                           @{
                               @"login": @"ssneller",
                               @"avatar_url": @"https://avatars.githubusercontent.com/u/8129918?",
                               @"name": @"Steve Sneller",
                               @"blog": @"http://www.stevesneller.com",
                               @"location": @"Marietta, Ga",
                               @"email": @"m.ssneller@gmail.com",
                               @"followers_url": @"22",
                               @"following_url": @"34",
                               },
                           @{
                               @"login": @"jhend11",
                               @"avatar_url": @"https://avatars.githubusercontent.com/u/7279926?",
                               @"name": @"Josh Hendershot",
                               @"blog": @"sumry.in/joshhendershot",
                               @"location": @"Buckhead, Ga",
                               @"email": @"jhend11@uw.edu",
                               @"followers_url": @"22",
                               @"following_url": @"34",
                               },
                           @{
                               @"login": @"anterio",
                               @"avatar_url": @"https://avatars.githubusercontent.com/u/8224728?",
                               @"name": @"Arthur Boia",
                               @"blog": @"pumpingsol.com",
                               @"location": @"Alpharetta, Ga",
                               @"email": @"arthurboia@me.com",
                               @"followers_url": @"22",
                               @"following_url": @"34",
                               },
                           @{
                               @"login": @"Kalson",
                               @"avatar_url": @"https://avatars.githubusercontent.com/u/7114996?",
                               @"name": @"Kalson Kalu",
                               @"blog": @"",
                               @"location": @"Houston, Tx",
                               @"email": @"dfljfme@jo2.co",
                               @"followers_url": @"22",
                               @"following_url": @"34",
                               },
                           @{
                               @"login": @"mertid",
                               @"avatar_url": @"https://avatars.githubusercontent.com/u/7989843?",
                               @"name": @"Merritt Tidwell",
                               @"blog": @"google.com",
                               @"location": @"United States of 'Merica",
                               @"email": @"Merritt.tidwell@gmail.com",
                               @"followers_url": @"22",
                               @"following_url": @"34",
                               },
                           @{
                               @"login": @"schwaebek",
                               @"avatar_url": @"https://avatars.githubusercontent.com/u/6909470?",
                               @"name": @"Katlyn Schwaebe",
                               @"blog": @"yahoo.com",
                               @"location": @"Alpharetta, Ga",
                               @"email": @"schwaebek@gmail.com",
                               @"followers_url": @"22",
                               @"following_url": @"34",
                               },
                           @{
                               @"login": @"josephlausf",
                               @"avatar_url": @"https://avatars.githubusercontent.com/u/7451830?",
                               @"name": @"Joseph Lau",
                               @"blog": @"businessinsider.com",
                               @"location": @"San Francisco, CA",
                               @"email": @"forwardintent@gmail.com",
                               @"followers_url": @"22",
                               @"following_url": @"34",
                               },
                           @{
                               @"login": @"jeremycbutler",
                               @"avatar_url": @"https://avatars.githubusercontent.com/u/7903562?",
                               @"name": @"Jeremy Butler",
                               @"blog": @"www.famousfox.us",
                               @"location": @"Savannah, Ga",
                               @"email": @"jeremybutler@me.com",
                               @"followers_url": @"22",
                               @"following_url": @"34",
                               },
                           @{
                               @"login": @"ericstephen",
                               @"avatar_url": @"https://avatars.githubusercontent.com/u/8224735?",
                               @"name": @"Eric Stephen",
                               @"blog": @"youtube.com",
                               @"location": @"Sandy Springs, Ga",
                               @"email": @"eric.stephen.gt@gmail.com",
                               @"followers_url": @"22",
                               @"following_url": @"34",
                               },
                           @{
                               @"login": @"EWJSeidel",
                               @"avatar_url": @"https://avatars.githubusercontent.com/u/8224720?",
                               @"name": @"Eric Seidel",
                               @"blog": @"www.ewjseidel.com",
                               @"location": @"ATL",
                               @"email": @"ewjseidel@gmail.com",
                               @"followers_url": @"22",
                               @"following_url": @"34",
                               },
                          
                           
                           
                            ] mutableCopy];
        
                            }
    
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView* headerView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, 120, 200))];
    self.tableView.tableHeaderView = headerView;
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 115;
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
// , @"dmerrill88", @"npeterson213", @"ssneller", @"jhend11", @"anterio", @"Kalson", @"ssniteman", @"EWJSeidel", @"ericstephen", @"jeremycbutler", @"josephlausf", @"schwaebek", @"mertid", @"jeremycbutler"];
@end
