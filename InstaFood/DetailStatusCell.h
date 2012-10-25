//
//  DetailCellOne.h
//  InstaFood
//
//  Created by Daniel-Mac on 25/10/12.
//  Copyright (c) 2012 MagicDev. All rights reserved.
//

#import "PrettyTableViewCell.h"
#import "NIAttributedLabel.h"

@interface DetailStatusCell : PrettyTableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *profileImageView;
@property (nonatomic, weak) IBOutlet UILabel *profileNameLabel;
@property (nonatomic, weak) IBOutlet NIAttributedLabel *twitterTextLabel;
@property (nonatomic, weak) IBOutlet UILabel *screenNameLabel;

@end
