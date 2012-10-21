//
//  ExploreViewController.m
//  InstaFood
//
//  Created by Daniel-Mac on 21/10/12.
//  Copyright (c) 2012 MagicDev. All rights reserved.
//

#import "ExploreViewController.h"
#import "TwitterManager.h"
#import "TweetObject.h"
#import "Results.h"

@interface ExploreViewController ()

-(void)getInstaFoodSearchResults;

@end

@implementation ExploreViewController

-(void)getInstaFoodSearchResults
{
    [[TwitterManager sharedInstance]setUpTwitterAccountWithBlock:^(BOOL granted, BOOL hasTwitterAccount) {
        if (hasTwitterAccount) {
            [[TwitterManager sharedInstance]getTwitterFeedWithBlock:^(id feedData, NSError *error) {
                if (!error) {
                    NSLog(@"feedData: '%@'", feedData);
                }
            }];
        }
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIImage *bgImage = [UIImage imageNamed:@"edit_background.png"];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:bgImage]];
    
    [self getInstaFoodSearchResults];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
