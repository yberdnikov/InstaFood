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
#import "Statuses.h"
#import "ExploreCell.h"
#import "Entities.h"
#import "Urls.h"
#import "UIImageView+AFNetworking.h"
#import "AFJSONRequestOperation.h"

@interface ExploreViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
-(void)getInstaFoodSearchResults;

@end

@implementation ExploreViewController
{
    NSMutableArray *tweets;
}

-(void)getInstaFoodSearchResults
{
    [[TwitterManager sharedInstance]setUpTwitterAccountWithBlock:^(BOOL granted, BOOL hasTwitterAccount) {
        if (hasTwitterAccount) {
            [[TwitterManager sharedInstance]getTwitterFeedWithBlock:^(id feedData, NSError *error) {
                if (!error) {
                    TweetObject *tweetObject = [TweetObject modelObjectWithDictionary:feedData];
                    tweets = [NSMutableArray new];
                    
                    [tweetObject.statuses enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                        Statuses *status = obj;
                        [tweets addObject:status];
                    }];
                    [self.tableView reloadData];
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

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableviewDatasource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tweets.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ExploreCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    Statuses *tweet = [tweets objectAtIndex:indexPath.row];
    if (tweet.entities.urls.count > 0) {
        Urls *urls = [tweet.entities.urls objectAtIndex:0];
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.instagram.com/oembed?url=%@",urls.expanded_url]];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request
                                                                                            success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                                                                                NSLog(@"response:%@", JSON);
                                                                                                [cell.instaImageView setImageWithURL:[NSURL URLWithString:[JSON objectForKey:@"url"]]];
                                                                                            }
                                                                                            failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                                                                                NSLog(@"error:%@", error);
                                                                                            }];
        [operation start];
                
    }
    
    return cell;
}


@end
