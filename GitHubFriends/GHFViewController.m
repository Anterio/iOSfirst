//
//  GHFViewController.m
//  GitHubFriends
//
//  Created by Arthur Boia on 7/25/14.
//  Copyright (c) 2014 Arthur Boia. All rights reserved.
//

#import "GHFViewController.h"
#import "GHFTableViewController.h"


@interface GHFViewController ()

@end

@implementation GHFViewController
{
    UIWebView* webView;
//    UILayoutContainerView* textField;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    webView = [[UIWebView alloc] initWithFrame:self.view.frame];

    [self.view addSubview:webView
          
     ];
    
    
    
    
    

}
-(void)setFriendInfo:(NSDictionary*) friendInfo
{
    _friendInfo = friendInfo;
    NSURL* url = [NSURL URLWithString:friendInfo[@"html_url"]];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
