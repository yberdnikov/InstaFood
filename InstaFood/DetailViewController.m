//
//  DetailViewController.m
//  InstaFood
//
//  Created by Daniel-Mac on 24/10/12.
//  Copyright (c) 2012 MagicDev. All rights reserved.
//

#import "DetailStatusCell.h"
#import "DetailViewController.h"
#import "User.h"
#import "UIImageView+AFNetworking.h"
#import "DetailImageCell.h"
#import "Urls.h"
#import "Url.h"
#import "Entities.h"
#import "AFJSONRequestOperation.h"

@interface DetailViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation DetailViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Tableview

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        DetailStatusCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"FirstCell"];
        [cell prepareForTableView:tableView indexPath:indexPath];
        cell.shadowOpacity = 1.0;
        cell.customSeparatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
        cell.cornerRadius = 0.0;

        
        cell.profileNameLabel.text = _statuses.user.name;
        cell.profileNameLabel.font = [UIFont fontWithName:@"Vollkorn-Bold" size:16.0];
        
        cell.twitterTextLabel.text = _statuses.text;
        cell.twitterTextLabel.font = [UIFont fontWithName:@"Vollkorn-Regular" size:14.0];
        
        cell.screenNameLabel.text = [NSString stringWithFormat:@"@%@", _statuses.user.screen_name];
        cell.screenNameLabel.font = [UIFont fontWithName:@"Vollkorn-Regular" size:16.0];
        
        [cell.profileImageView setImageWithURL:[NSURL URLWithString:_statuses.user.profile_background_image_url]];
        return cell;
    }
    else if (indexPath.row == 1) {
        DetailImageCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"SecondCell"];
        [cell prepareForTableView:tableView indexPath:indexPath];
        cell.shadowOpacity = 1.0;
        cell.customSeparatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
        cell.cornerRadius = 0.0;
        
        NSArray *urls = _statuses.entities.urls;
        NSLog(@"urls: '%@'", urls);
        Urls *url = [urls objectAtIndex:0];
        NSURL *instaURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.instagram.com/oembed?url=%@", url.expanded_url]];
        
        AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:[NSURLRequest requestWithURL:instaURL]
                                                        success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                                            
                                                            [cell.photoImageView setImageWithURL:[NSURL URLWithString:[JSON objectForKey:@"url"]]];
                                                            
                                                        } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                                            
                                                            NSLog(@"%@", [error localizedDescription]);
                                                            
                                                        }];
        
        [operation start];
        
        return cell;
    }
    
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            CGSize constraint = CGSizeMake(275.0, 2000.0);
            CGSize textSize = [_statuses.text sizeWithFont:[UIFont fontWithName:@"Vollkorn-Regular" size:14.0]
                                        constrainedToSize:constraint
                                            lineBreakMode:NSLineBreakByTruncatingTail];
            
            float tableHeight = MAX(80.0, textSize.height + 80.0);
            return tableHeight;
        }
            break;
        case 1:
            return 291;
            break;
        default:
            return 80;
            break;
    }
}

@end
