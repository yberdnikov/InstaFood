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
#import "NIWebController.h"

@interface DetailViewController () <UITableViewDataSource, UITableViewDelegate, NIAttributedLabelDelegate>

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
        cell.twitterTextLabel.autoDetectLinks = YES;
        cell.twitterTextLabel.linkColor = [UIColor blueColor];
        cell.twitterTextLabel.delegate = self;

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
        if (urls.count > 0) {
            Urls *url = [urls objectAtIndex:0];
            [cell.photoImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/media", url.expanded_url]]];
        }
        
        return cell;
    }
    
    return nil;
}

- (void)attributedLabel:(NIAttributedLabel *)attributedLabel didSelectTextCheckingResult:(NSTextCheckingResult *)result atPoint:(CGPoint)point
{
    NSLog(@"%@",result.URL.absoluteString);
    [self performSegueWithIdentifier:@"WebSegue" sender:result.URL];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"WebSegue"]) {
        NIWebController *controller = segue.destinationViewController;
        [controller openURL:sender];
    }
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
