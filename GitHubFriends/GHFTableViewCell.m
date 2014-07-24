//
//  GHFTableViewCell.m
//  GitHubFriends
//
//  Created by Arthur Boia on 7/24/14.
//  Copyright (c) 2014 Arthur Boia. All rights reserved.
//

#import "GHFTableViewCell.h"

@implementation GHFTableViewCell


{
    UILabel* friendName;
    UIImageView* friendImage;
    UILabel* smallText;
    UILabel* TextLabel;
    UILabel* userFollows;
    UILabel* userCreepers;
    UIButton* profile;
    UILabel* search;
    UILabel* detailTextLabel;
    
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)   {
                friendName = [[UILabel alloc] initWithFrame:(CGRectMake(65, 10, 200, 40))];
                [self.contentView addSubview: friendName];
                friendImage = [[UIImageView alloc] initWithFrame:(CGRectMake(10, 10, 40, 40))];
                [self.contentView addSubview: friendImage];
                detailTextLabel = [[UILabel alloc] initWithFrame:(CGRectMake(65, 35, 200, 40))];
                [self.contentView addSubview: detailTextLabel];
                userFollows = [[UILabel alloc] initWithFrame:(CGRectMake(10, 80, 200, 40))];
                [self.contentView addSubview: userFollows];
                userCreepers = [[UILabel alloc] initWithFrame:(CGRectMake(10, 60, 200, 40))];
                [self.contentView addSubview: userCreepers];
    
                }
    return self;
}

//"login": "joalbright",
//@"avatar_url": @"https://avatars.githubusercontent.com/u/1536630?",
//"name": "Jo Albright",
//"blog": "jo2.co",
//"location": "Atlanta, Ga",
//"email": "me@jo2.co",

-(void)setFriendInfo:(NSDictionary *)friendInfo
{
    _friendInfo = friendInfo;
    NSURL* url = [NSURL URLWithString:friendInfo [@"avatar_url"]];
//    NSURL* url = [NSURL URLWithString:friendInfo [@"following_url"]];
    NSData* data = [NSData dataWithContentsOfURL:url];
    UIImage* image =[UIImage imageWithData:data];
    
    
    friendName.text = friendInfo [@"name"];
    friendName.textColor = [UIColor lightGrayColor];
    friendName.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight"  size:30];
    
    friendImage.image = image;
    friendImage.layer.cornerRadius = 20;
    friendImage.layer.masksToBounds = YES;
    friendImage.backgroundColor = [UIColor lightGrayColor];
   
    detailTextLabel.text = friendInfo [@"location"];
    detailTextLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light"  size:15];
    detailTextLabel.textColor = [UIColor lightGrayColor];
    
    userFollows.text = [NSString stringWithFormat:@"Following  %@", friendInfo [@"following_url"]];
    userFollows.font = [UIFont fontWithName:@"HelveticaNeue-Light"  size:15];
    userFollows.textColor = [UIColor lightGrayColor];
    
    
    userCreepers.text = [NSString stringWithFormat:@"Creepers: %@", friendInfo[@"followers_url"]];
    userCreepers.font = [UIFont fontWithName:@"HelveticaNeue-Light"  size:15];
    userCreepers.textColor = [UIColor lightGrayColor];
    
    
    UIButton* gistButton = [[UIButton alloc] initWithFrame: CGRectMake(210, 50, 100, 25)];
    gistButton.backgroundColor = [UIColor lightGrayColor];
    gistButton.layer.cornerRadius = 10;
    [self.contentView addSubview:gistButton];
    [gistButton setTitle:@"Gist" forState:(UIControlStateNormal)];
//    [gistButton addTarget:self action:@selector(gistButtonClicked) forControlEvents:UIControlEventTouchUpInside];
//    [gistButton addTarget:self action:@selector(@"www.google.com") forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
//    gistButton = [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://google.com"]];
    
    
    UIButton* profileButton = [[UIButton alloc] initWithFrame: CGRectMake(210, 80, 100, 25)];
    profileButton.backgroundColor = [UIColor lightGrayColor];
    profileButton.layer.cornerRadius = 10;
    [self.contentView addSubview:profileButton];
    [profileButton setTitle:@"Profile" forState:(UIControlStateNormal)];
    
    
 
    
    
//    
//    searchButton = [[UIButton alloc] initWithFrame:CGRectMake(240, 15, 44, 44)];
//    [self.view addSubview:searchButton];
//    searchButton.backgroundColor = [UIColor lightGrayColor];
//    searchButton.layer.cornerRadius = 22;
//    [searchButton setTitle: @"go" forState:UIControlStateNormal];
//    
//    search.placeholder = @"  search";
//    
//    
//        NSLog(@"%@", friendInfo);
//    
    
    
    
    
    
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
