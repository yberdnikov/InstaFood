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
#import "UIImageView+AFNetworking.h"
#import "User.h"
#import "DetailViewController.h"

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
                    
                    NSMutableArray *indexes = [NSMutableArray new];
                    for (int i=0; i<tweets.count; i++) {
                        [indexes addObject:[NSIndexPath indexPathForRow:i inSection:0]];
                    }
                    [self.tableView insertRowsAtIndexPaths:indexes withRowAnimation:UITableViewRowAnimationTop];
                    
                }
            }];
        }
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.rowHeight = 80.0;
	// Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor colorWithRed:0.882 green:0.882 blue:0.882 alpha:1]];
    
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
    
    [cell prepareForTableView:tableView indexPath:indexPath];
    cell.shadowOpacity = 1.0;
    cell.customSeparatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    cell.selectionGradientStartColor = [UIColor colorWithRed:0.725 green:0.882 blue:0.906 alpha:1];
    cell.selectionGradientEndColor = [UIColor colorWithRed:0.725 green:0.882 blue:0.906 alpha:1];
    
    Statuses *statuses = [tweets objectAtIndex:indexPath.row];
    
    [cell.profileImageView setImageWithURL:[NSURL URLWithString:statuses.user.profile_background_image_url]];
    
    cell.profileNameLabel.text = statuses.user.name;
    cell.profileNameLabel.font = [UIFont fontWithName:@"Vollkorn-Bold" size:12.0];
    
    cell.twitterTextLabel.text = statuses.text;
    cell.twitterTextLabel.font = [UIFont fontWithName:@"Vollkorn-Regular" size:12.0];

    cell.screenNameLabel.text = [NSString stringWithFormat:@"@%@", statuses.user.screen_name];
    cell.screenNameLabel.font = [UIFont fontWithName:@"Vollkorn-Regular" size:12.0];

    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Statuses *statuses = [tweets objectAtIndex:indexPath.row];
    CGSize constraint = CGSizeMake(206.0, 2000.0);
    CGSize textSize = [statuses.text sizeWithFont:[UIFont fontWithName:@"Vollkorn-Regular" size:12.0]
                                             constrainedToSize:constraint
                                                 lineBreakMode:NSLineBreakByTruncatingTail];
    
    float tableHeight = MAX(80.0, textSize.height + 27.0);
    
    return tableHeight;
}

#pragma mark - UITableviewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    Statuses *statuses = [tweets objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"DetailSegue" sender:statuses];
}

#pragma mark - segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"DetailSegue"]) {
        DetailViewController *controller = segue.destinationViewController;
        controller.statuses = sender;
    }
}

@end
