//
//  ExploreCell.h
//  InstaFood
//
//  Created by Daniel-Mac on 22/10/12.
//  Copyright (c) 2012 MagicDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PrettyKit.h"
#import "NIAttributedLabel.h"

@interface ExploreCell : PrettyTableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *profileBorder;
@property (nonatomic, weak) IBOutlet UIImageView *profileImageView;
@property (nonatomic, weak) IBOutlet UILabel *profileNameLabel;
@property (nonatomic, weak) IBOutlet NIAttributedLabel *twitterTextLabel;

@end
