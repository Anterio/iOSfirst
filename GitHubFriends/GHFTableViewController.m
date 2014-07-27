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

@interface GHFTableViewController ()

@end

@implementation GHFTableViewController
{
    NSMutableArray* githubFriends;
    NSArray* friendsList;
    NSArray* insertObjects;
    UIButton* searchButton;
//    UIBUtton* myButton;
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
                            @"html_url": @"https://github.com/joalbright",
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
    UIView* headerView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, 320, 60))];
    self.tableView.tableHeaderView = headerView;
    
    UIButton* searchButton = [[UIButton alloc] initWithFrame:CGRectMake(270, 10, 40, 40)];
    
    
    UITextField* search = [[UITextField alloc] initWithFrame:(CGRectMake(10, 10, 253, 40))];
    search.placeholder = @"  search";
    headerView.backgroundColor = [UIColor colorWithRed:0.965f green:0.125f blue:0.341f alpha:1.0f];
    [headerView addSubview:search];
    
    search.layer.cornerRadius = 5;
    search.backgroundColor = [UIColor whiteColor];
    
    
    CGRect sepFrame = CGRectMake(0, headerView.frame.size.height-1, 320, 1);
    
    UIView * seperatorView = [[UIView alloc] initWithFrame:sepFrame];
    seperatorView.backgroundColor = [UIColor lightGrayColor];
    [headerView addSubview:seperatorView];
    
    UIImage* myButton = [UIImage imageNamed:@"searchButton.png"];
    [searchButton setImage:myButton forState:UIControlStateNormal];
    [self.view addSubview:searchButton];
    
    
    
    

  
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
    
    GHFViewController* profileView = [[GHFViewController alloc] init];
    
    profileView.view.backgroundColor = [UIColor lightGrayColor];
    
    profileView.friendInfo = githubFriends[indexPath.row];
    
    [self.navigationController pushViewController:profileView animated:YES];
    
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
