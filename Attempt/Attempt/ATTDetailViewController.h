//
//  ATTDetailViewController.h
//  Attempt
//
//  Created by Arthur Boia on 7/29/14.
//  Copyright (c) 2014 Arthur Boia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ATTDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
