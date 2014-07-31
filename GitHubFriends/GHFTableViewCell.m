//
//  GHFTableViewCell.m
//  GitHubFriends
//
//  Created by Arthur Boia on 7/24/14.
//  Copyright (c) 2014 Arthur Boia. All rights reserved.
//

#import "GHFTableViewCell.h"
#import "GHFViewController.h"

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
    UIButton* profileButton;
    UIButton* gistButton;
    
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
                [self.contentView addSubview: gistNumbers];
                gistNumbers = [[UILabel alloc] initWithFrame:(CGRectMake(225, 65, 24, 24))];
                self.backgroundColor = [UIColor colorWithRed:0.227f green:0.227f blue:0.227f alpha:1.0f];
        
        
        
                profileButton = [[UIButton alloc] initWithFrame:CGRectMake(260, 15, 30, 30)];
                profileButton.backgroundColor = [UIColor whiteColor];
                profileButton.layer.borderColor = [[UIColor whiteColor]CGColor];
                profileButton.layer.borderWidth = 1;
                profileButton.layer.cornerRadius = 15;
                profileButton.backgroundColor = [UIColor colorWithRed:0.227f green:0.227f blue:0.227f alpha:1.0f];
                [profileButton addTarget:self action:@selector (profileButtonClicked)forControlEvents:UIControlEventTouchUpInside];
                [self.contentView addSubview:profileButton];
        
    
                }
    return self;
}



-(void)setFriendInfo:(NSDictionary *)friendInfo
{
    _friendInfo = friendInfo;
    NSURL* url = [NSURL URLWithString:friendInfo [@"avatar_url"]];
//    NSURL* url = [NSURL URLWithString:friendInfo [@"following_url"]];
    NSData* data = [NSData dataWithContentsOfURL:url];
    UIImage* image =[UIImage imageWithData:data];
    
    
    if ([friendInfo [@"followers"]integerValue] > [friendInfo [@"following"]integerValue]) {
        NSLog(@"There is more follower than following");
    }else if ([friendInfo [@"followers"]integerValue] < [friendInfo [@"following"]integerValue]) {
        NSLog(@"There is more following than followers");
    }//else if ([friendInfo [@"followers"]integerValue] == [friendInfo [@"following"]integerValue] ||([friendInfo [@"followers"]integerValue]==0)&&([friendInfo [@"following"]integerValue]==0) {
       // NSLog(@"Just a friend");
   // }
    
 
    
    friendName.text = friendInfo [@"name"];
    friendName.textColor = [UIColor lightGrayColor];
    friendName.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight"  size:20];
    
    
    friendImage.image = image;
    friendImage.backgroundColor = [UIColor lightGrayColor];
   
    detailTextLabel.text = friendInfo [@"location"];
    detailTextLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light"  size:12];
    detailTextLabel.textColor = [UIColor lightGrayColor];
    
    userFollows.text = [NSString stringWithFormat:@"follower%d", [friendInfo [@"following"] intValue]];
    userFollows.font = [UIFont fontWithName:@"HelveticaNeue-Light"  size:10];
    userFollows.textColor = [UIColor lightGrayColor];
    
    
    userCreepers.text = [NSString stringWithFormat:@"leader%d", [friendInfo[@"followers"] intValue]];
    userCreepers.font = [UIFont fontWithName:@"HelveticaNeue-Light"  size:10];
    userCreepers.textColor = [UIColor lightGrayColor];
    
    
    
    gistNumbers.text =  [NSString stringWithFormat:@"%d", [friendInfo[@"followers"] intValue]];
    gistNumbers.textColor = [UIColor lightGrayColor];
    gistNumbers.backgroundColor = [UIColor whiteColor];
    gistNumbers.layer.cornerRadius = 12;
    gistNumbers.layer.masksToBounds = YES;
    gistNumbers.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:gistNumbers];
    gistNumbers.font = [UIFont fontWithName:@"HelveticaNeue-Light"  size:13];
    
    
    gistButton = [[UIButton alloc] initWithFrame: CGRectMake(250, 65, 60, 25)];
    gistButton.layer.cornerRadius = 10;
    [gistButton setTitle:@"Gist" forState:(UIControlStateNormal)];
    gistButton.layer.borderWidth = 1;
    gistButton.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    [gistButton addTarget:self action:@selector(gistButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:gistButton];
    
//    [gistButton setTitleColor:[UIColor lightGrayColor] forState:[UIControlEventTouchUpInside]];
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

-(void)profileButtonClicked
{

GHFViewController* profileView = [[GHFViewController alloc] init];

profileView.view.backgroundColor = [UIColor lightGrayColor];

profileView.friendInfo = self.friendInfo;

[self.navigationController pushViewController:profileView animated:YES];

}
     -(void)gistButtonClicked
    {
        GHFViewController * profileView = [[GHFViewController alloc] init];
        profileView.view.backgroundColor = [UIColor lightGrayColor];
        
        NSString * gistURL = [NSString stringWithFormat:@"https://gist.github.com/%@", self.friendInfo[@"login"]];
        profileView.friendInfo = @{@"html_url":gistURL};
        [self.navigationController pushViewController:profileView animated:YES];
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
