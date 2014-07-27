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
    UILabel* gistNumbers;
    
//    UILabel*tableview;

}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)   {
                friendName = [[UILabel alloc] initWithFrame:(CGRectMake(115, 5, 200, 40))];
                [self.contentView addSubview: friendName];
                friendImage = [[UIImageView alloc] initWithFrame:(CGRectMake(0, 0, 100, 100))];
                [self.contentView addSubview: friendImage];
                detailTextLabel = [[UILabel alloc] initWithFrame:(CGRectMake(115, 26, 200, 40))];
                [self.contentView addSubview: detailTextLabel];
                userFollows = [[UILabel alloc] initWithFrame:(CGRectMake(115, 40, 200, 40))];
                [self.contentView addSubview: userFollows];
                userCreepers = [[UILabel alloc] initWithFrame:(CGRectMake(115, 60, 200, 40))];
                [self.contentView addSubview: userCreepers];
                self.backgroundColor = [UIColor colorWithRed:0.227f green:0.227f blue:0.227f alpha:1.0f];
                [self.contentView addSubview: gistNumbers];
                gistNumbers = [[UILabel alloc] initWithFrame:(CGRectMake(240, 65, 25, 25))];
    
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
    friendName.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight"  size:20];
    
    
    friendImage.image = image;
    friendImage.backgroundColor = [UIColor lightGrayColor];
   
    detailTextLabel.text = friendInfo [@"location"];
    detailTextLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light"  size:12];
    detailTextLabel.textColor = [UIColor lightGrayColor];
    
    userFollows.text = [NSString stringWithFormat:@"follower%@", friendInfo [@"following_url"]];
    userFollows.font = [UIFont fontWithName:@"HelveticaNeue-Light"  size:10];
    userFollows.textColor = [UIColor lightGrayColor];
    
    
    userCreepers.text = [NSString stringWithFormat:@"leader%@", friendInfo[@"followers_url"]];
    userCreepers.font = [UIFont fontWithName:@"HelveticaNeue-Light"  size:10];
    userCreepers.textColor = [UIColor lightGrayColor];
    
    
    
    gistNumbers.text = friendInfo [@"location"];
    gistNumbers.textColor = [UIColor lightGrayColor];
    gistNumbers.backgroundColor = [UIColor lightGrayColor];
    gistNumbers.layer.cornerRadius = 10;
    gistNumbers.layer.masksToBounds = YES;
    [self.contentView addSubview:gistNumbers];
    
    UIButton* gistButton = [[UIButton alloc] initWithFrame: CGRectMake(250, 65, 60, 25)];
//    gistButton.backgroundColor = [UIColor lightGrayColor];
    gistButton.layer.cornerRadius = 10;
    gistButton.layer.borderWidth = 1;
    gistButton.layer.borderColor = [[UIColor lightGrayColor] CGColor];
//    gistButton.currentTitleColor.lightGrayColor = [UIColor lightGrayColor];
    
    [self.contentView addSubview:gistButton];
    [gistButton setTitle:@"Gist" forState:(UIControlStateNormal)];
    [gistButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
//    UIImage* myBtnImage = [UIImage imageNamed:@"heidi"]; //heidi.png
//    
//    [gistButton setImage:myBtnImage forState:UIControlStateNormal];
////  [gistButton addTarget:self action:@selector(gistButtonClicked) forControlEvents:UIControlEventTouchUpInside];
//  [gistButton addTarget:self action:@selector(@"www.google.com") forControlEvents:UIControlEventTouchUpInside];
//   gistButton = [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://google.com"]];
    
    
//    UIButton* profileButton = [[UIButton alloc] initWithFrame: CGRectMake(210, 80, 100, 25)];
//    profileButton.backgroundColor = [UIColor lightGrayColor];
//    profileButton.layer.cornerRadius = 10;
//    [self.contentView addSubview:profileButton];
//    [profileButton setTitle:@"Profile" forState:(UIControlStateNormal)];
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
